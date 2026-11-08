# Review of ChromaticHomotopyTheory (pull request #1643 at 31ab257)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since 743da6e. The diff replaces, in the Scope and ownership bullet on GeneralAlgebraicKTheoryPartII, the clause that the stable James splitting is "requested from HomotopySpheres" by "using the stable James splitting of its §4.30c". That repair is correct: the heading `### 4.30c The stable James splitting` exists at the supplier's open head, its statement is the one §§4.32–4.33 there use, and the dropped name is gone from the README, so the gate now passes. One P3 finding is carried from the previous two reviews unrepaired; there is no P1 or P2.

## R01 (P3) — Two Tau Ceti declarations are cited at a pin that does not contain them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`, "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`" and "Tau Ceti's `TauCeti.SymmetricSpectrum` is the point-set category"; the same claims at README:71 (with the file path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), README:101, README:409, and at `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean:9`.

**Claim:** This is R02 of the previous review and R02 of the one before, and the head does not repair it. The merge base with main is still d2e0f0d3 and `lake-manifest.json` on the branch still pins Tau Ceti at `a91d3aaf`. The pinned package at that revision has no `TauCeti/AlgebraicTopology/SerreClass/` and no `Spectra/` directory, and a recursive grep of it for `isKilledBySomePower` or `SymmetricSpectrum` returns no file. The "already supplies" sentences, the file path at README:71, the §4.3 route step at README:409 and the docstring paragraph at Suggested.lean:9–11 therefore cannot be verified at the pin the branch builds against.

**Witness:** branch `lake-manifest.json`, `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"` for `TauCeti`; `ls .lake/packages/TauCeti/TauCeti/AlgebraicTopology/` at that pin lists Cellular, Cohomology, EilenbergMacLane, … UniversalCover and no SerreClass or Spectra; main's manifest pins `2fd255d9`, where the earlier review located `SerreClass/PowerTorsion.lean:33` and `Spectra/SymmetricSpectrum.lean:92`.

**Repair:** rebase the branch onto current main so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later; the README and the docstring are then correct as written, and the targeted build is re-run. If the branch keeps the old pin, delete the `isKilledBySomePower` and `SymmetricSpectrum` sentences at README:17, :71, :101 and :409 and the docstring paragraph at Suggested.lean:9–11, and cite DGFloer Layer 1 item 4's power-torsion Serre class without naming a Lean carrier.

## Previous findings

- R01 — repaired: README:10 now reads "§§4.31–4.33 own Hopkins–Mahowald and filtered Thom families with their acyclicity and the James application, using the stable James splitting of its §4.30c"; `HomotopySpheres` no longer occurs in the folder; the gate prints `dropped=0`.
- R02 — not repaired: `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`; README:17 and :71 still name `isKilledBySomePower` and the `SerreClass/PowerTorsion.lean` path. Carried forward as R01 above.

No repair report marks any previous finding as not actionable, so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction and Lean

- **Gate.** Re-run on this head with the brief's command: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The project's dropped-names list still has `HomotopySpheres` at its line 1; the README no longer mentions it. The worker's gate on this head also reports `build=0`.
- **Dependency check.** The brief's depcheck command printed:

  ```text
  depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The changed clause cites no new roadmap: GeneralAlgebraicKTheoryPartII is already the supplier of the bullet and precedes this roadmap in `ORDER.txt`.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree exits 0 with no diagnostics (3 s). The file is one `import Mathlib`, one module docstring and an empty namespace: nothing to probe for padding, no `#check` comparison to make, no sorry'd data, no `set_option`. The diff did not touch it.
- **Scope of the change.** `git diff --stat origin/main...HEAD` outside the folder is empty. `overlaps.md` reports no other open pull request changing this roadmap, no dropped or revision-only ids; `citations.md` reports no unresolved name.

### The changed passage (README:10)

| Citation | Where | What it says |
| --- | --- | --- |
| GeneralAlgebraicKTheoryPartII §4.30c | head of #1742, README line 1243 (heading), 1245 (statement) | "The stable James splitting": for a Hausdorff CW complex W with 0-cell basepoint, Σ∞_+J(W) is the free E₁-ring on Σ∞W; reduced splitting Σ∞J(W)≃⊕_(r≥1)Σ∞W^∧r; for connected W, Σ∞ΩΣW≃⊕_(r≥1)Σ∞W^∧r |
| GeneralAlgebraicKTheoryPartII scope | head line 13 | the James reduced product, the James map and the stable James splitting "are owned here (§§4.30b–4.30c); §§4.32–4.33 and §7.7 use them" |
| GeneralAlgebraicKTheoryPartII §4.33 | head lines 1325–1338 | applies the reduced stable James splitting of §4.30c; its `*Needs:*` line lists §4.30c |
| GeneralAlgebraicKTheoryPartII consumers | head line 2476 | "the James reduced product and the stable James splitting are §§4.30b–4.30c here" |

A grep of that head for `HomotopySpheres` returns nothing, so the old clause was stale and the new clause matches the supplier. The ownership statement of the sentence (§§4.31–4.33 own the Thom families and the James application) is unchanged, and this README consumes none of §§4.30b–4.30c itself: the only `James` in this README is on line 10.

### Seeded sample

None of the six sampled targets is in the diff. Their anchors were reopened and each still says what it is cited for: lmmt line 398 (Serre spectral sequence in T(i)-homology) and 406 (Remark 2.12, m=n+1); bhm 258 (Lemma 3.5); greenlees-sadofsky 343 (Corollary 2.4); hesselholt-ku 1658–1662 (π_*KU^tC_p = π_*KU ⊗ ℚ_p(μ_p)); cm-tate 129 (Remark 2.8); csy 3882 (Theorem 5.3.1, all n≥0), 3930 (Theorem 5.3.5, π-finite n-connected fibers) and 4036 (Theorem 5.4.4); mm 1801 (Theorem 7.6, faithful GL₂(ℤ/nℤ)-Galois).

### Adversarial values

One new row for the changed clause; the rest are carried from the previous reviews where they were computed (marked r3, r4 or r5).

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Stable James splitting as cited from §4.30c | W=S¹ (connected CW); W=S⁰ (disconnected, negative control) | W=S¹: H_*(ΩS²;ℤ)=ℤ[x], |x|=1, rank 1 in every degree ≥1; ⊕_(r≥1)H̃_*(S^r)=ℤ in every degree ≥1, equal; π₁^s: ΩS²≃S¹×ΩS³ gives ℤ, right side π₁^s(S¹)=ℤ, equal. W=S⁰: J(S⁰)=ℕ, Σ∞_+ℕ=⊕_(r≥0)S=⊕_(r≥0)(Σ∞S⁰)^⊗r, equal, but ΩΣS⁰=ΩS¹≃ℤ≠ℕ, so the ΩΣW form needs the connectedness the head's §4.30c states | Pass; new |
| Beck–Chevalley BC! direction | s=id_B; B′=∅ | q′=q, s′=id: identity; A′=∅: both sides *, equivalence | Pass (r5) |
| Inductive norm, m=−2 versus m=−1 on an equivalence q | q=id_A | δ=id, Nm_δ=id; mate = identity of q^* | Pass (r5) |
| Diagonal of an m-truncated map | q: BG→*; q: {a,b}→* | fibers of δ: G; fibers of δ: ∅ or pt | Pass (r5) |
| Two-point norm and cardinality | {a,b}→*, stable C | X⊕X→X×X identity matrix; |{a,b}|=2 | Pass (r5) |
| Integration over a finite set is summation | A={a,b} | ∫_A f = f_a+f_b (csy line 1708–1713) | Pass (r5) |
| BG→* in Sp_E: localized norm and the iff | E=S, G=C₂, X=Hℤ | π₀ norm ℤ→ℤ is ×2; cofiber π₀=ℤ/2≠0 | Pass (r5) |
| Rational BC_p cardinality | Sp_ℚ, unit | |BC_p|=p⁻¹; wrong model gives p | Pass (r5) |
| Weak 2-ambidexterity of B²C_p→* in Sp | trivial H𝔽_p | BC_p→* π₀ norm is p=0, not invertible | Pass (r5) |
| Theorem 3.2.3 at m=0 | F=id; F=L_E, q={a,b}→* | identity-matrix norm carried to identity-matrix norm | Pass (r5) |
| Composition law | q: BH→BG, p: BG→* in Sp_E | composite of H-in-G transfer norm with G norm is the H norm | Pass (r5) |
| §4.2 Sp_T(0) not 1-semiadditive | p=2, H𝔽₃ | C₃ norm is 3=0 | Pass (r3) |
| §4.2 dim BC_p | n=1,2 | rank p, p² | Pass (r3) |
| §4.2 dimension formula | n=k=2; k>n; n=0 | p versus p⁴; 1; rational ranks p, 1 | Pass (r3) |
| §4.2 evenness | X=S¹ | κ₁≠0, dim=1−1=0 | Pass (r3) |
| §4.2 connectivity cannot drop | n=1: BC_p versus K(C_p,2) | reduced K(1)-rank p−1 versus 0 | Pass (r3) |
| Homological grading and symmetry | ΣS; S¹∧S¹ swap | π₁ΣS=ℤ; sign −1 | Pass (r3) |
| Cofiber conventions | id_S; 0→S | 0; S | Pass (r3) |
| T(0)=S[1/p] versus Hℚ | p=2,q=3 | S[1/2]∧S/3≠0, Hℚ∧S/3=0 | Pass (r3) |
| Cover index | K(A,2), r=2,3 | K(A,2)⟨3⟩=*; index 2 keeps π₂=A | Pass (r3) |
| Multiplicative p-series | p=2,3 | 2X+X²; 3X+3X²+X³ | Pass (r3) |
| ψ_(−1) and Δ²⁴ | height 1; Δ²⁴ | u↦−u; weight 288, degree 576 | Pass (r3) |
| Finite p-local sphere | π₀S_(p); q≠p | ℤ_(p); q a unit | Pass (r3) |
| p-local duality and target | D(S/p); V=S_(p), X=Hℤ | Σ⁻¹S/p; Hom(ℤ_(p),ℤ)=0 versus ℤ_(p) | Pass (r3) |
| Geometric height | additive / multiplicative over 𝔽₂ | ∞ / 1 | Pass (r3) |
| v-degrees and BP | p=2,3 | |v₁|=2,4; π₂BP=0, π₂MU_(3)=ℤ_(3) | Pass (r3) |
| Type and smash | S_(p), S/p, 0 | 0, 1, ∞; max(0,1)=1 | Pass (r3) |
| Nilpotence endpoint | R=H𝔽_p | K(i)∧R=0 all finite i; H𝔽_p∧R≠0 | Pass (r3) |
| 3.1 degenerate bases | Y=*; Y=∅; E=0 | E_*(F_+); 0; 0 | Pass (r3) |
| 3.1 differentials and cells | d_r at (s,t); one s-cell | (s−r,t+r−1); Σ^s(E⊗Σ∞_+F) | Pass (r3) |
| 3.1 monodromy | reflection torus, Hℤ | 1−(−1)=2; H₁=ℤ⊕ℤ/2 | Pass (r3) |
| 3.1 non-cellular naturality | I, t↦t/2 | id on H₀ | Pass (r3) |
| 3.1 periodic coefficients | KU, ℂP^∞ | E²=ℤ at even (s,t); d_r=0 | Pass (r3) |
| 3.1 bounded-below hypothesis | constant filtration S | graded pieces 0, colimit S | Pass, negative control (r3) |
| 4.1 Euler inversion | p=2; p=3 | z=−2, ℚ₂; z²+3z+3 Eisenstein, ℚ₃(ζ₃) | Pass (r3) |
| 4.1 against StableHomotopyKTheoryPartII §7.2 | p=2,3 | same values in x=L−1 | Pass (r3) |
| 4.1 raw versus localized | KU_p^∧ | raw π₀≠0; L_T(1) Tate=0 | Pass (r3) |
| 4.1 Check "agreeing with Kuhn's theorem" | KU_p^∧ trivial C_p | raw π₀=ℚ_p(ζ_p)≠0; localized Tate 0 | Pass (r4) |
| Sphere and Hℤ Tate | C_p on S; C₂ on Hℤ | π₀=ℤ_p; ℤ/2 even, 0 odd | Pass (r3) |
| 4.3 bound at n=1, n=2 | K(ℤ/p,2), BC_p; K(ℤ/p,3), K(ℤ/p,2) | reduced ranks 0, p−1; 0, p−1 | Pass, bounds sharp (r3) |
| 4.3 height zero | q≠p, K(ℤ/q,n+1) | ℤ/q≠0; ⊗ℚ=0 | Pass (r3) |
| 4.3 third assertion | Σ^(n+1)H𝔽_p; Σ^nH𝔽_p | acyclic; not a T(n)-equivalence | Pass (r3) |
| 4.3 Serre class | ℤ/4 | killed by 2², not by 2 | Pass (r3) |
| 4.4 weak-ring unit law | Hℚ with μ=0; S | fails; passes | Pass (r3) |
| 4.4 four conditions | Hℚ, n=0 | all three vanish | Pass (r3) |
| 4.4 ∞ endpoint | H𝔽_p | K(j)⊗R=0 finite j; K(∞)⊗R≠0 | Pass (r3) |
| 4.4 Morava K | K(n) | supp {n}; F(n+1)⊗K(n)=0 | Pass (r3) |
| 4.4 sphere | S_(p) | all four fail together | Pass (r3) |
| 4.4 weak-ring hypothesis | I_(ℚ/ℤ) | supp ∅, F(n+1)⊗I≠0 | Pass, negative control (r3) |
| 5.1 trivial group and zero ring | G=1; A=0 | B^h1=A; 0 | Pass (r3) |
| 5.1 split torsors | C₂, A²; S₃, A⁶ | A⁴; 36=36 | Pass (r3) |
| 5.1 faithfulness independent | A=Hℤ, B=0 | B⊗_AA=0, A≠0 | Pass (r3) |
| 5.1 group orders | N=1,2,3,5 | 1; 6; 48; 480 | Pass (r3) |
| 5.1 row action | N=3, unipotents | (2P+Q,P+Q)≠(P+Q,P+2Q) | Pass (r3) |
| 5.1 determinant components | diag(−1,1) | ζ↦ζ⁻¹; 48/24 | Pass (r3) |
| Honda quotient | p=2,h=1; p=3,h=1 | 𝔽₄, 1/2; 𝔽₉, 1/3 | Pass (r3) |
| Part II fixed points not connective | p=2, n=2, k=0 | π₋₁=ℤ₂ | Pass (r3) |
| Part II fp-type index | ku₂^∧, cofib(v₁⁴ on S/2) | fp-type 1 | Pass (r3) |
| Part II acyclic ring | Hℤ_p, n=2 | L_T(2)K(ℤ_p)=0 | Pass (r3) |
| Part II witness range | bhls Theorem A | any prime, n+1≥2, k≥0 | Pass (r3) |
| hahn-wilson note | h=1, p=2; general h | T(h+1)⊗TC(BP⟨h⟩)≠0 | Pass (r4) |

### Notes that need no change in the folder

- The pull-request description (data) still says the roadmap "shows ko→KO is a T(n)-equivalence for n≥1"; README:10 assigns that to GeneralAlgebraicKTheoryPartII §4.30a and this folder does not state it. The description is the author's text, not a roadmap file.
- `ORDER.txt` lists HomotopySpheres while the project's dropped-names list also contains it; after this head's repair the README no longer depends on which the gate follows.

## Not verifiable

- HL13 (Hopkins–Lurie, Ambidexterity in K(n)-local stable homotopy theory) is cited only through csy; HL13's own text was not opened (unchanged from the previous review).
- The printed page 844 of `hesselholt-ku` was not seen; the cited formula is at extraction line 1658–1662.
- Whether a repair answer posted as a pull-request comment marked anything not actionable: no repair report is on the board, and pull-request comments were not read.
- Ownership against open pull requests: the changed clause cites only GeneralAlgebraicKTheoryPartII, which this review resolved at its open head; no other ownership question arises from the diff.

## Source issues

- none
