# Review of PeriodsAndSpecialValues (pull request #1496 at bec4c3a)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since 147f30d (the §6.19 citation in the GeneralAlgebraicKTheory contract), plus an account of the previous report's three findings. The changed line is correct and resolved against GeneralAlgebraicKTheory at its open head; the one blocking item is, as in the previous two reports, the plan's five supplier gaps, which this head does not touch and which need a board-side repair, not a README edit.

## R01 (P2) — The plan still declares five supplier gaps the README does not state, each for an object a named owner or this roadmap already provides

**Location:** `packages/PeriodsAndSpecialValues/design/plan.json`, top-level `gaps` (`modular-eigenprojector-motive`, `motivic-cohomology-adams`, `framed-relative-motives` on MotivesAndAlgebraicCycles; `k3-betti-even-unimodular` on K3SurfacesAndSymplecticBoundedness §3.3; `indefinite-lattice-classification` on IntegralLattices "Part II"), against `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:38` and `:98–104`.

**Claim:** the plan asks suppliers for the newform eigenprojector motive, the Adams comparison, the framed relative motives, the even unimodular (3,19) K3 cup lattice and the indefinite classification with primitive-embedding uniqueness.

**Witness:** the README at this head contains no `gap:` slug (0 matches over the file). Line 38 says PS.1.6, PS.3.0 and PS.9.15 build the three motive-side objects here (PS.1.6 at line 563 constructs M_f from Kuga–Sato projectors); the head of MotivesAndAlgebraicCycles (#1313) has no newform, modular-form or Kuga–Sato content, so honouring that gap would create a second owner. Lines 98–104 consume IntegralLattices 5G (`TauCetiRoadmap/IntegralLattices/README.md:1541` on main), 5H (`:1559`) and 6A (`:1643`), and K3Surfaces K2, whose statement is `TauCetiRoadmap/K3Surfaces/README.md:314` at the head of #1285 (even unimodular H² cup lattice of signature (3,19) by Poincaré duality, Wu and the signature formula). K3SurfacesAndSymplecticBoundedness at the head of #1375 has no §3.3 (its Layer 3 has only §3.1) and states no (3,19) lattice theorem, so that gap also names a section that does not exist.

Re-raised: b/F08 in `packages/PeriodsAndSpecialValues/reports/FIX-RT-PeriodsAndSpecialValues~1.md`. Its reason was that the completed IntegralLattices roadmap excludes classification and no supplier proves the geometric K3 theorem. The reason fails today on both counts: the active IntegralLattices roadmap on main has 5G, 5H and 6A at the lines above, and K3Surfaces #1285 states the geometric theorem and is what the README cites. Raised as R02 of the r2 report and R01 of the r3 report; the head since then changes nothing about it.

**Repair:** board-side, no README edit. Retire `k3-betti-even-unimodular` and `indefinite-lattice-classification` from the plan's `gaps` so that intake announces no duplicate work to K3SurfacesAndSymplecticBoundedness or IntegralLattices; retire the three MotivesAndAlgebraicCycles slugs to match line 38, where the objects are built locally (if any is meant to stay a supplier contract, the README must state it under Exact supplier contracts as `What MotivesAndAlgebraicCycles must provide (gap:<slug>)`, which it does not). Tested on the application: Λ = U³ ⊕ E₈(−1)² has rank 22, determinant −1 and signature (3,19); the PS.8.4 complement has rank 19 and discriminant length 1, so 19 ≥ 1 + 2 and 5H applies with no extension of IntegralLattices.

## R02 (P3) — KZ and Scholl are still unregistered in the source manifest

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2563` (KZ) and `:2584` (Scholl); `packages/PeriodsAndSpecialValues/sources.toml`.

**Claim:** both works are cited with locators (KZ §1.2 Conjecture 1 and §4.1 at line 1442 for PS.7.4; Scholl Theorems 1.2.1 and 1.2.4 at line 563 for PS.1.6).

**Witness:** the manifest's 30 keys contain no entry whose author, title or URL matches either work (its only Zagier entries are `IKZ` and `Z`; "Kontsevich" occurs only in the HMS title). Carried from the r2 and r3 reports; this head changes only README line 204.

**Repair:** as before: one record per work with keys `KZ` and `Scholl`, locator schemes `section` and `theorem`, the author-copy URLs the References already give, `cited_for` PS.7.4 and PS.1.6, and the sources-service provenance. This review edits no manifest.

## R03 (P3) — The scope summary lists only §§4.16–4.17 of GeneralAlgebraicKTheory

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:37`: "GeneralAlgebraicKTheory §§4.16–4.17;" inside the list of what other roadmaps supply.

**Claim:** the scope section summarises the supplier contracts.

**Witness:** the contract heading at line 202 and the `*Needs:*` lines at 792 and 884 cite §6.19 (Gillet–Waldhausen) and §12.11 (negative K-groups; also cited at lines 743 and 759). The scope list, which the README says mirrors Exact supplier contracts, omits both.

**Repair:** write "GeneralAlgebraicKTheory §§4.16–4.17, 6.19, 12.11" at line 37.

## Previous findings

- R01 — not repaired: `design/plan.json` still lists the five gaps; the README cites IntegralLattices 5G–5H/6A and K3Surfaces K2 directly (lines 98–104) and declares no gap. Written again as R01 above.
- R02 — repaired: line 204 now reads "Section 6.19 supplies the general Gillet–Waldhausen equivalence `K(E) ≃ K(Chᵇ(E), q)` for bounded complexes over an essentially small exact category"; no `gilletWaldhausen_general` remains anywhere in the folder. The statement matches §6.19 at the head of #1212 (table below). No new problem introduced.
- R03 — not repaired: `sources.toml` still lacks KZ and Scholl. Written again as R02 above.

## Verified sound

**Scope.** The diff since 147f30d is 1 insertion and 1 deletion in `README.md` (line 204); `Suggested.lean` and `metadata.toml` are unchanged since 58a34e8, and the diff outside the roadmap folder against `origin/main` is empty.

**The changed passage.** GeneralAlgebraicKTheory at the head of #1212 (43e9df6), `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:1409–1411`: "6.19 Gillet–Waldhausen for an arbitrary exact category", for every essentially small exact E the degree-zero embedding induces `K(E)≃K(Chᵇ(E),q)`, q the maps whose cones are homotopy equivalent to admissibly acyclic complexes, with the same comparison for degreewise admissible and degreewise split cofibrations. The README's new sentence states exactly this scope (essentially small exact, bounded complexes) and claims nothing more. Its consumers at this head: the PS.3.1 `*Needs:*` line (792), the Layer PS.3 Dependencies (884), and NoncommutativeAndEquivariantIwasawa §2.7 (`TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1183` at #1307), which itself cites §6.19 for the complex extension of the determinant functor, consistent with line 204's last sentence. §12.11 at `:2860` of the same GeneralAlgebraicKTheory head still states the negative-K vanishing for regular noetherian rings of finite global dimension.

**Gate.** The worker's gate at bec4c3a passes every check (set_option 0, sorry-data 0, residue 0, imports 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, build 0). The dependency check rerun from this review:

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. AlgebraicKTheory (ORDER line 11) and GeneralAlgebraicKTheory (line 13) precede PeriodsAndSpecialValues (line 297). The r3 observation stands: K3Surfaces, cited at line 102 and open as #1285, is neither in `ORDER.txt` nor in the pull request's merge-order block, although the resolver and the dependency check accept it.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean` from the worktree (pins of `lake-manifest.json`) exits 0 with exactly 13 `declaration uses sorry` warnings (lines 65, 70, 87, 97, 116, 121, 146, 151, 187, 192, 206, 223, 230) and no other diagnostic. The file is byte-identical to the one the r2 and r3 reports read, so the worker's `signatures.md` (38 declarations: 25 definitions, 13 theorems, 0 dropped binders) is the one those reports compared with the README; no `#check` re-run and no one-tactic probe were repeated, the r2 report having found all 13 theorems unprovable by `simp`, `rfl`, `infer_instance` or one library lemma.

**Seeded sample.** Both targets (PS.8.17 "Fixed-fibre projective map", README line 1916, and "Residue coordinates and the small prime", line 1929) are untouched by the diff. Their anchors were re-opened and agree with the previous reports: Park Definition 4.8 at Park line 1173 (cache page 23, printed p. 442), Theorem 4.11 at line 1233 with the hypotheses v_p(γ) ≤ 1/(p−1) and v_p(ℏ) > 0 (page 24, printed 443), Corollary 4.12 at line 1345 (page 26, printed 445, as the README says), Proposition 5.2 at line 1568; the printed page is the cache page + 419 throughout. SH Lemma 4.8 at SH line 271 with its proof at lines 278–286 giving δω_{ijknms} = −(s+1)ω_{ijknms} − πω_{ijknm(s+1)}; SG Lemma 5.6 at SG line 1082 with the hypothesis p > dim V stated at line 1082–1083. The displayed matrix at line 1931–1932 is upper triangular with diagonal (1,1,2,6), det 12, and equals diag(1,−1,2,−6)·D for D with diagonal (1,−1,1,−1), det D = 1, as the text says; v₃(12) = 1 and v_p(12) = 0 for p ≥ 7.

**Citation-resolver leads.** `TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc` (README line 156) are not at the pinned Tau Ceti (0 matches under `.lake/packages/TauCeti`). They sit under the heading "EllipticIntegrals Milestones 1 and 3" (line 154) and are, as the r2 report resolved, the planned names of that Tau Ceti roadmap's Milestone 1; the README says so and asserts no pinned declaration. Not a finding.

**Computed adversarial table.** Rows for statements the diff leaves untouched are carried from the previous reports (the r2 report's 105-row table and the r3 report's seven new rows, cited as "r2"/"r3"); the row marked "new" is computed here for the changed statement.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| §6.19 as cited at line 204: `K(E) ≃ K(Chᵇ(E), q)` for essentially small exact E (new) | E = finite-dimensional k-spaces; E = finite free (k×k)-modules (not idempotent complete); E = Proj(ℤ) with C = [ℤ →2→ ℤ] | k-spaces: K₀ = ℤ on both sides, the Euler characteristic Σ(−1)ⁱ[Cⁱ] inverting the degree-zero map (§6.19's first Check). (k×k)-free modules: K₀(E) = ℤ (diagonal rank) while K₀(E♮) = ℤ²; the wrong model "K(E) ≃ K(Chᵇ(E♮), quasi-iso)" would give ℤ² ≠ ℤ, and §6.19's cofinal E′ excludes it (its second Check). Proj(ℤ): χ(C) = [ℤ] − [ℤ] = 0 in K₀ although C is not q-acyclic (cone has H⁰ = ℤ/2 ∉ Proj), so the equivalence is of K-spectra, not of K₀ alone; the determinant of C lives in K₁(ℚ) ∋ 2, consistent with the PS.5.1 rows | Consistent with the supplier's own Checks; the README asserts the equivalence at the supplier's generality and no more | Retain |
| PS.5.1 boundary on scalar extension, [Oⁿ,g,Oⁿ] (r3) | O=ℤ, A=ℚ, n=1, g=2, 1, 6, 1/2 | δ[ℚ,2] = [(ℤ,2,ℤ)], value 2 (v₂=1); g=1 gives 0; (ℤ,6,ℤ)=(ℤ,2,ℤ)+(ℤ,3,ℤ); (ℤ,1/2,ℤ) = −(ℤ,2,ℤ), v₂=−1; inverse convention would give −1 for g=2 | Consistent | Retain |
| PS.5.1 triple isomorphism, gluing direction (r3) | (2ℤ,id,ℤ) versus (ℤ,2,ℤ) | equal in K₀(T) via f:ℤ≅2ℤ; det in integral bases 2, v₂=+1; 1/2 gives −1 | Consistent | Retain |
| K₀(ℤ,ℝ) and "rational classes retain their signs" (r3) | O=ℤ, A_ℝ=ℝ | K₀(ℤ,ℝ) ≅ ℝ^×/{±1} ≅ ℝ_{>0}; ℚ_{>0}→ℝ_{>0} injective, so ∂(2) ≠ 0 and ∂(1/2) = −∂(2) | Consistent | Retain |
| Summand density and non-fullness of O→A_ℝ (r3) | ℤ→ℝ; ℤ→ℚ | every f.g. projective A_ℝ-module is a summand of T(Oⁿ); 1/2 on ℝ is not T of an integral map, so no fullness; §4.17 supplies ker ∂ = im K₁(O) without it | Consistent | Retain |
| Five-term sequence exact at three interior terms (r3) | ℤ→ℚ | {±1}→ℚ^×→ℚ^×/{±1}→ℤ→ℤ: ker ∂ = {±1}; im(K₀(T)→ℤ) = 0 = ker(ℤ→ℤ); terminal map onto here but not asserted | Consistent | Retain |
| PS.5.1 extended boundary, unit −1 and quaternion sign (r2/r3) | ℍ over ℝ, x=−1; O=ℤ, x=−1 | Nrd(ℍ^×) = ℝ_{>0}; δ̂(−1) = 0 − 0 while 2 has v₂=1 | Consistent | Retain |
| PS.5.1 multiplier independence (r2) | x=3, λ=1,2 | at 2: 1−1=0; at 3: 1; omitting the correction gives 1 or 2 at 2 | Consistent | Retain |
| PS.5.2 ETNC obstruction sign (r2) | boundary 1, regulator class −1 | 1−1=0; subtraction gives 2 | Consistent | Retain |
| PS.3.1 determinant line, virtual objects (r2) | two odd lines; torsion module ⊗ℚ | interchange sign −1; rationalized torsion = 0 with determinant 1; d_R(C) = ⊗ d(Cⁱ)^((−1)^i) is the unit on the zero complex and inverts under shift | Consistent | Retain |
| PS.3.0 negative-degree vanishing via §12.11 (r2) | K₋₂(ℤ) | 0 by §12.11 versus the erroneous K₀=ℚ | Consistent | Retain |
| PS.8.4 lattice inputs (r2; for R01) | Λ=U³⊕E₈(−1)²; PS.8.4 complement | rank 22, det −1, signature (3,19); complement rank 19, discriminant length 1, 19 ≥ 1+2 | Consistent | Retain; gaps redundant (R01) |
| "Residue coordinates and the small prime" matrix (r2, anchors re-opened) | R = diag(1,−1,2,−6)·D | diagonal (1,1,2,6), det R = 12, det D = 1; v₃ = 1, v_p = 0 for p ≥ 7 | Consistent | Retain |
| PS.7.1 `legendreK`, `legendre_substitution` (r2) | λ=1/2; λ=0 | both integrals ≈ 1.8540746773; boundary both π/2 | Consistent | Retain |
| All other PS.0–PS.9 statements and the 38 Lean declarations | as in r2 | values as in the r2 report's table (105 rows) | unchanged text, unchanged Lean | Retain |

**Ownership and duplication.** The changed line cites the owner of the Gillet–Waldhausen comparison rather than restating it; `roadmaps grep` for `gilletWaldhausen_general` over main and the open heads now finds nothing. Ownership against open pull requests for the changed object was checked through GeneralAlgebraicKTheory #1212 and NoncommutativeAndEquivariantIwasawa #1307 as read above; the r2 report's audit covers the unchanged objects.

**Declared gaps.** All five plan gaps have a named supplier (none is `none`) and single `needs` sentences, but none is declared in the README and each asks for what a named owner or this roadmap already provides; one names a supplier section (K3SurfacesAndSymplecticBoundedness §3.3) that does not exist at that roadmap's head (R01).

## Not verifiable

- **BG** stays settled as uncertified and **Tate-legal** as waived; neither was requested and nothing about their unseen text is asserted.
- The finite computations and the sorry build certify elaboration and the instances above, not the future proofs; the extended boundary's independence of λ for a general noncommutative order rests on BF diagram (14) as the README says.

## Source issues

- none
