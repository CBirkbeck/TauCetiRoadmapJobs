# Review of MotivesAndAlgebraicCycles (pull request #1313 at 04e21d3)

**Verdict:** accepted

Incremental re-review of the 67 lines changed since 57b8fe4 (41 insertions, 26 deletions, all inside `TauCetiRoadmap/MotivesAndAlgebraicCycles/`; nothing changed outside the folder). The six findings of the previous review are accounted for below; every changed passage was re-read against its sources and recomputed; the gate, the dependency check and the elaboration were run again.

## R01 (P3) — Friedlander–Voevodsky 5.14 is a corollary, not a theorem

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:841`, §4.15: “(Friedlander–Voevodsky, Theorems 5.5, 5.11 and 5.14, pp.23–29.)”

**Claim:** The locator names three theorems; the third statement is a corollary of Theorem 5.13, so a reader looking for “Theorem 5.14” will not find it.

**Witness:** Friedlander–Voevodsky (cache c5edd971) line 951 is Theorem 5.13 (abstract blow-up triangle, printed p.28), line 963 is “Corollary 5.14” (its long exact sequence for every `U`, p.29). Theorems 5.5 (line 786, p.23) and 5.11 (line 908, p.27) are stated as cited.

**Repair:** Write “Theorems 5.5 and 5.11, Theorem 5.13 and Corollary 5.14, pp.23–29”. The abstract blow-up sequence the paragraph uses is exactly Corollary 5.14 applied with the complex-level triangle of Theorem 5.13; nothing else in the paragraph changes.

## Previous findings

- R01 — repaired: §4.15 now defines `E_r(X;R)=C_*z_equi(X,r)⊗ℤᴸR` and `A_{r,i}(Y,X;R)` with derived coefficients, and §4.18 states `Hom(M(X),M(Y))≃CH_{dim X}(X×Y)⊗ℤR` and `CH^b(X)⊗ℤR≃Hom(M(X),R(b)[2b])`. The point values are now `R` on both sides (rows below).
- R02 — repaired: §2.8's Check requires degree zero on every connected component, keeps the connected elliptic-curve example, and adds `ℙ¹⊔ℙ¹` with class `(1,−1)` as the negative control; §§0.5b and 0.6 Checks reworded consistently.
- R03 — repaired: scope (line 12), supplier contract (line 58) and §5.7 with its *Needs:* line import ComplexComparisonPartII §C5.6's `regularSingularDeRhamComparison`; §5.7 keeps only the `k⊂ℂ` base-field adapter, the pair models and the compatibility adapters as local targets.
- R04 — repaired: the `<a id="mc2"></a>` tag is gone; the gate reports `residue=0`.
- R05 — repaired: §3.6 cites Deligne–Milne Definition 2.19, p.24, and Definition 3.7, Remark 3.9 and footnote 12, p.32; verified at cache 48f8af52 lines 1116, 1452, 1468, 1478 (page markers at lines 1087 and 1437).
- R06 — repaired: §4.11 cites MVW Appendix 8A, Proposition 8A.10 and Corollary 8A.11, pp.65–66, and now states the hypothesis as “cyclic permutation of `T⊗T⊗T` becomes the identity in the localization”; verified at cache 1197e239 lines 2586–2602 (printed 65–66).

No repair introduced a new blocking problem; the only new note is R01 above, a locator in a paragraph the repair of the previous R01 touched.

## Verified sound

### Gate, build and elaboration

- The worker's gate at this head: every counter zero (`residue=0`, `depcheck=0`, `build=0`), result `OK`.
- `lake env lean TauCetiRoadmap/MotivesAndAlgebraicCycles/Suggested.lean` from the worktree root: exit 0 in 11.6 s, exactly four `declaration uses sorry` warnings (lines 81, 95, 111, 134) and nothing else.
- A scratch copy of the file with `#check @name` for all four declarations elaborated once. The elaborated types keep every hypothesis the README states: Jannsen keeps `Field K`, `Preadditive`, `Linear K`, `HasFiniteBiproducts`, `IsIdempotentComplete`, both endomorphism hypotheses and `a.toPreadditive = hadd`; coalgebra reconstruction keeps essential smallness, abelianness, linearity and the exact faithful linear fiber; neutral recognition additionally keeps `MonoidalPreadditive`, `MonoidalLinear`, `SymmetricCategory`, `RigidCategory`, the `End(𝟙)=K` bijectivity and `ω.Braided`; the antipode theorem keeps `CommRing B`, `Bialgebra K B` and rigidity of `TauCeti.FGComoduleCat K B`. Nothing changed: the Lean diff since 57b8fe4 is docstring-only (module docstring lines 8–11 and 32–34).
- The one-tactic padding probe and the missing-headline inventory of the previous review stand: no declaration was added, removed or restated. The four theorems remain the four statable abstract headlines; the docstring now also names the derived-coefficient equidimensional-cycle complex and bivariant groups of §§4.15–4.18 among the absent Layer 4 carriers, which is correct at the pins (no `z_equi`, Suslin complex or cdh site exists in Mathlib `6b7abb3` or Tau Ceti `a91d3aa`).

### Supplier direction

The dependency check with `--movable` against the board's merge order and the content checkout printed, in full:

```text
depcheck: 205 roadmaps, 1622 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The two new supplier citations resolve downward: `ORDER.txt` lists ComplexComparisonPartII at line 38 and KTheoryFiniteLocalFields at line 67, MotivesAndAlgebraicCycles at line 69. All six literal *Needs:* lines (README 65, 393, 423, 439, 839, 1062) were read; the new one at 839 cites only internal sections §§4.3–4.4, 4.10, 4.14 and KTheoryFiniteLocalFields §3.0a, the amended one at 1062 adds ComplexComparisonPartII §C5.6.

### Cross-roadmap citations resolved at the open heads

- `TauCetiRoadmap/ComplexComparisonPartII/README.md` (pull request head, read through the roadmap tool): §C5.6 heading at line 3722; `regularSingularDeRhamComparison` at line 3822 states `H^q_dR(U,(E,∇))≅H^q(U^an,V)` for every smooth finite-type complex variety and every `q`, with the logarithmic model `Ω^•_X(log D)⊗Ē→Rj_*(…)` a quasi-isomorphism when no residue eigenvalue is a positive integer; `deligneRiemannHilbert` (line 3805) covers a general `U` by quasi-projective opens, so nonquasiprojective varieties are included as the contract says. Its Check at line 3836 computes `H⁰=H¹=ℂ` on `𝔾_m` for the trivial connection, agreeing with the README's §5.7 Check. The residue-zero lattice `O_X` of the trivial connection satisfies the eigenvalue condition.
- `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` (pull request head): §3.0a at line 513 constructs `BlochCycle` and `HigherChow` and states that for every commutative `R` coefficients are derived tensor products computed termwise on the free cycle groups; line 1714 names MotivesAndAlgebraicCycles as the consumer. The new *Needs:* of §4.15 asks for exactly this.
- The 11 resolver leads in the worker's citation list are unchanged from the previous review (SchemeAndStackFoundations and EtaleCohomologyFoundations planned names; StandardConjectures as a downstream consumer); none is in a changed passage.

### Source locators of the changed passages

| Passage | Source opened | Result |
| --- | --- | --- |
| §3.6 Tannakian terminology | Deligne–Milne 2012 text, cache 48f8af52 lines 1116 (Def. 2.19, p.24), 1452 (Def. 3.7), 1468 (Rem. 3.9), 1478–1481 (footnote 12), all p.32 | Footnote 12 states that a fibre functor over an extension field makes `C` Tannakian; this is the README's definition. R05 closed. |
| §4.11 tensor localization | MVW cache 1197e239 lines 2568–2602, Prop. 8A.10 and Cor. 8A.11, printed pp.65–66 | Hypothesis “cyclic permutation on `T^{⊗3}` is the identity in `C[T⁻¹]`”, conclusion symmetric monoidal, resp. tensor triangulated. R06 closed. |
| §4.15 definitions (seeded) | Friedlander–Voevodsky cache c5edd971 lines 531–539 (Thm 4.2(1)–(2), p.16), 612–623 (Def. 4.3, p.18) | `A_{r,i}(Y,X)=H^{-i}_cdh(Y,(C_*z_equi(X,r))_cdh)`; at a point equals `h_i(z_equi(X,r))(Spec k)`; `h_0=CH_r(X)`; affine equidimensional `X` gives `CH^{dim X−r}(X,i)`. The integral statements match; the coefficient versions are the derived extension (rows below). |
| §4.15 localization paragraph | same cache lines 786–795 (Thm 5.5, pp.23–24), 908–915 (Thm 5.11, pp.27–28), 951–966 (Thm 5.13, Cor. 5.14, pp.28–29) | Resolution hypothesis present in each; R01 locator note. |
| §4.15 point/coefficient conventions | Voevodsky cache b15df626 lines 1435–1440 (Def. 4.2.1, p.46) | Uses `π*(C_*z_equi)`, consistent with the README's identification under §4.10's exact `π*`. |
| §4.18 representability | Voevodsky lines 1465–1478 (Prop. 4.2.3, p.47), 1479–1505 (Cor. 4.2.4–4.2.7, pp.47–48), 1507–1519 (Prop. 4.2.8, p.48) | Cor. 4.2.6 is for smooth proper `X,Y` with `Hom(M(X),M(Y))=A_{dim X}(X×Y)` and vanishing for `i>0`; Prop. 4.2.8 is the internal-Hom form under resolution. Locators pp.47–49 correct. |
| §0.6 (seeded; Check changed) | Benoist–Wittenberg I, linked journal-paginated copy, cache daeb43ec lines 2417 (Prop. 5.1, p.63), 2520 (Prop. 5.2, p.66), §5.1 from p.62; Colliot-Thélène–Voisin cache 6a76c596 lines 415–420 (Prop. 3.3(ii), p.10), 1756–1759 (Prop. 9.1, p.42) | Prop. 3.3(ii): support in codimension `r` kills `H^p(X,ℋ^d(A))` for `p<r`, for connected `X`; the README's `0≤p<d−s` with componentwise application agrees. Prop. 9.1 gives the displayed correspondence action modulo algebraic equivalence. The arXiv copy (cache 9fb55d1d) has the same propositions on pp.55 and 57; the README cites the linked copy's pages, which is correct. |
| §5.7 nonproper comparison | ComplexComparisonPartII §C5.6 as above; Grothendieck 1966 and Deligne Hodge II locators unchanged | Ownership moved to the supplier; R03 closed. |

### Adversarial values

New rows for every changed statement; the untouched rows of the previous review are carried forward after them, each marked “r2” and unchanged in value. Notation as before: pt = Spec k, `R` the coefficient ring.

| Statement | Instances tried | Computed values on the two sides / excluded alternative | Result; change |
| --- | --- | --- | --- |
| Conventions: `CH_j(X)_R=CH_j(X)⊗ℤR` as degree-zero group | Bloch/Suslin complex `C` free in degrees ≥0; `R=𝔽₂`, `R=0` | `H_0(C⊗ᴸR)=coker(C_1⊗R→C_0⊗R)=H_0(C)⊗R` by right exactness; `R=0` gives 0 both sides. Not asserted: exactness of ordinarily tensored localization | Retain |
| 0.5b Check: degree-zero divisor action | `ℙ¹_ℂ`; connected genus-one curve, nontorsion `P` | On `ℙ¹` every degree-zero divisor is 0 in `CH¹`; on `E`, `[P]−[O]≠0` in `Pic⁰⊗ℚ=E(ℂ)⊗ℚ` yet algebraically trivial, so the action factors through 0 | Retain |
| 0.6 Check: componentwise degree zero | `ℙ¹⊔ℙ¹`, `D=[x₁]−[x₂]` | Component degrees `(1,−1)`, not algebraically trivial, so the Check's “on each connected component” is the needed hypothesis; `(0,0)` acts by 0 | Retain; R02 closed |
| 2.8 Check: zero degree-two class | `ℙ¹⊔ℙ¹`, `D=(1,−1)`; connected `E`, `[P]−[0]` with `P` of infinite order | `cl(D)=(1,−1)≠0` in `H²(C,ℚ(1))=ℚ²`; on `E`: `cl=deg=0`, rational Chow class `P⊗1≠0` since `E(ℂ)/tors` is torsion-free | Retain both bullets; R02 closed |
| 3.6 Tannakian over `F'/F` | `Vec_F`; odd super line | Fibre over `F` itself: neutral; odd line's symmetric forgetful fibre fails in characteristic ≠2; footnote 12 gives Tannakian from a fibre over any `F'⊇F` | Retain; R05 closed |
| 4.11 cyclic condition in the localization | Odd line `T` over `ℚ`; `T=𝟙` | Three-cycle on `T^{⊗3}` = product of two transpositions `(−1)²=+1`; unit has cyclic action `1` already in `C` | Retain; R06 closed |
| 4.15 `E_0(pt;R)` | `R=ℤ,𝔽₂,0` | `z_equi(pt,0)=ℤ`, Suslin faces `0,id,0,…`, so `C_*ℤ≃ℤ[0]` and `E_0(pt;R)=R[0]`; `A_{0,0}(pt,pt;R)=R` gives `ℤ,𝔽₂,0` | Retain |
| 4.15 `A_{r,0}(pt,X;R)=CH_r(X)⊗ℤR` | `X=pt`, `R=𝔽₂`; `X=𝔸¹`, `r=0` | `h_0(C(pt)⊗ᴸR)=h_0(C(pt))⊗R` (complex in degrees ≥0, free); `CH_0(𝔸¹)⊗R=0` both sides | Retain |
| 4.15 point sections of the cdh complex | `Y=pt` | Every cdh cover of `Spec k` is refined by the identity (abstract blow-ups with `Z=Spec k` or `Z=∅`), so `H^{-i}_cdh(pt,K)=h_i(K(pt))` and `⊗ᴸR` commutes with sections (finite totalization of a free resolution) | Retain |
| 4.15 derived reduction Check | `ℤ --2→ ℤ` in degrees 1,0; `⊗ᴸ𝔽₂` | Becomes `𝔽₂ --0→ 𝔽₂`: `H_1=H_0=𝔽₂`; integrally `H_1=ker 2=0`, `H_0=ℤ/2`; `H_1⊗𝔽₂=0≠𝔽₂` | Retain |
| 4.15 coefficient change `E_r(X;R)⊗RᴸS≃E_r(X;S)` | `ℤ→𝔽₂→0`; `R→R` | `(C⊗ℤᴸR)⊗RᴸS=C⊗ℤᴸS` by associativity; point cycle of multiplicity 3 ↦ 1 ↦ 0; identity leaves classes fixed | Retain |
| 4.15 affine identification with coefficients | `X` affine equidimensional, `i≥0` | FV 4.2(2) is a quasi-isomorphism of complexes of sections; `⊗ᴸR` on both sides gives the supplied derived `CH^{dim X−r}(X,i;R)`; for `i<0` both vanish | Retain |
| 4.16 Check `A_{0,0}(U,X;R)` | `U` smooth projective, `X=pt` | Duality `A_{0,0}(U,pt;R)≃A_{dim U,0}(pt,U;R)=CH_{dim U}(U)⊗R=R^{π₀(U)}`; codimension `dim U` would read `CH⁰`, wrong when `dim X≠dim U` | Retain |
| 4.17 `Mᶜ(X)=E_0(X;R)` | `X=pt`; `X=𝔸ⁿ`, `n=1` | `E_0(pt;R)=R`; `E_0(𝔸¹;R)[−2]≃R(1)` from the integral quasi-isomorphism tensored with `R` | Retain |
| 4.18 representability with `R` | `Y=X=pt`, `r=i=0`, `R=𝔽₂` and `0` | Left `Hom(R,R)=R`; right `A_{0,0}(pt,pt;R)=R`: `𝔽₂=𝔽₂`, `0=0` | Retain; R01 closed |
| 4.18 internal Hom `RHom(R(r)[2r],Mᶜ(X))≃E_r(X;R)` | `ℤ(r)[2r]` a summand of `M(ℙ^r)`, compact | `RHom_R(M⊗ᴸR,N⊗ᴸR)=RHom_ℤ(M,N⊗ᴸR)=RHom_ℤ(M,N)⊗ᴸR` for compact `M`; integral case is Voevodsky 4.2.8 | Retain |
| 4.18 `Hom(M(X),M(Y)[i])` for smooth proper `X,Y` | `i=0`, `i=1`; `R=ℤ/4` | `h_{−i}(E_{dim X}(X×Y;R)(pt))`: `i=1` reads degree `−1` of a complex supported in degrees ≥0, so 0 for every `R`; `i=0` gives `CH_{dim X}(X×Y)⊗R` by right exactness, nonflat `R` allowed | Retain |
| 4.18 Check `CH^b(X)⊗ℤR≃Hom(M(X),R(b)[2b])` | `X=ℙ¹`, `b=1`, `R=𝔽₂` | `H^{2,1}(ℙ¹,𝔽₂)=CH¹(ℙ¹,0;𝔽₂)=H_0(z¹(ℙ¹,•)⊗ᴸ𝔽₂)=ℤ⊗𝔽₂=𝔽₂`; reversed Hom would be Borel–Moore homology | Retain (perfect-field scope stated in §4.17) |
| 4.18 point Check with `R=𝔽₂,0` | pt; `𝔸¹` | Representability, Borel–Moore and internal Hom give `R`; `H^BM_{2,1}(𝔸¹)=Hom(R(1)[2],R(1)[2])=R` by cancellation | Retain |
| 5.7 base-field adapter | `X=𝔾_m` over `k=ℚ` | `H¹_dR(𝔾_m/ℚ)=ℚ·dz/z`; `⊗_ℚℂ` is flat and `X_ℂ→X` affine, so `H^n_dR(X/k)⊗_kℂ≃H^n_dR(X_ℂ/ℂ)`; `dz/z⊗1↦dz/z` | Retain |
| 5.7 Check: `𝔾_m` and `𝔸¹` | trivial connection, residue-zero lattice on `ℙ¹` | `O→Ω¹(log{0,∞})=O`, differential 0 on global sections, `H⁰=H¹=ℂ`; `∮dz/z=2πi` on the positive loop; `H¹_dR(𝔸¹)=0` | Retain |
| Supplier contract line 58 | trivial connection | Residues of `O_X` are 0, not a positive integer, so the §C5.6 logarithmic model applies | Retain |
| Lean docstring, Layer 4 bullet | pins | No `z_equi`, Suslin complex or cdh carrier at Mathlib `6b7abb3`/Tau Ceti `a91d3aa`; statement “absent” correct | Retain |
| 0.1 correspondence grading | pt; ℙ¹; empty source | Corr⁰(pt,pt)=ℚ; identity degree 0; empty-source group=0 | r2; unchanged |
| 0.1 composition | Two points; a=E₂₁,b=E₁₂ | b∘a=E₁₁; a∘b=E₂₂, unequal | r2; unchanged |
| 0.2 graph/transpose | Inclusion pt→ℙ¹ | Graph in Corr⁰(ℙ¹,pt); transpose in Corr⁻¹(pt,ℙ¹) | r2; unchanged |
| 0.2 external product | Scalars 2,3 on pt | Exterior product and action both 6 | r2; unchanged |
| 0.3 projectors | Pointed genus-one curve | Ranks (1,2,1); pairwise products 0; sum identity rank 4 | r2; unchanged |
| 0.4 algebraic equivalence | ℙ¹⊔ℙ¹; divisor (1,−1) | Total degree 0; component vector (1,−1), not algebraically trivial | r2; unchanged |
| 0.5 numerical testing | ℙ¹×ℙ¹, u²=v²=0, uv=1 | (u−v)(u+v)=0; (u−v)u=−1 | r2; unchanged |
| 0.5 normalization | pt; total relation | Quotient ℚ with deg(1)=1; total relation would impose 1=0 | r2; unchanged |
| 0.5a supports/purity | Empty support; (𝔸¹,{0}) | Empty supported groups=0; purity term in degree 2, twist 1 | r2; unchanged |
| 0.5b residue convention | t, u, t³u | Residues 3, 0; two boundaries compose to 0 | r2; unchanged |
| 0.5c inseparable multiplicity | k=𝔽ₚ(t), t^(1/p) | Pushforward degree p; multiplicity 1 loses factor p | r2; unchanged |
| 0.6 universal support | ℙⁿ; positive-genus curve | CH₀(ℙⁿ_K)=ℤ, support dimension 0; curve needs dimension 1 | r2; unchanged |
| 0.6 coniveau range | d=3, s=2 | Range has p=0 only | r2; unchanged |
| 0.6 real restriction | Real curve, two real components | Parity vector (1,1) nonzero despite even total degree | r2; unchanged |
| 0.7 indices | Anisotropic conic; ℙ¹; ∅ | Index 2 but χ(O)=1; 1; gcd convention 0 | r2; unchanged |
| 0.8 torsion cycle | Order-two τ | 2τ=0, τ⊗ℚ=0; parity detector 1 mod 2 | r2; unchanged |
| 1.1 twisted Hom | Unit twists; zero projector | Hom=ℚ iff m=n; projector 0 gives zero object | r2; unchanged |
| 1.2 Tate/additivity | 𝟙(1)⊗L; empty sum | Twist 0 gives 𝟙; empty sum 0 | r2; unchanged |
| 1.3 duality | 𝟙(m); ℙ¹ | Dual twist −m; ℙ¹ dual is h(ℙ¹)(1) | r2; unchanged |
| 1.4 Chow/identity principle | L; unit | CH¹(L)=ℚ, CH⁰(L)=0; CH⁰(𝟙)=ℚ | r2; unchanged |
| 1.5 universal extension | F(L)=U, 𝟙(1) | F(𝟙(1))=U⁻¹; F(L⊗𝟙(1))=𝟙 | r2; unchanged |
| 1.6 projective formula | ℙ²; ranks 0,1 | Diagonal=h₁²+h₁h₂+h₂²; rank 0 gives 0, rank 1 gives h(X) | r2; unchanged |
| 1.7 adequate quotients | Numerical pt; total quotient | End(𝟙)=ℚ versus 0 | r2; unchanged |
| 2.1 Koszul symmetry | Degree-one and degree-two lines | Self-interchange −1 versus +1 | r2; unchanged |
| 2.2 Weil dimensions/trace | ℙ¹; elliptic curve; two ℙ¹ | Euler traces 2,0,4 | r2; unchanged |
| 2.3 Tate rescaling | λ=2 | Divisor class ×1/2, trace ×2; trace of class 1 | r2; unchanged |
| 2.3 homological ⇒ numerical | Class zero | Cup product 0, degree pairing 0; converse not assumed | r2; unchanged |
| 2.4 Chern normalization | Codimension-two point | Leading c₂=−[pt]; sign factor recovers [pt] | r2; unchanged |
| 2.5 normalized comparison | ℙ¹ point class | Raw 2πi; normalized trace 1 | r2; unchanged |
| 2.6 field trace | Spec ℚ(i)/ℚ | Trace of 1 is 2 on both sides | r2; unchanged |
| 2.6 de Rham Chern sign | O(1) on ℙ¹ | c′ integrates to −2πi; −c′ to +2πi | r2; unchanged |
| 2.7 Frobenius | ℙ¹/𝔽_q | H² eigenvalue q; Tate 1/q; product 1 | r2; unchanged |
| 2.7 prime restriction | ℓ=char k | μ_(p^n)(ksep)={1}, rank 0 | r2; excluded by hypothesis |
| 2.8 finite-map formula | Component inclusion; degree-two map | f_*f*=diag(1,0); 2 id | r2; unchanged |
| 3.1 trace radical | Genus-two curve | Supertrace 1−4+1=−2; dimension 6 | r2; unchanged |
| 3.1 characteristic-zero need | Identity on 𝔽ₚ^p | Tr(id^n)=0 for all n, id not nilpotent | r2; unchanged |
| 3.2 Jannsen criterion headline | Dimensions 0,1,2 | n=0,1,2; End rings 0,K,M₂(K) semisimple | r2; unchanged |
| 3.2 radical control | K[ε]/ε² | ε²=0, radical nonzero | r2; unchanged |
| 3.3 numerical semisimplicity | pt; zero motive | End ℚ and 0; 1 and 0 summands | r2; unchanged |
| 3.4 lifting | Upper triangular mod radical | e=diag(1,0), f=[[1,1],[0,0]] both idempotent | r2; unchanged |
| 3.5 signed symmetry | Genus-two curve; odd line | Ranks −2,−1 versus 6,1 | r2; unchanged |
| 4.1 finite correspondences | 𝔸¹→pt and transpose | Graph finite; transposed support has dimension-one fibre | r2; unchanged |
| 4.1 inseparable graph | Frobenius of 𝔸¹ | Composite p·id | r2; unchanged |
| 4.2 transfer tensor | 2id | Single diagonal factor 2; both factors 4 | r2; unchanged |
| 4.2 disjoint sums | Two points squared; ∅ | 4 points; 0 | r2; unchanged |
| 4.3 Nisnevich condition | Spec ℂ→Spec ℝ; identity | No lift; lift | r2; unchanged |
| 4.3 cohomological obstruction | Gₘ on ℙ¹, 𝔸¹ | Pic ℤ versus 0 | r2; unchanged |
| 4.4 Suslin differential | Constant simplicial group | Face sums 0,id,0,…; positive homology 0 | r2; unchanged |
| 4.4 Tate/weight one | Gₘ; pt | Reduced Gₘ shifted is R(1); H^(1,1)(k)=k× | r2; unchanged |
| 4.5 homotopy tests | Gₐ versus Gₘ | k→k[t] not onto; k×→k[t]× iso | r2; unchanged |
| 4.5 contraction | Gₘ | ℤ then 0 | r2; unchanged |
| 4.5 finite-field descent | Degrees 2,3 | (−1)·2+1·3=1 | r2; unchanged |
| 4.6 derived tensor | ℤ/2⊗ᴸℤ/2 | H⁻¹=H⁰=ℤ/2 | r2; unchanged |
| 4.6 boundedness | ⊕R[−n] | Unbounded cohomology | r2; unchanged |
| 4.7 higher cycles | pt | CH⁰(pt,0)=ℤ, CH⁰(pt,n>0)=0 | r2; unchanged |
| 4.8 localization/homotopy | 𝔸¹ | CH₀=0, CH₁=ℤ; pullback shift +1 | r2; unchanged |
| 4.8a specializations | Length-p fibre | Multiplicity p versus 1 | r2; unchanged |
| 4.8b smooth-pair coordinates | (𝔸²,𝔸¹); codim 0 | Normal rank 1 and 0 | r2; unchanged |
| 4.9 cancellation function | n=1; n=0 | (t+1)/t degree 1; n=0 denominator vanishes | r2; unchanged |
| 4.9 cancellation headline | Unit, Tate twist | End(R)=R=End(R(1)); 0=0 | r2; unchanged |
| 4.10 complex comparison | K=F[1] | H⁻¹=F versus 0 | r2; unchanged |
| 4.10 cdh topology | Nilpotent thickening; empty-centre blowup | Same reduced data; identity | r2; unchanged |
| 4.11 geometric compactness | Unit; infinite sum, R≠0 | Compact; identity cannot factor through a finite subsum | r2; unchanged |
| 4.11 tensor inversion | ℕ; ℚ in Ab | ℤ; ℤ/p⊗ℚ=0 | r2; unchanged |
| 4.12 projective bundles | ℙ⁰,ℙ¹,ℙ²; rank 0 | 1,2,3 summands; 0 | r2; unchanged |
| 4.12 Mayer–Vietoris sign | Trivial cover | i−i=0 versus 2i | r2; unchanged |
| 4.13 blowup splitting | Divisor; point on surface | 0 and 1 extra summands | r2; unchanged |
| 4.13 Gysin boundary | (𝔸¹,{0}) | Boundary(t)=+1 | r2; unchanged |
| 4.14 relative cycles | st=1 | Fibre at 0 empty; quasi-finite not finite | r2; unchanged |
| 4.16 cycle duality | U=pt; U=ℙ¹ | Shift 0 then +1 | r2; unchanged |
| 4.16 Gysin sequence | c=1 | Closed index r+1; boundary i−1 | r2; unchanged |
| 4.17 compact support headline | pt; 𝔸¹; ∅ | R, R(1)[2], 0; M(𝔸¹)=R | r2; unchanged |
| 4.17 higher-Chow headline | H^(2,1)(ℙ¹); a>2b | R; 0 | r2; unchanged |
| 4.18 Chow embedding headline | L; 𝟙(1) | R(1)[2], R(−1)[−2] | r2; unchanged |
| 4.18 projective Hom | ℙ¹×ℙ¹, R=ℤ/2 | (ℤ/2)²; positive Ext 0 | r2; unchanged |
| 4.19 compact duality headline | 𝔸¹; pt | Mᶜ(X)(−1)[−2]=R=M(X)∨; R∨=R | r2; unchanged |
| 4.19 Tate extension | Hom(R,R(1)[1]) | k×⊗R in the flat rational case | r2; unchanged |
| 4.20 motivic measure headline | ℙ¹; Gₘ | L+1; L−1; [M[1]]=−[M] | r2; unchanged |
| 5.1 endomorphism coalgebra | K²; two vertices | M₂(K), K; zero arrow K² | r2; unchanged |
| 5.2 reconstruction headline | Vec_K; K[ε]/ε² | K; dimension 2 nonsemisimple | r2; unchanged |
| 5.3 pair motives | (X,X); (Gₘ,{1}) | 0; H¹=ℚ(−1) | r2; unchanged |
| 5.4 cellular filtration | (𝔸¹,{0,1}) | Differential rank 1; H¹ dimension 1 | r2; unchanged |
| 5.5 total complex | Two degree-one differentials | Mixed terms +1 and −1 | r2; unchanged |
| 5.6 tensor symmetry | Two degree-one classes | Flip −1, correction −1, composite +1 | r2; unchanged |
| 5.6 canonical localization | ℚ[t]→ℚ | Kernel (t−1)≠0 | r2; unchanged |
| 5.7 generators/rigidity | Two-point support; ℤ/2 | Two Tate summands; Hom(ℤ/2,ℤ)=0 | r2; unchanged |
| 5.8 correspondence action | rΔ | 0, −id, 2id | r2; unchanged |
| 5.8 equivariance | S₃; characteristic 2 | Factor 1/6 unavailable | r2; unchanged |
| 5.9 Nori realization headline | pt; R(1)[2] | ℚ_N[0]; L_N[−2] | r2; unchanged |
| 5.9 choice independence | (𝔸¹,{0,1}) | Rank-one differential persists | r2; unchanged |
| 6.1 finite reconstruction | Gₘ weight 1 | Tensor square weight 2 outside hull | r2; unchanged |
| 6.2 neutral reconstruction headline | Rep(Gₘ); Rep(μₚ) | K[t,t⁻¹]; K[t]/(tᵖ−1) nonreduced | r2; unchanged |
| 6.2 antipode headline | Group-like t | S(t)t=1; S(t)=t gives t²≠1 | r2; unchanged |
| 6.2 antipode degenerate | 1; primitive x | S(1)=1; S(x)=−x | r2; unchanged |
| 6.3 finite type vs finite | Gₘ; trivial group | Infinite-dimensional; K | r2; unchanged |
| 6.3 functor of points | μ₂, characteristic 2, K[ε] | 1+ε squares to 1 | r2; unchanged |
| 6.4 coequalizer | E₁₂,E₂₁ | E₁₁≠E₂₂ | r2; unchanged |
| 6.4 finite pieces | Weights in S | Dimension #S; union indexed by ℤ | r2; unchanged |
| 6.5 heap | 5,2,3 | 6; h(x,y,y)=x | r2; unchanged |
| 6.5 nonabelian heap | S₃ | xy⁻¹z=(132) versus xyz=id | r2; unchanged |
| 6.5 unpointed torsor | t²=−1 over ℝ | No ℝ-point; ±i over ℂ | r2; unchanged |
| 6.6 integral coefficients | 2(y−x)=0 | ℤ⊕ℤ/2; dual loses ℤ/2 | r2; unchanged |
| 6.6 matrix coefficients | Entry (1,2) | 1 versus 0 | r2; unchanged |
| 6.7 formal periods | 1; ℓ | per(1)=1, per(ℓ)=2πi, per(ℓ⁻¹)=(2πi)⁻¹ | r2; unchanged |
| 6.8 actions/extension | b,d unipotent | bd≠db | r2; unchanged |
| 6.9 torsor headline | Φ=I, x=bd | h(Φ,Φ,Φ)=I; bΦd≠db | r2; unchanged |
| 6.9 Tate coactions | t | u⊗t, t⊗v; t⊗t⁻¹⊗t | r2; unchanged |
| 6.10 Artin case | Quadratic; S₃ | Dimensions 2, 6; not 36 | r2; unchanged |
| 6.10 pure Tate | 1⊕L | End=ℚ×ℚ; aⁿ; symmetry +1 | r2; unchanged |
| 7.1 Hodge inverse image | tate 0, tate(−1), zero | Pieces ℚ; zero comparison full inverse image | r2; unchanged |
| 7.2 Tate target | pt⊔pt | ℚ_ℓ²; (1,0) | r2; unchanged |
| 7.2 strong Tate | Unipotent Frobenius | Fixed dimension 1, no complement | r2; unchanged |
| 7.2 rational injection | Finite field versus ℂ | Pic⁰⊗ℚ=0 versus nontorsion survives | r2; unchanged |
| 7.3 Lefschetz inverse | deg η=a | 1↦a[pt]; [pt]↦1/a | r2; unchanged |
| 7.3 primitive positivity | u−v | (u−v)²=−2; signed +2 | r2; unchanged |
| 7.3 compared realization | h↦2h | Trace 1→2 | r2; unchanged |
| 7.4 Frobenius projectors | ℙ¹/𝔽₂ | Values 1,0 and 0,1 | r2; unchanged |
| 7.4 norm coefficient | n=3 | 48 versus 216 | r2; unchanged |
| 7.5 filtration headline | Curve; ℙⁿ | F¹=Pic⁰⊗ℚ, F²=0; positive filtration 0 | r2; unchanged |
| 7.5 projector descent | ℚ→ℚ² | (1,0) not in image | r2; unchanged |
| 7.6 motivic t-structure | M(ℙ¹) | Summand in shifted degree −2 | r2; unchanged |
| 7.6a equivariant groups | C₂ trivial/sign | H⁰=ℤ,H²=ℤ/2; H⁰=0,H¹=ℤ/2 | r2; unchanged |
| 7.6b real/complex purity | Codimension one | Shifts 1 and 2 with twist 1 | r2; unchanged |
| 7.7 admissibility | Real point; conjugate pair | Degrees 1 and 2 | r2; unchanged |
| 7.7 zero/out-of-range | ∅; codimension > dimension | Both 0 | r2; unchanged |
| 7.8 blowup indices | c=1,2,3 | 0, 1, 2 extra terms | r2; unchanged |
| 7.8 excluded zero centre | pt along itself | Empty Proj; ℤ→0 not iso | r2; correctly excluded |
| 7.8 projective space | ℙ² | 1,h,h²,0 | r2; unchanged |
| 7.9 genus/one-cycles | Anisotropic conic | Genus 0; multiplicity 1 | r2; unchanged |
| 7.9 norm parity | Nonreal point | Degree 2 versus 1 mod 2 | r2; unchanged |
| 7.10 dimension restriction | Real genus-one curve | Genus 1 odd | r2; unchanged |
| 7.11 quaternionic action | T | T²=−1; fixed vector 0 | r2; unchanged |
| 7.11 invariant-line obstruction | Tv=av | abs(a)²≥0 ≠ −1 | r2; unchanged |
| 7.11 Euler example | B×ℙ¹ | χ(O)=0 | r2; unchanged |
| 7.12 coefficient boundary | Bockstein on BC₂ | ℤ/2→ℤ/2 iso | r2; unchanged |
| 7.13 torsion calculation | ℤ⊕ℤ/2⊕(ℝ/ℤ)³⁰ | ℤ/2⊕(ℚ/ℤ)³⁰ | r2; unchanged |
| 7.14 cycle questions | Line in ℙ³; conic | Present; absent | r2; unchanged |
| 7.15 compatible classes | Unit; twist; Artin character | ℚ; 0; 0 | r2; unchanged |
| 7.16 rank predicate | Rank 0 | Dimension 0; centre s=1 | r2; unchanged |
| 7.17 rational vs complex positivity | u−√2v | Positive on ℚ²; isotropic over ℝ | r2; unchanged |
| 7.17 primitive exponent | d=3,p=2; d=2,p=1 | m=0; m=1 | r2; unchanged |
| 7.17 height normalization | Degrees 1,2,3 | Raw 1,2,6; absolute 1 | r2; unchanged |
| 7.18 rank specialization | n=2 | Dimension 1; order 1 versus 3 | r2; unchanged |
| 7.19 archimedean factor | r=1, degree 2 | C₁=−π/4; C₁²>0 | r2; unchanged |
| 7.19 local/cardinality premise | q=3 | q+1=4≠0; two split places | r2; unchanged |
| 7.19 nonvanishing conclusion | Dimension 2 | Nonzero yes, dimension 1 no | r2; unchanged |

### Pinned declarations and ownership

The pins are unchanged since the previous review (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` in `lake-manifest.json`); its fourteen opened declarations (`Simple`, `Abelian`, `Functor.Braided`, `FGComoduleCat.isFG`, the finite-comodule abelian and symmetric structures, `tensorAutFunctor`, Hodge `tate`, `TriangulatedK0`, `QuaternionicStructure`, and the rest at the file and line it lists) are all cited by Lean statements the diff does not touch, and the elaboration above shows those statements still resolve against them. For the changed README passages, the objects are the equidimensional-cycle complex, bivariant groups and the nonproper de Rham comparison: I searched the pinned sources for `zequi`, `Suslin`, `cdh`, `Bivariant`, `logarithmic de Rham` and `RegularSingular` (no hits in Mathlib or Tau Ceti), and the roadmap grep for `z_equi`, `bivariant`, `regularSingularDeRhamComparison` and `nonproper de Rham` across main and the open heads: the cycle objects occur only in this roadmap and in KTheoryFiniteLocalFields §3.0a as the Bloch-complex supplier it cites; the nonproper comparison occurs only in ComplexComparisonPartII §C5.6, now cited rather than rebuilt. Ownership against open pull requests other than those the brief lists by path, or readable through the roadmap tool, was not checked further.

### Shape

The changed §4.15 now has an explicit API bullet list and a *Needs:* line beside the definition, with five Checks, three of them new (coefficient values, derived reduction, coefficient change); every other changed subsection keeps at least three Checks. No process words, pull-request numbers, LaTeX delimiters or local paths were added (gate counters zero). The reference entry for MVW (line 1735) lists Lectures 7–8, which contain Appendix 8A.

## Not verifiable

- **KunnemannPicard** (§7.17) and **KatzMessing** Theorem 2(1) (§7.4): unchanged since the previous review and outside the changed passages; they remain the two uncertified primary sources recorded there (publisher verification page, resp. paywalled DOI). Nothing in this change set depends on them.
- The §4.15–4.18 statements with general coefficients are proved by tensoring the complex-level integral comparisons; the sources (Friedlander–Voevodsky, Voevodsky) state only the integral case, so the coefficient assertions were checked by the computations in the table, not against a printed coefficient statement.

## Source issues

- none
