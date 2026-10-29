# GATE-CategoricalOperatorAlgebras~3: answers to the review of c443e68

The commit is `79cccda` on top of `c443e68`. Only `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` changed. `Suggested.lean` is unchanged: it declares nothing, and its docstring remark that Mathlib's `CStarModule` has no interior tensor product is still true at the pin.

## H01 (CBirkbeck) — applied differently

CA1a's construction of adjointable and compact module operators (old README lines 166–183) and CA1b's interior tensor product, imprimitivity bimodules and Rieffel correspondence (old lines 238–259) are replaced by consumption of HilbertModules H1–H3. The README now proves only that `L_B(E,F)` forms a C*-category with `K_B` as an ideal and with linking algebra `L_B(E⊕B) ⊇ K_B(E⊕B)`, and keeps the nondegenerate correspondence bicategory and its reversal. A new supplier bullet "HilbertModules H1–H3" was added. CA1a, CA1b, CA3, CA7 and CA8 now have `*Needs:*` entries for HilbertModules. The old line 1011 now reads "HilbertModules H3's Morita invariance of simplicity". The old HilbertModules downstream claim (lines 1569–1571) and the Lance and Raeburn–Williams references are deleted. Two Checks were deleted: `C([0,1])` and the `M₂` θ's. The `ℂ²` imprimitivity/`ℂ⊕0` Check was replaced by a reversal Check: `ℂⁿ⊗_ℂ(ℂⁿ)‾≅M_n(ℂ)` (dimension n²) and `(ℂⁿ)‾⊗_(M_n)ℂⁿ≅ℂ` (dimension 1).

This differs from the suggested repair in two ways:
- **Merge order.** In the current merge order HilbertModules is line 10 and this roadmap is line 212, so HilbertModules is an earlier supplier and no move happens. The depcheck shows no `moved:` line.
- **Single owner cited.** HilbertModules H3 (its README lines 259–321) already contains everything consumed: the interior tensor product with associators, pentagon and both unitors, imprimitivity bimodules, the evaluation unitaries, the linking algebra `K_B(E⊕B)`, full corners, the Rieffel correspondence and "Deduce Morita invariance of simplicity". So it is cited as the only owner. NoncompactQuantumSymmetry P.7 (its README lines 462–520) covers a subset of this for induction. Citing both owners for the same object would split one interface.

## H02 (CBirkbeck) — applied

Subfactors at `f3533a4` is organised as `## Layer k` / `### k.n`, and contains no `S[0-9]` label. Every `Sk` reference is replaced by the matching subsection, checked at its Subfactors line:
- opposite weight: 1.2, line 590
- conjugate correspondence: 1.1, line 566
- minimal index `Ind(E_0)=d(X)²≤[M:N]`: 2.5, line 787
- extremality `d(X)²=[M:N]`: 5.1, line 1244
- TL example: 6.1, line 1325
- angle-power insertion: 6.2, line 1374 (not 6.4 as the review has it)
- weight correction: 6.3
- tower graph `δμ(v)=Σμ(w)`: 7.2, line 1506
- orthogonal and GJS models: 8.1–8.2
- Popa's standard model: 9.1–9.2

The contract row is now "Subfactors Layers 1–3, 5–9". CA8 also states its use of 2.1–2.3 (Jones tower, for the Watatani comparison) and 3.2 (Jones positivity at the permitted moduli). The old line "a nonexistent unshaded S8 theorem" now reads "a nonexistent unshaded version of those theorems".

## H03 (CBirkbeck) — applied

New Checks with computed values:

**CA1a**
- `L_B(B)≅C([0,1])` has only the projections 0 and 1, so Hilbert `C([0,1])`-modules fail the W* finite-linking criterion; with `B=ℂ` the criterion holds.
- The finite completion of `End=ℂ` is `Hilb_fd`, while the W*-Cauchy completion also contains `ℓ²(ℕ)`.

**CA6**
- Pairing axiom: with `V=Hilb_fd`, `P[0]=ℂ²` and `ψ=(a₁+a₂)/2`, the axiom forces `‖(1,0)‖²=1/2`, so the standard inner product (`=1`) violates it. This follows HPT-Anchored Definition 4.5 (P2), source lines 1373–1379.
- With `V=C=Hilb_fd` and `x=ℂ^k`: `dim P[n]=k^n`, whereas the wrong model `End(x^⊗n)` gives `k^(2n)`.

**CA9**
- Ultrapower: `L(F₂)_ω=ℂ` (no property Γ) versus `R_ω≠ℂ`.
- End_rev: `Hom(id,id)=Z(M)=ℂ`, and `Hom(id,Ad u)=ℂu` in `M₂(ℂ)`.
- Amplified corner, one coordinate versus two: `(pt,1,ρ)` against `({1,2},1⊗e₁₁,ρ⊗e₁₁)`. The unitary `T=1⊗e_(1,pt)` satisfies `Tρ(a)=(ρ(a)⊗e₁₁)T`, `T*T=1` and `TT*=1⊗e₁₁`. The data `(∅,0,0)` give the zero object.
- `M=ℂ` rectangular Hom: dimension `rk p·rk q`, which is 2 for the 2×1 block.
- Hilb-valued transpose: for `F=−⊗ℂ^k`, `F^t=−⊗(ℂ^k)‾`, and both sides have dimension `mnk`.

**CA10**
- Tube algebra of `Hilb(ℤ/3)`: dimension 9, nine simples.
- Tube algebra of `Hilb(S₃)`: dimension 36, eight simples of dimensions 1,1,2,3,3,2,2,2, with `1+1+4+9+9+4+4+4=36`. This is the non-commutative control.
- Conjugacy: `r=±id` on the unit object are conjugate via `u=i·id`, since `ū r u⁻¹=−r`.
- Balanced product: `Hilb_fd⊠_(Hilb_fd)M≃M` with `Z_C(E)=E`.

The review's proposed value `ψ=2·id` for the pairing check was not used. A rescaled state is already excluded by unitality (`ψ∘unit=id_1`, Definition 4.5, line 1365), so it does not test (P2).

## H04 (CBirkbeck) — applied

Each contract row now lists only what some `*Needs:*` line uses:
- **V6** is now in CA5's `*Needs:*`: the tracial standard form `L²(N,τ)` of the II₁ factor N, whereas M uses V11.
- **F2** is now in CA8's `*Needs:*`, for the noncrossing pair partitions that index the Wick-contraction trace. The contract row says so.
- **K8** (bootstrap/UCT, used nowhere) is dropped. The row is now "OperatorKTheory K1–K6". **K3** is added to CA7's `*Needs:*`: its boundary maps close the six-term sequence (OperatorKTheory README line 283).
- The OperatorAlgebraDynamics D6 row was moved from the contracts to the scope section, because D6 is a deferral and is not consumed.
- "Implement missing specializations here regardless of upstream timing" is deleted.

## Adversarial pass on changed statements

| Statement | Instance | Values | Result |
|---|---|---|---|
| `L_B(B)≅B` (unital B) | B=C([0,1]) | T↦T(1); the adjoint of left multiplication by a is left multiplication by a* | holds |
| W* fails for C([0,1]) | projections of C([0,1]) | {0,1}, whose span is ℂ ≠ C([0,1]) | not W* |
| Reversal Check | n=2 | dim ℂ²⊗ℂ²‾ = 4 = dim M₂; ℂ²‾⊗_(M₂)ℂ² = 1 | holds |
| CA6 (P2) | P[0]=ℂ², ψ=(½,½) | ⟨e₁,e₁⟩=ψ(1,0)=½ against the standard value 1 | standard inner product fails |
| CA6 Tr_V | k=2, n=2 | dim (ℂ²)^⊗2 = 4; dim End = 16 | discriminates |
| End_rev Hom(id,Ad u) | M₂(ℂ) | u*t central ⇒ t∈ℂu | dimension 1 |
| Corner T | p=1, q=1⊗e₁₁ | T*T=1, TT*=q | unitary |
| Transpose dimension | m=1, n=2, k=3 | HS(ℂ,ℂ²⊗ℂ³‾)=6=HS(ℂ³,ℂ²) | holds |
| Tube algebra of S₃ | Σ_(i,k)1 | 36; simple dimensions squared: 6+18+12=36 | holds |
| Conjugacy r↦−r | u=i | ū=(u†)∨=−i; (−i)r(−i)=−r | holds |
| Tube algebra of ℤ/3 | i=j only | 3·3=9 | holds |

## Ownership and citations

- **HilbertModules:** checked at `c3a41ca`, sections H2 (line 176) and H3 (line 259). It is line 10 of the merge order.
- **Subfactors:** checked at `f3533a4`.
- **VonNeumannAlgebras:** checked at `d6a00eb`, Layer 6 at line 1145. That README itself uses Vk labels.
- **OperatorKTheory:** checked at `d1b2465`.
- **FreeProbability:** checked on main, F2 at line 184.
- **NoncompactQuantumSymmetry:** checked at `72e22bd`, P.7.
- `roadmaps resolve` found nothing unresolved before the edit. The new citations name only the sections listed above.

## Signature check

`Suggested.lean` declares nothing, so there is no `#check` comparison to make. This was checked: the file has only a namespace and a docstring.

## Build and gate

- `lake build TauCetiRoadmap.CategoricalOperatorAlgebras.Suggested`: `Build completed successfully (8976 jobs).`
- Depcheck (`--movable`): `depcheck: 200 roadmaps, 1307 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Gate: `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Note

CStarAlgebras and OperatorKTheory, both existing suppliers, are neither on main nor in `ORDER.txt`. Depcheck reports no problem for them. This round did not change those rows except to narrow OperatorKTheory to K1–K6.
