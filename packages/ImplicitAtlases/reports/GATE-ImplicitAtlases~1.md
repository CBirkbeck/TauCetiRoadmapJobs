# GATE-ImplicitAtlases~1: answers to the review of 2026-10-18

All findings come from the single review by roed-math. Only `TauCetiRoadmap/ImplicitAtlases/README.md` changed; `TauCetiRoadmap/ImplicitAtlases/Suggested.lean` is unchanged, because none of the points concern it and the new README text adds no backticked Lean name. Source checked: Pardon2016 (arXiv 1309.2370v6), fetched through the sources service. Definition 6.1.6 sits on printed page 48 (Pardon2016 line 2023), not p. 47 as the review cites. The README now cites p. 48.

## H01 (roed-math) — applied

V6.1 required the stratification only on regular thickenings and did not require it to agree with the zero fibers. It now requires a Γ_I-invariant stratification (X_I,∂X_I)→(S,∂S) of every whole thickening, restricting to the base stratification at I=∅, with the zero-fiber compatibility "restriction to Z_IJ = pullback along ψ_IJ" (Pardon2016 Definition 6.1.6(i), lines 2029–2033). The review's two-point example is now recorded in V6.1 as the counterexample. Under the new axiom that atlas admits no stratification at all, because a lower semicontinuous map from the connected space ℝ to two incomparable strata is constant. The variant with thickening `ℝ\{0}` satisfies every axiom and is recorded as the positive case. Both are added to the verification list.

## H02 (roed-math) — applied

V6.2 old: "`o_((X_I^reg)^≤s)⊗o_s≅o_(X_I^reg)` and the boundary-normal compatibility square". New: these are sheaf isomorphisms over (X_I^reg)^≤s that commute with the coordinate changes ψ_IJ on regular zero fibers, as well as with the incidence square (Pardon2016 line 2038 and diagram (6.1.1)).

## H03 (roed-math) — applied

V6.2 used to state only how the restricted orientation lines are tensored. It now constructs the restricted atlases explicitly before V6.3 uses them. These are ∂X→∂S (lines tensored by o_ℝ, virtual dimension d−1) and (X^≤s,X^<s)→(S^≤s,S^<s), with thickenings X_I^≤s, domains U_IJ∩X_I^≤s, regular loci X_I^reg∩X_I^≤s, lines tensored by o_s^dual and virtual dimension dim(s). V6.2 also requires a proof of every restricted V1 axiom:
- the zero-fiber compatibility gives ψ_IJ^−1(X_I^≤s)=Z_IJ∩X_J^≤s;
- the cell-like models give the product projections;
- the footprints cover, because a regular zero over X^≤s lies in X_I^≤s.

Pardon2016 lines 2046–2050 assert this restriction without proof. The same pattern is repaired in V6.4: product thickenings are stratified by S₁×S₂, and the compatibility is inherited from the factors.

## H04 (roed-math) — applied

The type objection is correct. After the reindexing, `H(ι_*)` is a map `Čech^q(Z;o_Z)→Čech^(q+n)(P;o_P)` on arbitrary classes on Z, so "cap/cup multiplication by `(f×g)^*τ_Δ`" (V7, old line 190) mistypes it. V7 now defines a supported Gysin map i_! in five steps, as the review suggests:
- L=pr_X^−1 f^−1 o_M, F=o_P⊗L^dual and i^−1F≅o_Z;
- u=h^*τ_Δ∈Čech^n(P,P\Z;L);
- a tautness representative a_U on an open U⊇Z in P;
- a_U⌣u, then excision, then forgetting support, with independence of choices;
- identification with `H(ι_*)` in every degree, plus Φ_Z(a)=Φ_P(i_!a) at degree d_Z.

V7 also states the projection formula with its Koszul sign `(−1)^(n·deg b)`, and states that `i_!(i^*b)=b⌣ū` holds only on the image of i^*. The S¹→ℝ example is added as Checks: i_!(a,b)=±(a−b)η while ū=0.

## H05 (roed-math) — applied

The old text said "extend a cohomology class only to this neighborhood" of the image in M, and that is false. In the S¹, f=sin θ example, (1,0)∈Čech^0({0,π}) is not pulled back through the constant map to a neighborhood of 0∈ℝ. V7 now uses the neighborhood N⊆M only for the diagonal Thom data and its cofinal-shrinking independence. Classes on Z are extended to open neighborhoods of Z in P by the tautness comparison, which holds because P is compact Hausdorff and Z is closed. This extension in P is a Check.

## H06 (roed-math) — applied

V5.6 old: "uses an actual compactly supported transverse final section". New: "uses an actual transverse final section, obtained from the original section by a compactly supported perturbation, and a compact-zero homotopy". A sentence was added saying that a compactly supported section on a noncompact base of positive rank vanishes on an open set and is not transverse there. No other occurrence of the defect: the remaining "compactly supported" phrases (cutoffs, the Euler/Thom pairing, H_c in V3.3) are correct.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| V6.1 zero-fiber compatibility | review's atlas X={±1}, X_α=ℝ, s=x²−1, strata a,b | old axioms: all of ℝ in a, cell-like `(ℝ,∅)` of dim 1=0+1; ψ(+1) has stratum a but +1 has stratum b → compat fails; ℝ connected ⇒ any l.s.c. map to {a,b} is constant ⇒ no compatible stratification | old axioms admit a bad atlas; new ones exclude it | axiom added, negative Check |
| same, variant | X_α=`ℝ\{0}`, (−∞,0)↦a, (0,∞)↦b | X^≥a, X^≥b open; −1↦a, +1↦b matches; `((−∞,0),∅)` is a 1-manifold of dim 0+1 | all axioms hold | positive Check |
| V6.2 restricted covering | x∈X^≤s, x=ψ_∅I(y), y regular zero | compat: stratum(y)=stratum(x)≤s ⇒ y∈X_I^≤s | covering holds | proof route stated |
| V6.2 restricted dimension | s with dim(s)+m_I<0 | regular closure empty (V6.1 rule); virtual dimension dim(s) | consistent with V1 negative-dimension rule | none |
| V6.4 product strata | X^≥(s₁,s₂)=X₁^≥s₁×X₂^≥s₂ | open; closure pair is a product of manifolds with boundary, of dim dim s₁+dim s₂+m_I+m_J | cell-like | stated |
| V7 i_!(i^*b)=b⌣ū | S¹, f=sin θ, b=1 | i^*1=(1,1); i_!(1,1)=±(1−1)η=0; ū∈H¹(ℝ²)=0 pulled back, so 1⌣ū=0 | agree | Check |
| V7 i_! not cup | same, a=(1,0) | i_!(1,0)=±η≠0 (f'(0)=1, f'(π)=−1); cup with ū gives 0 | old definition fails | definition replaced, Check |
| V7 extension in M vs P | same | Z→N constant ⇒ only (c,c) extend from N; (1,0) extends on two disjoint arcs in S¹ | extension in M fails, extension in P works | Check |
| V7 projection formula sign | deg a=q, deg b=r, deg u=n | (a⌣b)⌣u=(−1)^(rn) (a⌣u)⌣b | sign `(−1)^(n·deg b)` | stated |
| V7 degree of Φ_Z=Φ_P∘i_! | d_Z=d_X+d_Y−n, same E_B | Z-trace at q=d_Z: C_(d_Z+m_B−d_Z)=C_(m_B); P-trace at d_Z+n=d_P: C_(m_B) | same obstruction pair | stated |
| V7 degenerate n=0 | M=pt | Δ=M×M, u=1, Z=P, i_!=id | consistent | none |
| V5.6 wording | base ℝ, rank-1 trivial bundle, compactly supported section | section ≡0 outside a compact set ⇒ zero set noncompact and not transverse | old wording false | reworded |

## Lean, ownership, citations

Suggested.lean is unchanged. I did not repeat the `#check @name` elaboration because no declaration changed, and the brief's signature file was not available (TauCeti object-file error). The build below elaborates the unchanged file.

Ownership: the new text introduces no generic carrier that another roadmap owns. The stratified atlas definition, its restrictions and the supported Gysin construction for atlas fiber products are parts of this roadmap's V6/V7 engine. The tautness comparison is stated as an owned step here. CharacteristicClasses (Thom class) and TopologicalSheafCohomology are cited exactly as before. CharacteristicClasses is on main. TopologicalSheafCohomology is not on main, nor is it in the merge order. It is cited from its open new-folder pull request, which the brief allows.

Outside this review's scope: the README does not use the house shape (no `# Roadmap:` title or `**Summary.**`, V-numbered layers rather than `## Layer k`, no per-definition API lists or Checks). Suggested.lean exposes interface sketches and a proved dimension lemma rather than headline theorems, and its docstring does not follow the "target signatures" form. These are not touched here.

## Build and gate

- `lake build TauCetiRoadmap.ImplicitAtlases.Suggested`: `Build completed successfully (9005 jobs).`
- Gate (after commit `50ab7a50`): `gate ImplicitAtlases: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: ImplicitAtlases (insert it after its last supplier)`. That is the design-stage condition, not a defect.
- Depcheck `--movable` output: `NOT IN ORDER: ImplicitAtlases (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1002 edges, 1 problem(s)`. No UPWARD or CYCLE line.
