# Review of ChromaticHomotopyTheory (pull request #1643 at 492fe6d)

**Verdict:** needs changes

This is an incremental re-review of the 33 changed lines since `31ab257`. Four of the five previous findings are repaired, and the repairs introduce no new defect. One P3 finding remains: the Tau Ceti pin, carried over unrepaired. There is no P1 or P2 finding, the gate passes, and the dependency check is clean.

## R01 (P3) — Two Tau Ceti declarations are cited at a pin that lacks them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`: "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower` …" and "Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category …". The same names appear at README:71 (with the path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), README:101 and README:401, and at `Suggested.lean:9–11`.

**Claim:** This is R04 of the previous review, still unrepaired. The branch builds against a Tau Ceti that has neither declaration. The "already supplies" claims, the file path and the §4.3 route step therefore cannot be checked at the pin the branch uses.

**Witness:** The branch's `lake-manifest.json` pins TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In that package, `TauCeti/AlgebraicTopology/` has no `SerreClass/` and no `Spectra/`, and a recursive grep for `isKilledBySomePower` or `SymmetricSpectrum` finds no file. Main's manifest pins `2fd255d9`, which has `SerreClass/PowerTorsion.lean:33`.

**Repair:** Rebase the branch on current main so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later, then re-run the targeted build. The README and the docstring are then correct as written. If the old pin has to stay instead, delete the sentences that name these two declarations at README:17, :71, :101 and :401 and at Suggested.lean:9–11, and cite DGFloer Layer 1 item 4's power-torsion Serre class without a Lean name. The rebase was checked against main's pinned copy: `isKilledBySomePower (d : ℕ) : ObjectProperty AddCommGrpCat` is at line 33 there, and `SymmetricSpectrum` is in `Spectra/`.

## Previous findings

- R01 — repaired: README:430 now uses "R′=I_(ℚ/ℤ)⊗S_(p) … π₀R′=ℚ/ℤ⊗ℤ_(p)=ℤ/p^∞, so R′ is nonzero and p-local". It keeps empty support and F(n+1)⊗R′≠0, and cites csy Example 5.1.13(4) and Theorem 5.1.14.
- R02 — repaired: README:369 now proves nil-conservativity directly: "for an algebra R in Sp_T(n) … L_(K(n))R=0 means K(n)⊗R=0, so T(n)⊗R=0 by GeneralAlgebraicKTheoryPartII §4.4". The §4.3 citation is gone, and the *Needs:* line at :389 cites §4.4.
- R03 — repaired: the EllipticCohomology E5 sentence (README:11) and E5 clause (README:105) are deleted. So are the Honda paragraph, its three Checks and the now-uncited `hahn` reference entry. "EllipticCohomology E5" has 0 hits, and `hahn` has 0 body citations.
- R04 — not repaired: `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`, and README:17, :71, :101, :401 and Suggested.lean:9 still name `isKilledBySomePower` and `SymmetricSpectrum`. It is carried forward as R01 above.
- R05 — repaired: README:399 now reads "every admissible m satisfies m≥n+1 by GeneralAlgebraicKTheoryPartII §4.15, whose first Check gives the witness K(ℤ/p,n)". The "For the lower bound use …" sentence is deleted, and the *Needs:* line at :410 is updated.

There is no repair report on the board for this head, and no finding is marked not actionable, so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction, Lean

- **Gate**, re-run on this head with the brief's command, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- **Dependency check** (the brief's command, output in full):

  ```text
  depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, GeneralAlgebraicKTheoryPartII is at line 331 and ChromaticHomotopyTheory at 332. The supplier head read is #1742 at `3f10248`, which matches the index.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no diagnostics. The file is unchanged by this diff: `import Mathlib`, one module docstring that names all six headline theorems (§§3.1, 4.1–4.4 and 5.1) as not statable, each with its missing carrier, and an empty namespace. It has no declarations, so there is nothing to `#check` or probe for padding.
- **Outside the folder.** `git diff --stat origin/main...HEAD` shows only the three folder files. `changes.md` lists no outside change.

### The changed passages, checked against the supplier at its head (GeneralAlgebraicKTheoryPartII `3f10248`)

- Scope README:7, "§§4.15–4.16 own … an existential bound m, and the lower bound m≥n+1". This matches its line 915 ("every admissible m satisfies m≥n+1 (Checks)") and the first Check at line 923, which uses K(ℤ/p,n), reduced K(n)-rank p−1 and ⟨K(n)⟩≤⟨T(n)⟩.
- The rewritten contract at README:127 was checked item by item against the head:
  - §4.2: Ω∞ agreement at positive height (line 677) and the height-zero groups π_*(X)[1/p] (line 668).
  - §4.4: n≥1 and "any associative unital ring spectrum R" (line 708).
  - §4.5: L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)) with units (line 724).
  - §4.14: "no finiteness hypothesis on Y and no boundedness hypothesis on E" (line 898).
  - §4.15: as above.
  - §4.16: m-connective preservation (line 931).
  - §4.20: ⟨T(1)⟩=⟨K(1)⟩ (line 995).
  - §4.22: L_E(X_hG)→X^hG with cofiber L_E(X^tG) (line 1028).
  - §4.24: n≥1, every finite G and every T(n)-local X (line 1066).

  All nine match.
- Every GeneralAlgebraicKTheoryPartII section that Layers 3–5 consume (README:341, 361, 369, 389, 395, 399, 401, 410, 423, 432) is now in the contract. The Layer 4 *Dependencies* line (README:440), §§4.2, 4.4–4.5, 4.14–4.16, 4.20, 4.22 and 4.24, is exactly the union of the Layer 4 *Needs:* lines. The other section numbers in the README are mentions, not consumption: §4.19 at :21 (the limit of a comparison), §4.28 at :47 (a notion kept distinct) and §6.5 at :27 (said not to state the input). The deleted contract text consumed §§4.3, 4.6–4.13, 4.18–4.19, 4.21, 4.23 and 4.25–4.33. No target cites any of them now: a grep of Layers 0–5 finds none, and "Bousfield–Kuhn" survives only in the scope bullet at :9.
- Part II contract, README:131. "§4.6's smashing finite localization L_(n−1)^(p,f), whose kernel is generated by the finite p-primary-torsion spectra of type at least n" is GeneralAlgebraicKTheoryPartII line 748 with n replaced by n−1≥1. "§4.45's vanishing L_T(i)K(ℤ)=0 for i≥2" is its line 1543. Both were already used at README:35 and :25, so the contract now matches the text.
- §4.2 nil-conservativity, README:369. csy's notion quantifies over R∈Alg(C) (csy line 3481). An algebra in Sp_T(n) is an associative unital ring in Sp along the lax monoidal inclusion, so GeneralAlgebraicKTheoryPartII §4.4 applies. Then L_(K(n))R=0 ⇔ K(n)⊗R=0 ⇒ T(n)⊗R=0 ⇒ R=L_(T(n))R=0. csy Proposition 5.1.15 (line 3753, p.76) reaches the same conclusion through supp(T(n))={n} (csy line 3719).
- §4.3 locators, README:399. lmmt Remark 2.12 is at lmmt line 406, p.10 (page marker at line 396). Its argument cites "[CSY22, Theorem E]" (lmmt line 411), which is csy Theorem 5.4.4 (csy line 173 and line 4036, p.83). The step (1)⇒(2) of that theorem "follows from Corollary 5.3.7" (csy line 4045), and Corollary 5.3.7 is the localization form of Theorem 5.3.5 (csy line 3930, p.80). So "whose argument rests on csy, Theorem 5.3.5" holds, through Theorem E.
- §4.4 Check, README:430: csy Example 5.1.13(4) is at csy line 3726 and Theorem 5.1.14, for p-local weak rings, at line 3731, both on p.76 (page marker at line 3722).
- Ownership: searching every open head and main for "Brown–Comenetz" and "nil-conservativ" finds only this folder and one unrelated nilpotence Check in GeneralAlgebraicKTheoryPartII (line 1744). The repair removes this roadmap's second statement of the lower bound, so §4.15 is its only owner. `overlaps.md` and `citations.md` list nothing, and `roadmaps resolve` on this head reports no unresolved citation and no unresolved Lean name.

### Seeded sample, anchors reopened at this head

| Target | Changed here? | Anchor reopened | Supports the text? |
| --- | --- | --- | --- |
| 3.1 | no | lmmt line 398 (p.10, Serre spectral sequence in T(i)-homology); bhm line 258 (Lemma 3.5) | Yes (r7) |
| 4.1 | no | greenlees-sadofsky line 343 (Cor. 2.4); hesselholt-ku lines 1658–1662 (π_*KU^tC_p=π_*KU⊗ℚ_p(μ_p)); cm-tate line 129 (Remark 2.8) | Yes (r7) |
| 4.2 | proof route | csy line 3882 (Thm 5.3.1); 3481 (nil-conservative, over Alg(C)); 3753 (Prop. 5.1.15, p.76); 3773 (p.77) | Yes, with the new §4.4 argument |
| 4.3 | locator sentence, route, *Needs:* | lmmt lines 406–415; csy lines 173, 3930, 4036, 4045 | Yes (see above) |
| 4.4 | last Check | csy lines 3726 and 3731 (p.76); 4036 (Thm 5.4.4, p.83) | Yes |
| 5.1 | no | mm line 1801 (Thm 7.6: faithful GL₂(ℤ/nℤ)-Galois for every n) | Yes (r7) |

The README flags no locator as unverified.

### Gaps

The diff touches no gap line. `design/plan.json` declares `p-local-finite-duality` (supplier GeneralizedCohomology) and `spectral-ringed-sites` (supplier EnhancedDerivedSheaves). The README states both under their suppliers, at :77 and :89. `elliptic-spectral-affineness` and `all-height-morava-realization` (README:107, :109) are still declared at GeneralAlgebraicKTheoryPartII's head, lines 210 and 212. The previous review's precision and minimality assessment stands.

### Adversarial table

Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-ChromaticHomotopyTheory~7) with their values. Rows marked **new** cover the changed statements and were computed for this report.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| **new** §4.2 nil-conservativity via §4.4 | n=1: R=L_T(1)S, R=L_T(1)Hℤ | L_K(1)L_T(1)S=L_K(1)S≠0 (π₀⊇ℤ_p); K(1)⊗Hℤ=0 ⇒ T(1)⊗Hℤ=0 ⇒ L_T(1)Hℤ=0; at n=1, ⟨T(1)⟩=⟨K(1)⟩ (§4.20) makes L_K(1) the identity on Sp_T(1) | Pass (old R02 repaired) |
| **new** §4.2 ring hypothesis is needed | n=2, BHLS X; Y=fib(X→L_K(2)X) | Y is T(2)-local and nonzero, with L_K(2)Y=0. A bare spectrum breaks conservativity, and the repaired argument uses an algebra | Pass |
| **new** §4.3 lower bound imported | GeneralAlgebraicKTheoryPartII §4.15 at n=1, 2 | its line 915: m≥n+1; its Check: K(ℤ/p,n), reduced K(n)-rank p^(binom(n,n))−1=p−1 ⇒ m≥2, m≥3; README:399 m=n+1: 2, 3 | Pass (old R05 repaired) |
| **new** §4.3 upper-bound locator | lmmt line 411 → csy | lmmt cites CSY Thm E = csy 5.4.4 (line 4036); its (1)⇒(2) is Cor. 5.3.7 (line 4045) ⇐ Thm 5.3.5 (line 3930) | Pass |
| **new** §4.3 *Needs:* §4.5 | n=0, n=1 | L_0^(p,f)S=S[1/p] (its Check, line 739); acyclicity for S[1/p] and T(1),…,T(n) separately ⇒ L_n^(p,f)-acyclic | Pass |
| **new** §4.4 p-local Brown–Comenetz control | p=2, p=3; n=0, F(1)=S/2 | π₀R′=ℤ/2^∞, ℤ/3^∞ (≠0, p-local); K(j)⊗R′=0 for 0≤j≤∞; π₁R′=Hom(π₋₁S,ℚ/ℤ)=0 ⇒ π₁(S/2⊗R′)=ker(2 on ℤ/2^∞)=ℤ/2≠0; unlocalized: 3·(1/3)=0 at p=2, 2·(1/2)=0 at p=3 | Pass (old R01 repaired) |
| **new** §4.4 R′ is not a weak ring | csy 5.1.14 at R′ | R′ p-local, supp ∅, R′≠0, which contradicts "R=0 iff supp=∅" for weak rings | Pass |
| **new** GeneralAlgebraicKTheoryPartII contract | nine items vs head lines 668–1066 | hypotheses n≥1 (4.4, 4.24), "any associative unital" (4.4), "no finiteness/boundedness" (4.14), "m≥n+1" (4.15) identical on both sides | Pass |
| **new** Layer 4 *Dependencies* = ∪ *Needs:* | §§4.1–4.4 | {4.20, 4.24} ∪ {4.4, 4.14, 4.22, 4.24} ∪ {4.2, 4.5, 4.14, 4.15, 4.16} ∪ {4.14} = {4.2, 4.4, 4.5, 4.14–4.16, 4.20, 4.22, 4.24} | Pass |
| **new** Part II §4.6, §4.45 | n=2; i=2 | L_1^(p,f) kernel generated by p-torsion type ≥2 = line 748 at n=1; L_T(2)K(ℤ)=0 = line 1543 | Pass |
| **new** E5 and Honda deletions | grep of README | "EllipticCohomology E5" 0 hits; "gl₁" 0; "Honda" 0; `hahn` key 0 body citations, entry deleted; 13 keys each cited at least twice | Pass (old R03 repaired) |
| **new** Tau Ceti pin | a91d3aaf vs 2fd255d9 | `SerreClass/`, `Spectra/` absent vs present (`PowerTorsion.lean:33`) | Finding R01 |
| 3.1 degenerate bases (r7) | Y=*; Y=∅; E=0 | E²_(0,t)=E_t(F_+); all 0; all 0 | Pass |
| 3.1 monodromy (r7) | Klein bottle, E=Hℤ | H₁=ℤ⊕ℤ/2, H₂=0 | Pass |
| 3.1 periodic coefficients (r7) | KU over ℂP^∞ | E² only in (even, even) ⇒ collapse | Pass |
| 3.1 convergence (r7) | any E | exiting differentials; StableHomotopyKTheory §7.24, no hypothesis on E | Pass |
| 4.1 Euler inversion (r7) | p=2; p=3 | 2+z ⇒ ℚ₂; z²+3z+3 Eisenstein ⇒ ℚ₃(ζ₃) | Pass |
| 4.1 completed vs uncompleted (r7) | ℤ[[t]]/Φ_p(1+t) vs ℤ_p[[t]]/Φ_p(1+t) | both ℤ_p[ζ_p] ⇒ ℚ_p(ζ_p) | Pass |
| 4.1 sphere (r7) | S, trivial C_p | S^tC_p≃S_p^∧, π₀=ℤ_p | Pass |
| 4.2 two-point norm (r7) | {a,b}→* | identity matrix, \|{a,b}\|=2; all-ones det 0 | Pass |
| 4.2 rational cardinality (r7) | Sp_ℚ, BC_p | \|BC_p\|=p⁻¹ | Pass |
| 4.2 dimension formula (r7) | n=1,2; k=0..3 | p, p, 1; p², p, 1; p^(nk) at n=k=2: p⁴ | Pass |
| 4.2 π-finite comparison (r7) | n=1: BC_p, K(C_p,2) | reduced K(1)-rank p−1 vs 0 | Pass |
| 4.3 sharp bound (r7) | n=1, 2 | K(ℤ/p,n+1): 0; K(ℤ/p,n): p−1 | Pass |
| 4.3 height-zero control (r7) | K(ℤ/q,n+1), q≠p | π_(n+1)[1/p]=ℤ/q≠0 | Pass |
| 4.3 infinite group (r7) | K(ℤ/p^∞,n+1) | colimit of acyclics ⇒ 0 | Pass |
| 4.4 four conditions (r7) | Hℚ, n=0 | all four true | Pass |
| 4.4 ∞ endpoint (r7) | H𝔽_p | K(∞)⊗H𝔽_p≠0; H̃_(n+1)=𝔽_p | Pass |
| 5.1 group orders (r7) | N=1, 2, 3, 5 | 1, 6, 48, 480 | Pass |
| 5.1 small levels (r7) | N=1; N=2 at p=2 | trivial group; BZ/2 factor (mm Ex. 7.5) | Pass |
| Conventions (r7) | ΣS; p-series | swap −1; [2](X)=2X+X², [3](X)=3X+3X²+X³ | Pass |
| Part II fixed points (r7) | p=2, n=2, k=0 | π₋₁(BP⟨1⟩^hℤ)=ℤ₂ | Pass |

### Remarks on untouched text (no change requested)

- Conventions, README:49, still fixes a convention for p-complete Thom spectra. With the EllipticCohomology E5 Thom contract deleted, its only possible use is §4.1's completed inverse Thom tower.
- GeneralAlgebraicKTheoryPartII's Downstream consumers paragraph (its README line 2476, at the head) still says that ChromaticHomotopyTheory "Layers 0–6 import §§4.2–4.16 and 4.18–4.33" and that Part II imports §6.5. This README now consumes fewer sections and says that §6.5 does not state its Part II inputs. That paragraph is the supplier's text and belongs to its own review.

## Not verifiable

- HL13, Proposition 3.4.3, which lies behind csy Lemma 5.1.7, is not in the source cache. This passage is untouched; the previous review's note stands.
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655.
- Pull-request comments were not read. No repair report for this head is on the board.

## Source issues

- **Error** in lmmt at Remark 2.12, p.10: the source reduces to T(i)⊗K(π,r)=0 for every finite π and 0≤i≤n, via CSY Theorem E for p-local rings, but T(0)=S[1/p] is not p-local and fails for π=ℤ/q; it should restrict to p-groups and treat i=0 by p-power torsion; affects the proof.
- **Misprint** in csy at §5.1, before Theorem 5.1.14, p.76 (csy line 3729): the source spells the attribution "Devintaz"; it should be Devinatz; affects nothing.
- **Misprint** in csy at the proof of Theorem 5.4.4, p.83 (csy line 4054): the source repeats the word "Lemma" before 5.1.6; it should name Lemma 5.1.6 once; affects nothing.
