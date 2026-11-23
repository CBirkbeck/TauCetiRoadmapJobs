# Review of CompressibleEulerEquationsPartII (pull request #3010 at 43babce)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the definition of a characteristic data set in §3.2 does not tie the open set `S₀` or the hypersurface `C` to the edge, and for data it admits the existence statement of §3.4 is false (two explicit one-dimensional instances below). Two clauses in §3.2 repair it. The three small corrections of the previous review are repaired, and every other statement, Check and Lean declaration was recomputed and holds. There is one small correction (the description's supplier list) and one format note; the supplier order is left to the human reviewers.

## R01 (P2) — §3.2 admits characteristic data sets for which the existence statement of §3.4 is false

§3.2 asks of `S₀` only "a Λ-invariant open `S₀ ⊆ E` with `{t₀} × S₀ ⊆ K_φ` and `𝓔 ⊆ closure S₀`", and takes `C` to be the whole zero set of `φ` in `W ∩ H_{t₀}`. §3.3 then requires a development to be relatively open in `K_φ`, to contain `C`, and to meet `Σ_{t₀}` exactly in `{t₀} × (S₀ ∪ 𝓔)`. §3.4 asserts a development for all smoothly compatible smooth data with `𝓔/Λ` compact. An implementer who formalises §3.2 as written cannot prove §3.4.

First instance (`S₀` is not a one-sided neighbourhood of the edge): `n = 1`, `p = ρ²/2`, `t₀ = 0`, `Λ = 0`, `W = 𝔐`, `φ = t − x`, so `𝓔 = {0}`, `C = {x = t, t ≥ 0}`, `K_φ = {t ≥ 0, x ≤ t}`. Take `S₀ = (−1, 0) ∖ {−1/k : k ≥ 2}` and the constant state `(1, 0)` for both `Ū₀` and `Ū_C`. Conditions 1–4 and compatibility of every order hold, `S₀` is open, `0 ∈ closure S₀`, and `𝓔` is compact. A development `D` is relatively open in `K_φ` and contains `(0, 0) ∈ C`, so it contains `(0, x)` for all small `x < 0`, including `x = −1/k`; but `D ∩ Σ₀ = {0} × (S₀ ∪ {0})` excludes those points. No development exists, for any `τ`.

Second instance (`C` does not issue from the edge): the same law and state, `W = 𝔐 ∖ {(0, 5)}`, `φ = t − x + 5`. Then `𝓔 = ∅` (compact), `S₀ = ∅`, and `C = {x = 5 + t, t > 0}`; all conditions hold. A development `D` is a relatively open neighbourhood of `C ∩ {t < τ}` in `K_φ` with `D ∩ Σ₀ = ∅`. From a point `p ∈ D ∖ C` the null line `x = x_p + (t − t_p)` keeps `φ` constant and positive; its maximal piece in `D` ending at `p` is past-inextendible in `D` (it leaves `D`, or runs down to `t = 0`, where `D` has no point) and never meets `C`. So `p ∉ D⁺_D(C)`, and `D = D⁺_D(…)` fails.

The route of §3.4 already uses both missing properties: it poses the Cauchy problem "with data `Ū₀` on `S₀` and `Φ(t₀, ·)` across `𝓔`", which needs `S₀` and `{φ(t₀, ·) < 0}` to cover a neighbourhood of `𝓔`, and it works on `C` near `𝓔`.

Smallest change, in the definition of §3.2: require that `S₀ ∪ 𝓔` be a neighbourhood of `𝓔` in `{x : φ(t₀, x) ≥ 0}` (equivalently, `S₀ ⊇ {φ(t₀, ·) > 0} ∩ N` for an open `N ⊇ 𝓔`), and that `C` issue from the edge, for instance that `C` be closed in `H_{t₀}`, or that every point of `C` be joined to `{t₀} × 𝓔` inside `C`. The first instance would make a negative-control Check for §3.2. The uniqueness and maximality statements of §3.3 are not affected.

## C01 — The description's list of LorentzianGeometry sections omits §8.1, which this head now cites

The description says the README consumes LorentzianGeometry "§§3.1–3.3, 7.3, 9.2–9.3, 12.6 and 12.7". Since the last repair the README also cites §8.1 for the time orientation `[B̃]`: in §1.1 (line 87), in its *Needs:* line (line 104) and in the supplier contracts (line 681). The text that would be right: "§§3.1–3.3, 7.3, 8.1, 9.2–9.3, 12.6 and 12.7, at its head `6e0c85c`".

## N01 — The Rendall entry of the References narrates how the roadmap was written

Lines 711–712 say the article "has no open copy and was not read, so its own section, theorem and page numbers are not given". A reader a year from now needs only what is cited: the abstract (p. 221) for the method, and Luk 2012, §3, Theorem 3, for the two-hypersurface theorem. Would "cited by its abstract (p. 221) and through the restatement of its theorem in Luk 2012, §3, Theorem 3" do?

## Previous findings

- C01 (Rendall 1990 without locators) — repaired as far as the text allows: the six citations now read "abstract, p. 221", and §3.5 adds "for quasilinear wave equations its theorem is restated as Luk 2012, §3, Theorem 3". I confirmed the abstract's content from the publisher's Crossref record, Luk's Theorem 3 (Luk2012 line 505) and the sentence of Cabet–Chruściel–Tagne Wafo (its text, line 90). The article's own numbering remains unread (see Not verifiable).
- C02 (§2.3 without the restriction below the top of the slab) — repaired: line 285 now reads "`𝒞(D) ∩ {t < t₁} = {u = 0} ∩ {t₀ < t < t₁}`".
- C03 (time orientation cited to LorentzianGeometry §7.3) — repaired: lines 86–88 now read "time-oriented by `[B̃]` for `B̃ = ∂_t + ṽ` (LorentzianGeometry §8.1)", and §8.1 is in the *Needs:* line and in the contracts.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, acoustical function | `n=1`, `c=1`, `v=0`, `u=t−x`; `x−t` | `Bu = 1 = c\|∂ₓu\|`; `μ = c²/Bu = cκ = 1`; `L̂ = L/μ`; `x−t` gives `−1` | holds; past-null excluded | none |
| §1.1 reflection | `k=0,1`; `f=t` | `(a₁,a₂)=(−3,4)`; j-th derivative `Σaᵢ(−1/i)ʲf⁽ʲ⁾ = f⁽ʲ⁾`; `3f′−2f′=f′`; even reflection `\|t\|` | holds | none |
| §1.2 construction, Checks | constant state; expanding flow `u₀=x−1`; past covector | `u=(v¹+c)s−x¹`: `Bu=c`; expanding: `Bu=(1+t)^{−3/2}=c\|uₓ\|`, `κ=1+t`, `1/μ=(1+t)^{−1/2}`; past: `ζ₀=v¹−c` | holds | none |
| §1.2 slab existence (Lean `exists_isAcousticalFunction_slab`) | bicharacteristic system `ẋ=v−cξ/\|ξ\|`, `ξ̇ᵢ=∂ᵢc\|ξ\|−∂ᵢvʲξⱼ` | `δe^{−Ct} ≤ \|ξ\| ≤ Me^{Ct}`; linearised flow bounded, `DΨ_t = I + O(t−t₀)` uniformly, so `Ψ_t` is a diffeomorphism of `E`; `n=0` vacuous | holds; lower bound on `\|∇u₀\|` used | none |
| §1.2 slab uniqueness (Lean `eqOn_slab`) | backward `L`-curves; empty slab | speed `≤ \|v\|+c ≤ C`, curves reach `Σ_{t₀}`; `u′` constant on the same bicharacteristics (same `(y, ζ(y))`); `t₁ ≤ t₀` trivial | holds | none |
| §1.3 metric and `κ` identity (Lean `transport_kappa`) | frame `(L,T,X)`; expanding flow | `g(T,T)=κ²+g̸ΞΞ−2g̸ΞΞ+g̸ΞΞ`; `L(∂ᵢu)=∂ᵢc\|∇u\|−∂ᵢvʲ∂ⱼu` gives `Lκ=T̂·Tv−Tc`; `1 = (1+t)·(1+t)⁻¹` | holds; equals LuoYu2025a (2.6) with `ψ=−v` | none |
| §1.3 polytropic form | `h=c²/(γ−1)`, `Bv=−∇h` | `T̂·Tv = e′κ − (2/(γ−1))Tc`; total `−((γ+1)/(γ−1))Tc + e′κ`; difference `−(κ/c)T̂ⁱ(∂ᵢh+Bvⁱ)` | holds; LuoYu2025a (2.4)–(2.5) | none |
| §2.1 (Lean `…_inter_eq_interior`) | `S=(−1,0)∪(0,1)`; `S=E`; ball | non-regular: `D={\|x\|<1−t}∖{\|x\|≤t} ≠ int Ď`; `S=E`: both `(t₀,t₀+T)×E`; ball: cone, closure | holds; regularity needed; `∂_t` need not be timelike, `B` is | none |
| §2.1 horizon bullet | `S=E` | frontier after `t₀` is the top face; `H⁺_Ô=∅`; statement restricted to `t<t₀+T` | holds | none |
| §2.2 generators | half-space; ball; expanding flow | lines `x₀+s(v₀+c₀e₁)`; apex `s=R/c₀`; `ẏ=−(1+t)^{−3/2}`, `x=2√(1+t)−(1+t)`, zero at `t=3` | holds | none |
| §2.3 (Lean `…_eq_setOf_neg`) | constant state; Chaplygin; ball `n=2`; `S=∅` | `{u<0}={x¹>(v¹+c)s}`; Chaplygin: `∂ₓ(ρv)=0`, `c=1+x²`, curve escapes at `t=(1−π/4)/2≈0.107`; `Ψ_t(ae)=Ψ_t(−(2c₀s−a)e)` | holds; bound needed and present | none |
| §3.1 kernels, inner expression | general `ζ`; `p=ρ²/2`, `ζ=(1,−1)`; expanding flow | `ℓσ=(a−c\|ζ′\|)δρ+0+0`; `σ(r)=0`; `σ=(δρ−δv,δv−δρ)`; vectors `eᵢ−c⁻¹n̂ⁱB` kill `φ`; `−(1+t)⁻²+(1+t)⁻²=0` | holds | none |
| §3.2 definition and Checks | `Ū₀=(1,ax)`; top face; `S₀=(−1,0)∖{−1/k}`; `W=𝔐∖{(0,5)}` | `(∂ₜρ,∂ₜv)=(−a,0)`, along `L`: `(−a,a)`, `ℓ·(−a,a)=0`; punctured `S₀` and edgeless `C`: no development | Checks hold; definition too wide | R01 |
| §3.3 developments | constant data, `φ=(v₀¹+c₀)s−x¹` | `K_φ={x¹≤(v₀¹+c₀)s}`; every past curve meets `S₀`, the edge or `C`; `H_{t₀}` has `φ<0` | holds | none |
| §3.4 existence, Riccati Check | `p=ρ²/2`, `Ū_C=(1,0)`; Chaplygin; R01 instances | `λ₊=(3w₊+w₋)/4`, `β=−2α`, `α′=(3/2)α²`, blow-up at `2/(3α₀)`; Chaplygin `ρc=1` | Check holds; statement fails on R01 instances | R01 |
| §3.5 Goursat Check | `n=1`, constant state | `dφ(B)=dφ̲(B)=c₀`; `g⁻¹(dφ,dφ̲)=−1−1=−2` | holds; Luk2012 line 505, LuoYu2025b line 2931 | none |
| §4.1 definition, invariances, Checks | `k=2`; `λ=2/3`; relabelling; twisted foliation | lifted chart equivariant and injective mod `2π`; `κ_k/t=κ′(kt)/(kt)`; `κ̃=κ′/a(u)`; `F_t=ctF₂²/(\|F_ξ\|+√…)`, limit `1+ε sin ϑ` | holds | none |
| §4.2 (Lean `isSolution_planeRarefaction`) | `γ>1`, `t>0`, `n≥1` | `v+c=x¹/t`; `Bc=−((γ−1)/(γ+1))c/t`; mass and momentum both `−2c/((γ+1)t)`-balanced; `Bu′=c/t=c\|∇u′\|`; `κ′=t`; `c>0` iff `u*<c_r(γ+1)/(γ−1)` | holds | none |
| Headlines vs `Suggested.lean` | six theorems, docstring exclusions | acoustical function (3), comparison, eikonal, plane wave stated; geodesic construction, horizons, Layer 3, §4.1 named with missing carriers | consistent | none |

- Source locators checked against the text: 14. LuoYu2025a §1.1 (line 102), §2 (lines 969–970), §2.1 (lines 993–1028), §2.2 (lines 1046–1052); LuoYu2025b §1.4.3 (line 518), §2.1 C1)–C3) (lines 670–683), Definition 2.13 and Remark 2.14, p. 24 (lines 910–927), §2.3.2 Step 3, p. 26 (line 1030), §5.4, p. 77 (line 2931); ChristodoulouMiao2014 §2.1 (lines 899–942) and contents; Luk2012 §3, Theorem 3 (line 505); Cabet–Chruściel–Tagne Wafo, Introduction (its text, line 90); Rendall 1990 bibliographic data and abstract (Crossref record).
- Library declarations opened at the pin: `uniqueDiffOn_convex` (Mathlib/Analysis/Calculus/TangentCone/Real.lean:80), `ODE_solution_unique_of_mem_Icc` (Mathlib/Analysis/ODE/ExistUnique.lean:252), `IsPicardLindelof` (Mathlib/Analysis/ODE/PicardLindelof.lean:80), `zorn_le_nonempty₀` (Mathlib/Order/Zorn.lean:126), `gradient` (Mathlib/Analysis/Calculus/Gradient/Basic.lean:83), `TauCeti.Manifold.christoffelSecondKind` (TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Christoffel/Basic.lean:154). Neither library has causal curves, eikonal functions, sound speeds or characteristic data.
- Cross-roadmap citations resolved: CompressibleEulerEquations at `4ae1090` (§§3.3, 6.2, 8.1–8.4 read in full, the two cited Checks of §3.3, and all 25 declaration names in its `Suggested.lean`); LorentzianGeometry at `6e0c85c` (§§3.2–3.3, 7.3, 8.1, 9.2–9.3, 12.6, 12.7 and the two cited Checks).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems; the elaborated types were compared with the README statements and no binder is lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `intros; simp_all`, `exact?`) on a scratch copy: none of the six theorems closes; no padding.
- Wording and arrangement: the README's sections were set beside the contents of LuoYu2025a, LuoYu2025b and ChristodoulouMiao2014; no layer follows a run of their sections.

Overlap check: read CompressibleEulerEquations (at `4ae1090`), LorentzianGeometry (at `6e0c85c`) and HamiltonJacobiAndConservationLaws. CompressibleEulerEquations owns equations of state, causal curves, domains of dependence, developments and their regular boundary, and names this roadmap as the owner of characteristic data, eikonal functions and null generators; it is cited. LorentzianGeometry owns geodesics, optical functions, time orientations and horizons of `C¹` metrics; it is cited. HamiltonJacobiAndConservationLaws owns the local method of characteristics for scalar equations and scalar conservation laws; nothing is shared.

Source independence: 12 passages compared with 5 sources (LuoYu2025a, LuoYu2025b, ChristodoulouMiao2014, Luk2012, Cabet–Chruściel–Tagne Wafo), none shared beyond formulas and standard names; largest share LuoYu2025a, 9 of 34 citations; contents compared with LuoYu2025a, LuoYu2025b and ChristodoulouMiao2014: independent. Rendall 1990 (6 citations) could not be read beyond its abstract.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step, centered rarefaction waves; and the acoustical functions of Christodoulou–Miao 2014. Rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher and absent from the sources cache; only its bibliographic record and abstract were read. Whether its theorem covers data on a spacelike and a null hypersurface, as §3.4 uses the method, was not checked.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4): a book with no legal open copy.
- Hawking–Ellis 1973, Ch. 6 (§2.2), and Christodoulou 2007, Ch. 2 (§1.2): books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only the arXiv texts were read, which is the version the README says it cites.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says the rarefaction region is an open set disjoint from the domain of dependence that contains its boundary hypersurface, which no open set can; it should be the union of the leaves for the foliation parameter in a closed interval, closed on the side of that hypersurface; affects nothing.

## For the human reviewers

- Supplier order: both suppliers (CompressibleEulerEquations, LorentzianGeometry) are open pull requests, and LorentzianGeometry is not in the merge-order file, although the dependency check reports no problem.
- Reuse: eight definitions of `TauCetiRoadmap/CompressibleEulerEquationsPartII/Suggested.lean` (lines 69–137) repeat, under this roadmap's namespace, those of `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean` in the open supplier pull request, as its docstring says.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, was read only in its abstract; wording and arrangement were not compared with it.
