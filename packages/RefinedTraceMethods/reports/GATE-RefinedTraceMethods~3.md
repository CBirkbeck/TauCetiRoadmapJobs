# GATE-RefinedTraceMethods~3: answers to the human review of head 080175a

Commit `0e4370b0` on top of `080175a`; only `TauCetiRoadmap/RefinedTraceMethods/README.md` changed. `Suggested.lean` is unchanged: it declares nothing, and both repairs are in README proof routes and Checks.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/RefinedTraceMethods/README.md` §4.9, the proof route of "Nonconnective K-theory by the suspension construction" (line 1850). Old: "The transition maps come from the connecting maps of the fibre sequences `K(C)→K(F_κC)→K(Σ_κC)` on connective covers". New: the zero composite `C→F_κC→Σ_κC`, together with `K(F_κC)=0`, gives a natural map `K(C)→fib(K(F_κC)→K(Σ_κC))≃ΩK(Σ_κC)`, and these maps are the transition maps. The text now says explicitly that the connective cover of `ΩK(Σ_κC)` is K(Idem C), because Idem C is the kernel of `F_κC→Σ_κC` inside the idempotent-complete `F_κC`. So the map is an isomorphism on `π_i` for i>0 and is the inclusion `K₀(C)→K₀(Idem C)` on `π₀`. For n≥1, `Σ_κ^{(n)}C` is idempotent complete and the comparison holds on connective covers.

The objection is correct. BGT Definition 9.6 (bgt line 2634) builds the structure maps from the exact sequences of categories, and Remark 9.33 (bgt line 2893) gives degree-zero agreement only for idempotent-complete C. The roadmap's own k×k Check shows the failure: K₀=ℤ for the raw category, but `K₁(Σ_κC)=K₀(Idem C)=ℤ²`. The headline statement, the Morita invariance and the i>0 / i=0 distinction were already right and are unchanged.

## H02 (CBirkbeck) — applied

§4.20, the proof route of "Continuous K-theory of almost modules" (line 2341). Old: inverse norms `||T||^(−1/n_i)`. New: power-multiplicativity applied to `r_i^(n_i)=T` and `(r_i⁻¹)^(n_i)=T⁻¹` gives `||r_i||=||T||^(1/n_i)` and `||r_i⁻¹||=||T⁻¹||^(1/n_i)`, both of which tend to 1. The text adds that a power-multiplicative norm need not satisfy `||T⁻¹||=||T||⁻¹`. The colimit step `||r_i⁻¹x||<1` for large i still holds, so the theorem and its generality are unchanged.

The reviewer's counterexample is added as a negative-control Check (new line 2354): L×L with the maximum norm, T=(p,p²) and `n_i=p^i`. Then `||T||=p⁻¹` and `||T⁻¹||=p²`, so `||r_i⁻¹||=p^(2/p^i)`, while the old formula gives `p^(1/p^i)`. The existing field Check now names the field L.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `K(C)→ΩK(Σ_κC)` is iso on `π_i` for i>0 and the inclusion `K₀(C)→K₀(Idem C)` on `π₀` | C = bounded finite-free (k×k)-complexes; C = Perf(F), F a field; C=0 | raw: `K₀(C)=ℤ`, `π₀ΩK(Σ_κC)=K₀(Idem C)=ℤ²`, the inclusion is diagonal; Perf F: ℤ→ℤ iso; C=0: 0→0 | consistent with Remark 9.33 and the two §4.9 Checks (K₀=ℤ vs IK₀=ℤ²) | proof route rewritten |
| for n≥1, the transition maps are equivalences onto connective covers | `Σ_κC` is idempotent complete by definition (the quotient is idempotent-completed) | Idem(`Σ_κC`)=`Σ_κC`, so the `π₀` inclusion is the identity | holds | stated |
| `||r_i⁻¹||=||T⁻¹||^(1/n_i)` | L field, T=p; L×L max norm, T=(p,p²); n_i=p^i, p=2,3 | field: `p^(1/p^i)` on both sides; product: `max(p^(1/n),p^(2/n))=p^(2/n)=(p²)^(1/n)`; old formula `p^(1/n)` fails | new formula holds, old one refuted | formula replaced, Check added |
| `||r_i||=||T||^(1/n_i)<1` | the same instances | field: `p^(−1/p^i)`; product: `max(p^(−1/n),p^(−2/n))=p^(−1/n)=||T||^(1/n)` | holds; `||T||<1` because T is topologically nilpotent and `||T^k||=||T||^k` | none |
| max norm on L×L is power-multiplicative and not multiplicative | (p,0)·(0,p)=0 | product of the norms is `p^(−2)`, the norm of the product is 0; `||x^k||=max(|x₁|^k,|x₂|^k)=||x||^k` | holds | stated in the Check |
| x∈I lies in `r_iB` for large i | product, x=(p^(1/2),p^(1/2)), p=2 | `||r_i⁻¹x||≤2^(2/2^i)·2^(−1/2)<1` once 2^i>4, i.e. i≥3 | holds | none |

## Other checks

- Pattern search: "connective cover" occurs in the README only at line 1850 (repaired) and in §6 (ku, j), where it means `τ≥0` of ring spectra and is used correctly. No other formula for an inverse norm occurs.
- Citation leads in `citations.md` (README line 64: `AInf.Trace.completedTateComparison`, `tateFinite`, `tateOrbit`; line 65: `Prismatic.Trace.rationalBeilinson`): these are README-level target names in the supplier roadmaps AInfCohomology (README line 3833) and PrismaticCohomologyPartIII (README line 918), not pinned-library declarations. They are cited as such, and nothing needs to change.
- Ownership: nothing was added, and no construction moved.
- `#check` comparison of elaborated signatures: not applicable, since `Suggested.lean` declares nothing.

## Build and gate

- `lake build TauCetiRoadmap.RefinedTraceMethods.Suggested`: `Build completed successfully (8976 jobs).`
- Gate, after the commit: `gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
