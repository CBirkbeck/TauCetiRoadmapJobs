# Repair report: red-team round 2 of AlgebraicModularFormsAndSerreWeightsPartII

Two reviews: pass a (two findings) and pass b (three findings). Pass a F02 and pass b F03 are the same locator defect and are settled once.

## RT-AlgebraicModularFormsAndSerreWeightsPartII~2a/F01 (P2) — applied

Witness verified: ArithmeticGaloisRepresentations (open head, merge order line 51; this roadmap is at line 276) §7.8, paragraph "Irreducibility and one-dimensional constituents", targets absolute irreducibility of Sym^a(F̄_p²) for SL₂(F), 0≤a≤p−1; its §1.7 defines absolute irreducibility in Burnside's form with invariance under every coefficient extension.

Changes: §8.3 now imports both (§7.8 for the theorem, §1.7 to pass from the F̄_p statement to every field k of characteristic p through the F_p-form) and keeps only the orbit-span application and the direct value-detection step; the standard representation is described in prose as a convention with its column-action Checks; the interpolation proof is deleted. Summary, Scope and ownership, Conventions, the Mathlib and Tau Ceti contracts, a new `From TauCetiRoadmap.ArithmeticGaloisRepresentations` contract, §8.3 *Needs:* and the Layer 8 Dependencies are updated. `standardSL2` and `smallSymmetricPower_irreducible` are deleted from `Suggested.lean` with the two imports only they used (`TauCeti.RepresentationTheory.SymmetricPower`, `TauCeti.RepresentationTheory.ClassicalGroups.Restriction`), and the module docstring no longer advertises local ownership. No other README passage named the two Lean names (§8.4 and §8.7 cite §8.3 by section and are unchanged).

Route differs from the suggested text: instead of "scalar extension and faithfully flat descent" the README uses the supplier's own §1.7 equivalences (V⊗k̄ irreducible ⇔ absolutely irreducible ⇔ V⊗k′ irreducible for every k′), which is the imported API rather than a new argument.

## RT-AlgebraicModularFormsAndSerreWeightsPartII~2a/F02, RT-AlgebraicModularFormsAndSerreWeightsPartII~2b/F03 (P3) — applied

Witness verified at Tau Ceti pin 358314d: `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean` line 162 is `noncomputable def _root_.Module.Basis.symmetricPower`; line 167 is inside the docstring of `symmetricPower_apply`. Contract sentence: "line 167" → "line 162". No other locator in the README cites that file.

## RT-AlgebraicModularFormsAndSerreWeightsPartII~2b/F01 (P2) — applied

Witness verified: ShimuraCompactifications at its open head (#1053 per the roadmap service) states "Internal references `k.n` name target `n` of Layer `k`" and has no `C5.n` or `C3.n` labels; the only `C` labels there are ComplexComparisonPartII's. The nine targets exist under the numbers the reviewer gives and each heading matches the content the README describes: 4.9 boundary ideal along refinements, 4.10 coherent cohomology independent of the cone system, 7.3 integral toroidal compactifications, 7.4 formal completion along boundary strata, 7.10 strata detect components of geometric fibres, 7.12 logarithmic Kodaira–Spencer, 7.16 integral minimal compactification with O_{M^min}=π_*O_{M^tor}, 7.17 Hodge line ample on the minimal compactification, 7.23 Siegel Koecher with arbitrary coefficients.

Changes, throughout the README (37 lines) and in `design/plan.json` `gaps`: `C5.n` → `7.n` (n = 3, 4, 10, 12, 16, 17, 23), `C3.8–C3.9` → `4.9–4.10`, `§C5 (gap:siegel-parahoric-models)` → `Layer 7 (gap:siegel-parahoric-models)`; the one unprefixed occurrence in the §7.3 API bullet now names the roadmap; `gaps[0].section` is `Layer 7` and the `gap:siegel-logarithmic-de-rham` needs text says `7.12` in both plan and README. The citation resolver now reports no ShimuraCompactifications lead.

Not changed: the plan's `targets` entries carry strings such as `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`; the brief allows editing only the top-level `gaps` list, so they stay (the README is the roadmap).

## RT-AlgebraicModularFormsAndSerreWeightsPartII~2b/F02 (P3) — applied

Witness verified: under Conventions, X is the toroidal compactification and G its semiabelian family, so the old sentence defined u on the whole special fiber, where G^D and LF (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.21, for a BT₁) do not exist at the boundary.

Changes in §3.2: u is defined on the abelian interior (the open moduli space), with a sentence saying why nothing is asserted at the boundary; "u=1 everywhere" → "u=1 on the whole interior"; the p=2 Check says "complement in the interior" and "on the whole abelian interior"; the k[ε] Check says "smooth abelian interior of the special fiber"; one Check added (torus-rank-one boundary point: no referent; the specialization point E₁×E₂ is interior). Pattern search: §3.1 is over an abstract reduced base and treats the boundary by the connected recipe only; §§3.4–3.7 work on normal bases and the biconnected quotient; no other passage applies G^D or LF across the boundary.

## Checks run

- Worker repair (module-system warning): `packages/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean` now opens with `module` and declares its two imports as `public import Mathlib` and `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic`, the form used by the roadmaps on main that carry the `module` header (CoboundaryExpansion, TypeAHeckeAlgebras). Nothing after the import block changed.
- `lake env lean` on `packages/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean` from the content checkout, after the module header: exit 0, one warning (`declaration uses sorry`, the intended one); the `imports Mathlib from package mathlib ... consider adding module` warning no longer appears. No `lake build` was needed: the only remaining Tau Ceti import, `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic`, has its object file at the pin. The earlier signature-extraction failure came from the deleted `Restriction` import.
- Mechanical binder audit: a scratch copy with `#check @relIndex_conj_diag_eq_tameIndex_mul` elaborated; the printed type has exactly the binders `(N p : ℕ) (hp : Nat.Prime p) (hpN : p.Coprime N) (Γ : Subgroup SL(2, ℤ))`, the hypothesis `CongruenceSubgroup.Gamma N ≤ Γ`, and the two `relIndex` sides of README §5.2; nothing changed. The file has no section `variable` or `include`, so no hypothesis can drop silently. The two deleted declarations have no replacement to audit.
- Dependency check (command of the brief, `--movable`):

```text
depcheck: 209 roadmaps, 1817 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. ArithmeticGaloisRepresentations (line 51) and ShimuraCompactifications (line 178) both precede this roadmap (line 276).
- Citation resolver: the ShimuraCompactifications leads are gone; the four remaining AutomorphicBundles leads (B2.1, B5.10, B5.14, B5.19) predate this round and resolve through the letter-to-layer mapping stated in AutomorphicBundles' README, as both reviews recorded; they are outside these findings and untouched.
- Ownership: the symmetric-power irreducibility is now cited to its owner; `relIndex_conj_diag_eq_tameIndex_mul` remains owned here (Tau Ceti's Hecke-degree files state only full-level and Γ₀ degrees; `roadmaps grep` finds no arbitrary-tame-level diagonal coset index elsewhere). Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmap service's index.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §8.3 imported irreducibility of Sym^d(k²), k any field of characteristic p | d=0; p=2,d=1; p=3,d=2; p=3,d=3; k=F_p vs k=k̄₀ | d=0: dimension 1, lattice {0,k}. p=2,d=1: [[1,1],[0,1]] fixes only k·x, [[1,0],[1,1]] only k·y, no common line. p=3,d=2: orbit of x² contains (x+y)²=x²+2xy+y² and y², span dimension 3. p=3,d=3: (ax+cy)³=a³x³+c³y³, so ⟨x³,y³⟩ is invariant, dimension 2<4. k=F_p: Sym^d(F_p²)⊗F̄_p irreducible ⇒ absolutely irreducible ⇒ Sym^d(k²) irreducible for every k/F_p. | holds for d≤p−1, fails at d=p; range of the import kept; d=p added as a computed negative control |
| §8.3 orbit-span application (ℓ nonzero on some γ·P) | p=3,d=3,P=x³,ℓ=x²y-coefficient; d=0 | x³ orbit = cubes, ℓ=0 on all of it; d=0: orbit {P}, ℓ(P)≠0 | fails exactly at d=p, holds in the imported range; Check added |
| §8.3 direct value detection for degree d<p+1 | d=p+1, x^p y−xy^p; d=p | vanishes on all of F_p²; degree-p form has ≤p projective zeros <p+1 | unchanged, boundary d=p+1 retained as negative control |
| §8.3 standard-representation convention | p=3 upper/lower unipotents and product; p=2,k=F₄; p=0,k=ℚ | Ux=x,Uy=x+y; Lx=x+y,Ly=y; ULx=2x+y,ULy=x+y; image order 6 in 60; ZMod 0 gives infinitely many unipotents | conventions unchanged; retained as Checks, no Lean declaration |
| §3.2 unit u on the abelian interior | torus-rank-one boundary point; ordinary interior point; k[ε] | boundary: G^D, LF undefined, no referent; ordinary: u=1 from λ*Ha(G^D)=Ha(G), LF(Ha(G))=Ha(G^D); k[ε]: 1+ε≠1 | statement restricted to the interior, where the smooth reduced base and dense ordinary locus (dimension 3 vs 2) give u=1; specialization point E₁×E₂ is interior |
| §5.2 `relIndex_conj_diag_eq_tameIndex_mul` (unchanged, re-elaborated) | N=1,p=3; N=35,p=3 line stabilizer | 4=4·1; 20=4·5 | no change |
| Label remap ShimuraCompactifications | each of the nine labels | heading text at the head matches the cited content (listed above) | all resolve |

## For the maintainer

- `Suggested.lean` now states one headline (§5.2). The names `standardSL2` and `smallSymmetricPower_irreducible` no longer exist; no roadmap on main or at the indexed heads cited them (`roadmaps grep` found no hit).
- New supplier edge: ArithmeticGaloisRepresentations §§1.7, 7.8 (earlier in the order; no move).
- `design/plan.json` outside `gaps` still carries the old `C5` labels in target `sources` strings; only the `gaps` list was editable.
- Sources: no new work cited; `sources.toml` unchanged; no `needs-references.toml` request.
