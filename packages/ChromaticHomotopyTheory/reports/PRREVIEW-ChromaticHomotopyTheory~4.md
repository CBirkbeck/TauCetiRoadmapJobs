# Review of ChromaticHomotopyTheory (pull request #1643 at b049bb3)

**Verdict:** needs changes

This is an incremental re-review of the 15 lines changed since 839e6dc. There are two P3 findings and no P1 or P2. The diff makes one change: it deletes the eight uncited reference entries and rewrites the hahn-wilson note, and both edits are correct. The other two findings of the previous review are carried forward. One is a gap the board's plan still does not declare, and the other is the branch's Tau Ceti pin, which is still stale.

## R01 (P3) — The plan still does not declare `gap:higher-ambidexterity-norms`

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:85`, “What BordismFormalGroups must provide (gap:higher-ambidexterity-norms): F6.5: For every ∞-category C and every m≥−2, construct the canonical Hopkins–Lurie norm Nm_q:q_!→q_*”. The contract is consumed at README:363, :393 and :444. The board file is `packages/ChromaticHomotopyTheory/design/plan.json`, top-level `gaps`.

**Claim:** The board repair deleted the four stale entries the previous R01 named (`stable-james-splitting`, `weak-ring-finite-postnikov`, `bhls-purity-comparison` and `bhls-bp-redshift`), but it did not add the slug that the README declares. The plan's `gaps` now holds only `p-local-finite-duality` and `spectral-ringed-sites`, and these are the only two gaps the intake treats as declared. A README contract counts as declared only when the plan carries the same slug. The intake will therefore never announce the norm contract to BordismFormalGroups. Yet §4.2 depends on it: README:363 says “Use the Hopkins–Lurie norms and cardinalities of BordismFormalGroups F6.5, with the domain specified in gap:higher-ambidexterity-norms”.

**Witness:** board commit bfa6fe4c changes `plan.json` by 24 deletions and 0 insertions. `roadmaps grep -i ambidext` finds the norm contract only in this README. BordismFormalGroups on main (F6.5 is at README:1526, “Local group actions and completion comparisons”) contains no higher norm and no ambidextrous cardinality, and neither does any open head. Its one use of “cardinality” (README:2767) is the set-theoretic bound for F6.1's localization.

**Repair (on the board, in `plan.json` only; the pull-request folder needs no edit):** append `{"slug": "higher-ambidexterity-norms", "supplier": "BordismFormalGroups", "section": "F6.5, local group actions and completion comparisons", "needs": "<the sentence of README:85 after “F6.5: ”>"}` to `gaps`. With that entry, the README's five `gap:` slugs resolve as follows:
- three are declared in this plan;
- `elliptic-spectral-affineness` and `all-height-morava-realization` stay inherited from GeneralAlgebraicKTheoryPartII, as recorded before.

## R02 (P3) — Two Tau Ceti declarations are cited at a pin that does not contain them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`, “Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`” and “Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category”. The same claims recur at README:71, “from `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`”, at README:111 and README:405, and at `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean:9`.

**Claim:** This was the previous R02, and it is not repaired. The branch was not rebased: its merge base with main is still d2e0f0d3, and `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`. At that pin:
- `TauCeti/AlgebraicTopology/` has neither `SerreClass/` nor `Spectra/`;
- a recursive grep of `.lake/packages/TauCeti/TauCeti` for `isKilledBySomePower|SymmetricSpectrum` returns nothing.

So the two “already supplies” claims, the file path, the §4.3 route step and the docstring sentence cannot be verified at the pin this branch builds against.

**Witness:** main's manifest pins Tau Ceti at `2fd255d9`. Reading that commit from the package's git objects shows both declarations:
- `SerreClass/PowerTorsion.lean:33`: `def isKilledBySomePower (d : ℕ) : ObjectProperty AddCommGrpCat.{u}`, with its `IsSerreClass` instance at `:44`;
- `Spectra/SymmetricSpectrum.lean:92`: `abbrev SymmetricSpectrum := Mod SymmetricSequence.{0} SymmetricSequence.sphere`.

The Mathlib carriers cited alongside them are present at the branch pin `6b7abb3c`: `FormalGroup` at `RingTheory/FormalGroup/Basic.lean:56`, `IsSerreClass` at `CategoryTheory/Abelian/SerreClass/Basic.lean:45` and `ObjectProperty.isLocal` at `CategoryTheory/ObjectProperty/Local.lean:43`.

**Repair:** rebase the branch onto current main, so that `lake-manifest.json` comes from main and pins Tau Ceti at `2fd255d9` or later. The outside-folder diff stays empty, the README and the docstring become correct as written, and the gate's build should then be re-run. If the branch keeps the old pin, the alternative is to delete:
- the `isKilledBySomePower` and `SymmetricSpectrum` sentences at README:17, :71, :111 and :405;
- the docstring paragraph at Suggested.lean:9–11.

In that case, also cite DGFloer Layer 1 item 4's power-torsion Serre class without naming a Lean carrier.

## Previous findings

- R01 — partly repaired: the plan's four stale gap entries are gone (board commit bfa6fe4c). README:85 still declares `gap:higher-ambidexterity-norms`, and the plan has no such slug. Carried forward as R01 above.
- R02 — not repaired: `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`. README:17 still says “Tau Ceti already supplies … `AddCommGrpCat.isKilledBySomePower`”, and README:71 names `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`, absent at that pin. Carried forward as R02 above.
- R03 — repaired: `## References` now lists 14 keys, each cited in the body. kuhn-guide, kuhn-tate, cmnn, thom, akq, miller, mahowald and mahowald-addendum are deleted, and the preamble's locator-only sentence went with `abs`.

No visible repair report marks any previous finding as not actionable, so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction and Lean

- **Gate.** I re-ran the gate command on this head. It printed `set_option=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, matching the worker's gate, which also reports `build=0`.
- **Dependency check.** It printed:

  ```text
  depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
  ```

  There was no UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists ChromaticHomotopyTheory at line 333, after RefinedTraceMethods (327), StableHomotopyKTheoryPartII (330) and GeneralAlgebraicKTheoryPartII (332).
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no diagnostics.
- **Suggested.lean contents.** The file has one `import Mathlib`, one module docstring and an empty namespace. With zero declarations there is nothing to probe for padding, no `#check @name` comparison to make, no sorry'd data and no `set_option`. The diff did not touch this file.
- **Scope of the change.** The outside-folder diff is empty. The overlaps file reports no other open pull request changing this roadmap and no dropped or revision-only ids, and the citations file reports no unresolved name.

### The changed passages

- **The eight deletions.** I grepped README lines 1–495 for each key, as `(key`, `key line`, `; key` or followed by a locator word. Every deleted key has 0 body citations. Every remaining key has at least 2: lmmt 12, hs 16, ravenel 6, cm-tate 4, hahn 3, csy 30, bhm 2, mm 6, behrens 11, goerss 2, bhls 11, greenlees-sadofsky 2, hesselholt-ku 3 and hahn-wilson 2.
- **Author-name mentions.** The remaining mentions of the deleted authors name objects, not sources: “Bousfield–Kuhn functor” at :9, :137 and :145, and “Hopkins–Mahowald” at :10. The one remaining attribution, the Check at README:355 (“agreeing with Kuhn’s theorem”), is backed by its own *Needs:* line (README:347, GeneralAlgebraicKTheoryPartII §4.24, localized Tate vanishing) and by the cm-tate entry, so no source of the Check was lost.
- **Preamble sentence.** Dropping “Locator-only sources are marked explicitly” is correct, because all 14 remaining entries carry a link and the only locator-only entry, `abs`, went with the real Bott layer.
- **hahn-wilson note.** It now reads “the trace factors through the nonzero height-(h+1) detector used by the BP model theorem of Part II”. I reopened both ends of it:
  - hahn-wilson line 1422 (Corollary 5.0.2, p.40) gives L_K(m)K(BP⟨n⟩)≠0 for 0≤m≤n+1.
  - In its proof (lines 1426–1438), the trace K→TC→THH^hS¹→THH(BP⟨n⟩/MU)^hS¹ is a chain of E₂-ring maps, and the K(m)-localized target is computed nonzero.
  - The consumer exists: README:25 is the “BP model theorem (Part II)”, whose clause T(h+1)⊗TC(BP⟨h⟩)≠0 cites hahn-wilson line 1422.
  - bhls line 3225 (Theorem 6.25 proof, p.74) takes exactly this nonvanishing from [HW22].
  - The previous wording pointed at the retired bhls supplier contract, so the new wording is the accurate one.

### Seeded sample

None of the six seeded targets (§3.1 README:305, §4.1 :345, §4.2 :361, §4.3 :395, §4.4 :416, §5.1 :448) is in the diff, and none cites a deleted key. Their locators carry over from the previous review's seeded table. I reopened the anchor lines, and each still says what the target cites it for:

| Target | Line reopened | Content at the line |
| --- | --- | --- |
| 3.1 | lmmt line 398 | proof of Proposition 2.11(ii) via the Serre spectral sequence in T(i)-homology |
| 3.1 | bhm line 258 | Lemma 3.5 |
| 4.1 | greenlees-sadofsky line 343 | Corollary 2.4 |
| 4.1 | hesselholt-ku line 1658 | Tate-valued Frobenius on complex K-theory |
| 4.1 | cm-tate line 129 | Remark 2.8 |
| 4.2 | csy line 3882 | Theorem 5.3.1, for all n≥0 |
| 4.2 | csy line 3930 | Theorem 5.3.5: π-finite n-connected fibres |
| 4.3 | lmmt line 406 | Remark 2.12: m=n+1 |
| 4.4 | csy line 4036 | Theorem 5.4.4: nonzero p-local weak ring, 0≤n<∞ |
| 4.4 | csy line 4060 | Remark 5.4.5 |
| 5.1 | mm line 1801 | Theorem 7.6: faithful GL₂(ℤ/nℤ)-Galois |

### Adversarial values

The first four rows are new and cover the changed passages. The rest are carried forward unchanged from the previous review (PRREVIEW-ChromaticHomotopyTheory~3), where the values were computed, because the diff leaves those statements untouched. For carried rows the last column is the result.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| hahn-wilson note: the trace factors through a nonzero height-(h+1) detector | h=1, p=2; general h | K(BP⟨h⟩)→TC→THH^hS¹→THH(BP⟨h⟩/MU)^hS¹, E₂-ring maps. At m=h+1 the K(h+1)-local target is ≠0, so L_K(h+1)TC(BP⟨h⟩)≠0; ⟨K(h+1)⟩≤⟨T(h+1)⟩ and T⊗X≃T⊗L_T X then give T(h+1)⊗TC≠0, which is the BP model theorem's clause. At h=1: T(2)⊗TC(BP⟨1⟩)≠0, as used at bhls line 3225 | Pass; new |
| References preamble after deletions | the 14 keys | 14 entries; 14 with a link; 14 with ≥2 body citations; 0 locator-only | Pass; new |
| Deleted keys uncited | the 8 deleted keys | body hits: kuhn-guide 0, kuhn-tate 0, cmnn 0, thom 0, akq 0, miller 0, mahowald 0, mahowald-addendum 0 | Pass; new |
| §4.1 Check “agreeing with Kuhn’s theorem” | KU_p^∧ with trivial C_p | raw π₀=ℚ_p(ζ_p)≠0; L_T(1) of the Tate spectrum is 0 by GeneralAlgebraicKTheoryPartII §4.24 (README:347) | Pass; new |
| Homological grading and symmetry | ΣS in degree 1; S¹∧S¹ swap | π₁ΣS=ℤ=π₀S; sign (−1)^(1·1)=−1 | Pass (r3) |
| Cofiber conventions | id_S; 0→S | cofib=0; cofib=S | Pass (r3) |
| T(0)=S[1/p] versus Hℚ | p=2,q=3; the integer 4 | S[1/2]∧S/3=S/3≠0, Hℚ∧S/3=0; 4·(ℤ/2)=0, (ℤ/4)[1/2]=0 | Pass (r3) |
| Cover index | K(A,2), r=2,3 | K(A,2)⟨3⟩=*; τ_≤2K(A,2)=K(A,2); index 2 keeps π₂=A | Pass (r3) |
| Multiplicative p-series | p=2,3 | 2X+X²→X²; 3X+3X²+X³→X³ | Pass (r3) |
| ψ_(−1) and Δ²⁴ | height 1, odd p; Δ²⁴ | u↦−u, square is the identity; weight 288, degree 576 | Pass (r3) |
| Finite p-local sphere | π₀S_(p); q≠p on S/p | ℤ_(p); q a unit mod p | Pass (r3) |
| p-local duality and target | D(S/p); V=S_(p), X=Hℤ | fib(p)=Σ⁻¹S/p; Hom(ℤ_(p),ℤ)=0 versus ℤ_(p) | Pass (r3) |
| Geometric height | additive / multiplicative over 𝔽₂ | [2]=0 (height ∞) / X² (height 1) | Pass (r3) |
| v-degrees and BP | p=2,3 | |v₁|=2,4; π₂BP=0, π₂MU_(3)=ℤ_(3) | Pass (r3) |
| Type and smash | S_(p), S/p, 0 | types 0, 1, ∞; max(0,1)=1 | Pass (r3) |
| Nilpotence endpoint | R=H𝔽_p | K(i)∧R=0 for all finite i; H𝔽_p∧R≠0 | Pass (r3) |
| 3.1 degenerate bases | Y=*; Y=∅; E=0 | E_*(F_+); 0; 0 | Pass (r3) |
| 3.1 differentials and cells | d_r at (s,t); one s-cell | (s−r,t+r−1); Σ^s(E⊗Σ∞_+F) | Pass (r3) |
| 3.1 monodromy | reflection torus, E=Hℤ | 1−(−1)=2; H₁=ℤ⊕ℤ/2, H₂=0 | Pass (r3) |
| 3.1 non-cellular naturality | I, t↦t/2 | H₀ map id: ℤ→ℤ | Pass (r3) |
| 3.1 periodic coefficients, infinite base | KU, ℂP^∞ | E²=ℤ at even (s,t); all d_r=0 | Pass (r3) |
| 3.1 bounded-below hypothesis | constant filtration S | graded pieces 0, colimit S | Pass, negative control (r3) |
| 4.1 Euler inversion | p=2 | ((1+z)²−1)/z=2+z, so z=−2, giving ℚ₂ | Pass (r3) |
| 4.1 Euler inversion | p=3 | z²+3z+3 is Eisenstein, giving ℚ₃(ζ₃), degree 2 | Pass (r3) |
| 4.1 against StableHomotopyKTheoryPartII §7.2 | p=2,3 | ℚ₂ and ℚ_p(ζ_p) in x=L−1; same values | Pass (r3) |
| 4.1 raw versus localized | KU_p^∧ | K(1)-local; L_T(1) Tate=0; raw π₀≠0 | Pass (r3) |
| Sphere and Hℤ Tate | trivial C_p on S; C₂ on Hℤ | π₀=ℤ_p; ℤ/2 in even degrees, 0 in odd | Pass (r3) |
| Two-point norm (gap) | {a,b}→* | X⊕X→X×X is the identity matrix | Pass (r3) |
| Rational BC_p cardinality (gap) | Sp_ℚ | |BC_p|=p⁻¹; the wrong model (norm instead of its inverse) gives p | Pass (r3) |
| Weak 2-ambidexterity fails in Sp (gap) | B²C_p→* | norm on π₀H𝔽_p is p=0 | Pass (r3) |
| 4.2 Sp_T(0) not 1-semiadditive | p=2, H𝔽₃ | C₃ norm is 3=0 | Pass (r3) |
| 4.2 dim BC_p | n=1,2 | rank p, p²=p^(binom(n,1)) | Pass (r3) |
| 4.2 dimension formula | n=k=2; k>n; n=0 | p versus wrong model p⁴; 1; rational ranks p, 1 | Pass (r3) |
| 4.2 evenness | X=S¹ | κ₁≠0, dim=1−1=0 | Pass (r3) |
| 4.2 connectivity cannot drop | n=1: BC_p versus K(C_p,2) | reduced K(1)-rank p−1 versus 0 | Pass (r3) |
| 4.3 bound at n=1 | K(ℤ/p,2); BC_p | reduced rank 0; p−1 | Pass, bound 2 sharp (r3) |
| 4.3 bound at n=2 | K(ℤ/p,3); K(ℤ/p,2) | reduced ranks 0; p−1 | Pass, bound 3 sharp (r3) |
| 4.3 height zero | q≠p, K(ℤ/q,n+1) | H̃_(n+1)(;ℤ[1/p])=ℤ/q≠0; ⊗ℚ=0 | Pass (r3) |
| 4.3 third assertion | Σ^(n+1)H𝔽_p; Σ^nH𝔽_p | acyclic; not a T(n)-equivalence | Pass (r3) |
| 4.3 Serre class | ℤ/4 | killed by 2² but not by 2; in the some-power class | Pass (r3) |
| 4.4 weak-ring unit law | Hℚ with μ=0; S | 1↦0 fails; S passes | Pass (r3) |
| 4.4 four conditions | R=Hℚ, n=0 | S/p⊗Hℚ=0; H̃_*(BC_p;ℚ)=0; K(j)⊗Hℚ=0 | Pass (r3) |
| 4.4 ∞ endpoint | R=H𝔽_p | K(j)⊗R=0 for finite j; K(∞)⊗R≠0 | Pass, endpoint needed (r3) |
| 4.4 Morava K | R=K(n) | supp {n}; F(n+1)⊗K(n)=0 | Pass (r3) |
| 4.4 sphere | R=S_(p) | all four conditions fail together | Pass (r3) |
| 4.4 weak-ring hypothesis | I_(ℚ/ℤ) | supp ∅, F(n+1)⊗I≠0 | Pass, negative control (r3) |
| 5.1 trivial group and zero ring | G=1; A=0 | B^h1=A; all 0 | Pass (r3) |
| 5.1 split torsors | C₂, A²; S₃, A⁶ | A⁴; 36=36 | Pass (r3) |
| 5.1 faithfulness independent | A=Hℤ, B=0 | B⊗_AA=0 with A≠0 | Pass (r3) |
| 5.1 group orders | N=1,2,3,5 | 1; 6; 48; 480 | Pass (r3) |
| 5.1 row action | N=3, unipotents | ((P,Q)g)h=(2P+Q,P+Q)≠((P,Q)h)g=(P+Q,P+2Q) | Pass (r3) |
| 5.1 determinant components | diag(−1,1) | ζ↦ζ⁻¹; 48/24 | Pass (r3) |
| Honda quotient | p=2,h=1; p=3,h=1 | 𝔽₄, val 1/2; 𝔽₉, val 1/3 | Pass (r3) |
| Part II fixed points not connective | p=2, n=2, k=0 | π₋₁=H¹(ℤ;ℤ₂)=ℤ₂ | Pass (r3) |
| Part II fp-type index | ku₂^∧, U=cofib(v₁⁴ on S/2) | 𝔽₂[v₁]/v₁⁴; fp-type 1, not 0 | Pass (r3) |
| Part II acyclic ring | C=Hℤ_p, n=2 | L_T(2)K(ℤ_p)=0 | Pass (r3) |
| Part II witness range | bhls Theorem A | any prime, n+1≥2, k≥0 | Pass (r3) |

### Ownership and contracts

- **Ownership and contracts.** The diff moves no ownership and touches no supplier contract. The supplier resolution table of the previous review stands for this head: GeneralAlgebraicKTheoryPartII, RefinedTraceMethods, StableHomotopyKTheory(PartII), DGFloer, BordismFormalGroups, GeneralizedCohomology, EllipticCohomology, EnhancedDerivedSheaves, AlgebraicTopology and ModularCurves.
- **The norm contract.** I re-ran `roadmaps grep -i ambidext` for the contract at issue in R01. It hits only this README and a csy reference line in GeneralAlgebraicKTheoryPartII, so the contract still has one requester and no second builder.
- **Declared gaps.** `p-local-finite-duality` (README:77) and `spectral-ringed-sites` (README:99) match the plan's two entries word for word.

## Not verifiable

- The printed page 844 of `hesselholt-ku` was not seen. The extraction's page marker reflects the report's own offset, and the cited formula is at extraction line 1662.
- The Ravenel–Wilson rank p^(binom(n,k)) was checked where csy line 3660 quotes it, not against Ravenel–Wilson's text.
- Whether the repair answer, posted as a pull-request comment, marked anything not actionable: no repair report for the previous round is on the board, and I did not read pull-request comments.

## Source issues

- none
