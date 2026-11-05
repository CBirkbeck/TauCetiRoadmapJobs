<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2088#issuecomment-6406798448 -->
Red team round 1 pass b (claude) of 6a83d3d

Verdict: accepted

1. **F01** (P3) §1.2 Check: the sextic has no ℚ₂- and no ℚ₃-point

   Location: `packages/ReductiveGroupsPartIII/README.md:626–628`, "`X=Spec ℚ[x]/((x²−2)(x²−3)(x²−6))` has a `ℚ_ℓ`-point for every `ℓ` and no rational point".

   Claim: a ℚ_ℓ-point for every prime ℓ.

   Witness: in ℚ₂ a unit is a square iff it is ≡ 1 mod 8, and 3 ≡ 3; 2 and 6 have odd 2-adic valuation. In ℚ₃, 2 is a non-residue mod 3; 3 and 6 have odd valuation. So none of x²−2, x²−3, x²−6 has a root in ℚ₂ or in ℚ₃. (For odd ℓ ∤ 6 the product of the three Legendre symbols is 1, so there is a point; the density-½ clause for each ℚ̄-point is correct.)

   Repair (tested: 17 ≡ 1 mod 8 is a 2-adic square; 2 ≡ 6² mod 17 is a 17-adic square; for odd ℓ ∤ 34 one of (2/ℓ), (17/ℓ), (34/ℓ) is +1 because their product is 1; all three are positive at ∞; none is a rational square): replace the Check by

   "- The hypothesis concerns one fixed geometric point: `X=Spec ℚ[x]/((x²−2)(x²−17)(x²−34))` has a `ℚ_ℓ`-point for every `ℓ` (at `2` because `17≡1 mod 8`, at `17` because `2≡6² mod 17`, at odd `ℓ∤34` because the three Legendre symbols multiply to `1`) and real points, but no rational point, while each of its six `ℚ̄`-points is `ℚ_ℓ`-rational only for a set of primes of density one half."

   (Alternatively keep the sextic and write "for every `ℓ∤6`".)

2. **F02** (P3) Kottwitz86 Theorem 6.6 is printed with "no E₈ factors"; §5.8 and the gap drop it silently

   Location: `packages/ReductiveGroupsPartIII/README.md:1514–1517` ("Kottwitz's criterion produces `γ₀`. … Kottwitz86 Theorem 6.6, Kottwitz86 line 706") and `README.md:256` / `design/plan.json` gap `relative-global-obstruction` ("Kottwitz's obstruction and rational-realization criterion (Kottwitz86, Theorem 6.6) for an adelic tuple in an inner form G …").

   Claim: the criterion for every connected reductive `G` with `G_der` simply connected.

   Witness: Kottwitz86 line 706 states Theorem 6.6 under "Assume that `G_sc` has no `E₈` factors". The hypothesis is used only through the Hasse principle for `G_sc`, which now holds in general; §4.4 (line 1205–1206) already says "The simply connected Hasse principle is used in its full form, including `E₈`", §5.8 and the gap sentence do not.

   Repair: in §5.8 after "and Kottwitz's criterion produces `γ₀`." add "Kottwitz states the criterion for `G_sc` without `E₈` factors; the proof uses that hypothesis only through the Hasse principle for `G_sc`, which holds in general (EndoscopicTransferAndUnitaryTraceComparison §1.9(c)), so no restriction on `G` is kept here." In the gap's `needs` (README line 256 and `plan.json`), after "(Kottwitz86, Theorem 6.6)" insert "with the Hasse principle for `G_sc` in its full form in place of Kottwitz's no-`E₈` hypothesis".

3. **F03** (P3) An earlier owner of the split integral group Chevalley restriction is not cited

   Location: `packages/ReductiveGroupsPartIII/README.md:96–98` ("The split, simply-connected-derived Steinberg map over `ℤ` is planned in **GroupSchemesOverABase** §GS8.2; the restriction theorem here holds for every connected reductive group over a field …") and §0.3 (`README.md:416–434`).

   Claim: the only other roadmap stating group Chevalley restriction is GroupSchemesOverABase §GS8.2.

   Witness: LanglandsParameterStacks (earlier in the merge order; brief's supplier list) `TauCetiRoadmap/LanglandsParameterStacks/README.md:987–989`, §LP3.25 "Integral Chevalley restriction for Levi groups": for a split reductive standard dual Levi `M` over `ℤ` with maximal split torus `T`, `ℤ[M]^M ≅ ℤ[T]^{W(M,T)}` with no good-prime hypothesis, by density of regular semisimple conjugates and the triangular `ℤ`-basis of Weyl-invariant characters — the same object and the same two-step route as §0.3, in the split case over `ℤ`.

   Repair: extend the bullet at lines 96–98 to "The split, simply-connected-derived Steinberg map over `ℤ` is planned in **GroupSchemesOverABase** §GS8.2, and the integral restriction isomorphism `ℤ[M]^M≅ℤ[T]^W` for split standard dual Levi groups over `ℤ` in **LanglandsParameterStacks** §LP3.25; the restriction theorem here holds for every connected reductive group over a field, with a possibly non-split maximal torus, and adds the classification of semisimple classes." Ownership of §0.3 stays here: neither supplier covers a non-split torus or an arbitrary field, and both are over `ℤ` for split groups.

4. **F04** (P3) Two pinned declarations are attributed to the wrong file

   Location: `packages/ReductiveGroupsPartIII/README.md:181–183`: "`TauCeti.HopfIdeal.IsMaximalTorus` (`TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean`), with `TauCeti.HopfIdeal.exists_isMaximalTorus` and `TauCeti.HopfIdeal.IsMaximalTorus.conjugate`".

   Claim: all three live in `Torus/Maximal.lean`.

   Witness: at the pin, `IsMaximalTorus` is `TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean:50`; `exists_isMaximalTorus` is `TauCeti/Algebra/AlgebraicGroup/Torus/Existence.lean:99`; `IsMaximalTorus.conjugate` is `TauCeti/Algebra/AlgebraicGroup/Torus/Conjugation.lean:49`.

   Repair: "`TauCeti.HopfIdeal.IsMaximalTorus` (`TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean`), `TauCeti.HopfIdeal.exists_isMaximalTorus` (`…/Torus/Existence.lean`) and `TauCeti.HopfIdeal.IsMaximalTorus.conjugate` (`…/Torus/Conjugation.lean`): maximal tori as Hopf ideals, their existence and their conjugates by rational points." The Lean file imports only `Torus.Maximal` and uses only `IsMaximalTorus`, so no import changes.

5. **F05** (P3) Steinberg 6.11(d) is cited for surjectivity, which it does not state

   Location: `packages/ReductiveGroupsPartIII/Suggested.lean:88–92` (docstring of `exists_isSemisimplePoint_classFunctions`: "… is the restriction of evaluation at a semisimple point … (Steinberg65, Theorem 6.11(d); README §0.4)") and `README.md:459–461` ("Theorem 6.11(d), printed p.64, Steinberg65 lines 674–675").

   Claim: Theorem 6.11(d) gives that every `Ω`-algebra map `C(G)→Ω` is evaluation at a semisimple point.

   Witness: Steinberg65 lines 669–675: 6.11 is about a fibre `F` (a nonempty equivalence class of elements of `G`); (d) says its semisimple elements form a single class. That is the uniqueness half. Existence of a preimage of a point of `Spec C[G]` is given by Steinberg only for simply connected `G` (lines 664–667, "the surjectivity of ρ (see proof of 6.16)"); for general `G` it follows from Corollary 6.4 (line 623, `C[G]≅C[T/W]`) and lying over for `O(T)` over `O(T)^W`, which is the route the README itself gives.

   Repair: in the docstring replace "(Steinberg65, Theorem 6.11(d); README §0.4)" by "(Steinberg65, Corollary 6.4 with lifting from `T/W` to `T`; uniqueness of the semisimple class in a fibre is Theorem 6.11(d); README §0.4)"; in the README line 460 write "Corollary 6.4, printed p.63, Steinberg65 line 623, with Theorem 6.11(d), printed p.64, Steinberg65 lines 674–675, for the uniqueness of the semisimple class in a fibre".

Read in full: `packages/ReductiveGroupsPartIII/README.md` (1629 lines, all 41 targets, every Check), `packages/ReductiveGroupsPartIII/Suggested.lean` (1 definition, 4 theorems), `design/plan.json` (`gaps`), `sources.toml`, and the accepted package report. Pins used: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (from the content checkout's `lake-manifest.json`); every Tau Ceti declaration below was read at that commit. No Lean was run (the brief gives no Lean command for this pass); the signatures were checked by reading the pinned definitions and comparing binder by binder with the README.

Five findings, all P3; none blocks. The four declared supplier gaps are precise, minimal and declared identically in `plan.json` and the README; they are not raised.

## Verified sound

Counts: declarations read 5 of 5 (`classFunctions`, `isConj_iff_classFunctions`, `exists_isSemisimplePoint_classFunctions`, `isConj_iff_trace_eq`, `exists_isMaximalTorus_conjugate`); README targets read 41 of 41 (§§0.1–0.7, 1.1–1.6, 2.1–2.5, 3.1–3.8, 4.1–4.6, 5.1–5.9), with their 41 `*Needs:*` lines; locators verified against the cached texts 47 (Steinberg65 ×6, KMPS22 ×13, KZ25 ×17, Shin11 ×2, Borovoi98 ×1, LR87 ×1, Kottwitz86 ×3, Kottwitz90 ×1, Deligne82 ×3; each found at the cited line or page); Checks recomputed 52 (every Check of §§0.1–0.7, 1.1–1.6, 2.1–2.5, 3.1–3.8, 4.1–4.6, 5.1, 5.5–5.9 and the Worked examples; the only false one is R01); cross-roadmap citations resolved 46 (sections and names listed below); pinned declarations read 20; gate run once.

**Headline theorems and padding.** The headline list of the README (Steinberg classification by class functions and by characters; Harder's approximation; group Chevalley restriction; the global torus class and cocharacter twist; Serre-unit criterion and density; common-source conjugacy, rational torus embeddings, transfer and the odd unitary Hasse principle; the common rational Frobenius class with its real and rational representatives) agrees with the module docstring. The four stated are the ones statable at the pins; for each of the others the docstring names the missing carrier, and I confirmed at the pin that it is missing (no Weyl-group action on a torus coordinate ring; no discrete Galois modules of points with local/global cohomology; only the toric chart topology on local points; no `Conj′`/`Aut′`; no inner twists or `H¹(F,G)`; `TauCeti.AlgebraicGeometry.AbelianVariety` exists at the pin but without `ℓ`-adic or Betti realizations, Mumford–Tate groups, good reduction or Frobenius). Nothing in the file is padding: no example, no boundary case, no restated definition, no one-tactic statement. The only definition, `classFunctions`, has a real body and is needed to state §0.4–0.5. Not counted as headlines, and I agree: Jordan's lemma (§1.1) and the descent §1.2(a) are statable (finite groups; `NumberField K` with embeddings into `ℚ_[ℓ]`) but name none of the roadmap's objects; §0.6 is an auxiliary finiteness lemma; §3.8 is about arbitrary schemes.

**Lean versus README, binder by binder (at the pin).**
- `classFunctions k H := AlgHom.equalizer (conjugationAlgHom) (Algebra.TensorProduct.includeRight)`: `conjugationAlgHom : H →ₐ[R] H ⊗[R] H` with the first factor the conjugating variable (`Hopf/Conjugation.lean:65–73`), and `productMap_comp_conjugationAlgHom` (line 93) evaluates it to `(g * x * g⁻¹).ofConv`; `includeRight h = 1 ⊗ h` evaluates under `productMap g x` to `x(h)`. So membership is exactly `f(gxg⁻¹)=f(x)` on all `A`-points, and the universal points `includeLeft`, `includeRight` of `A=H⊗H` give the converse: the §0.1 identification is correct over any commutative ring `k`. Witness recomputed: `GL₂`, `g` the coordinate swap, `x=diag(2,3)`: `(gxg⁻¹)₁₁=3≠2`, so `x₁₁∉C`; `tr` and `det` are in `C`; for `H=k` both maps are the identity and `C=k`; for `G_m` (cocommutative) `C=k[t,t⁻¹]`.
- `reductiveCommHopfAlgProperty k : ObjectProperty (FiniteTypeCommHopfAlgCat.{u,u} k)` (`Reductive/Basic.lean:70`) is smooth + geometrically connected + no nontrivial connected normal smooth unipotent subgroup geometrically, as the README's Conventions say; so `hH` is "connected reductive". `IsSemisimplePoint` (`SemisimplePoint.lean:80`) quantifies over `FGComoduleCat.{u,v,u} k H`; with `K = Ω = k` it is semisimplicity on every finite-dimensional comodule. `IsConj` is conjugacy in the convolution group `WithConv (H →ₐ[Ω] Ω) = G(Ω)`. Both directions of §0.4 and §0.5 were instantiated: `GL₂`: `diag(1,2)∼diag(2,1)` (both traces `3`, dets `2`), `diag(1,3)` differs (`tr=4`); `𝔽̄₂`, `SL₂`: `diag(a,a⁻¹)` and `diag(a⁻¹,a)` conjugate by the Weyl element, no characteristic hypothesis is in the signature and none is needed (Steinberg65 line 585–642 is in arbitrary characteristic; the character basis of `k[X]^W` reduces from the `ℤ`-basis of orbit sums); unipotent `[[1,1],[0,1]]` versus `1`: equal on `C`, excluded by `hx`,`hy`; trivial group: one class, one point. §0.5 witness: `2` and `1/2` under `t↦diag(t,t⁻¹)` both have characteristic polynomial `X²−(5/2)X+1`; the character `t` separates them; `M=0` gives `0=0` and the trivial comodule `1=1`, so all comodules are needed and the quantifier is right. `endOfPoint V g : A ⊗[R] V →ₗ[A] A ⊗[R] V` (`PointsAction.lean:78`) with `A=R=Ω` and `LinearMap.trace Ω _` is the trace of the action on `Ω⊗M≅M`.
- `exists_isMaximalTorus_conjugate`: `IsMaximalTorus (k) (H : CommHopfAlgCat k) [Algebra.FiniteType k H] (I)` (`Torus/Maximal.lean:50`) is `Minimal` among Hopf ideals whose quotient is a torus, i.e. a maximal torus; `HopfIdeal.conjugate (I) (g : WithConv (H →ₐ[R] R))` (`HopfIdeal/Conjugation.lean:66`) cuts out `gKg⁻¹`; `baseChange (K := K) H` is `K ⊗[k] H` (`CommHopfAlgCat/BaseChange.lean:65`) and `baseChangeHopfIdeal J : HopfIdeal K (baseChange H)` (`HopfIdeal/BaseChange.lean:102`). So the conclusion says: a maximal `F`-torus `I` whose base change to `F_v` (resp. `F_w`) equals a `G(F_v)`- (resp. `G(F_w)`-) conjugate of the prescribed torus, for `v∈S`, `w∈S′`; the direction of `conjugate` is immaterial under `∃ g`. Generality: README and Lean are both over a number field `F` (Borovoi98 line 1448–1450 states Harder's lemma over a number field `K`; KMPS22 line 625 only over `ℚ`), finite places are `HeightOneSpectrum (𝓞 F)` and archimedean ones `InfinitePlace F`, matching "`S` finite or archimedean". Instances: `S=S′=∅` reduces to `exists_isMaximalTorus` (`Torus/Existence.lean:99`); `G=T` a torus has a unique maximal torus, so the only admissible `T_v` is `T_{F_v}`; complex `w`: all maximal tori conjugate; `GL₂/ℚ`, `S={p}`, `S′={∞}` with `ℂ^×` at `∞` and the split torus at `p`: `Res_{E/ℚ}G_m` with `E` imaginary quadratic split at `p`. Data at `v∉S` is unused, as intended.
- No `variable` block exists, so no binder can have been dropped; every hypothesis sits in the declaration's own signature. `theorem` throughout; no `set_option`, no `lemma`, no `#eval`/`#print`, no `True`, no sorry'd data; the imports are `import Mathlib` plus ten `TauCeti.*` modules that all exist at the pin and are all used.

**Mathematics of the README (adversarial pass; sampled rows, values on each side).**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conv: conjugation orientation | pin docstring, `productMap_comp_conjugationAlgHom` | `(g*x*g⁻¹).ofConv`; first factor conjugates | matches README Conventions |
| Conv: cocycle/coboundary | `a_σ=g⁻¹σ(g)` | `a_σσ(a_τ)=g⁻¹σ(g)σ(g)⁻¹στ(g)=a_{στ}` | consistent |
| §0.2 `Conj(GL₂)` | `tr,det` | `k[s,d,d⁻¹]`; `d=0` absent | holds |
| §0.3 `SL₂→PGL₂` | `s=a+a⁻¹`, `α=a²` | `α+α⁻¹=s²−2`; `±5/2↦17/4` | holds, not injective |
| §0.3 char `p` | `k[X]^W` vs `ℤ[X]^W⊗k` | both have the orbit sums as basis; simple characters unitriangular ⇒ `k`-basis | holds |
| §0.6 | `G_m→GL₂`, `t↦diag(t,t⁻¹)` | fibre over `(5/2,1)` = `{2,1/2}`; `O(T)=k[t^{±1}]` integral over `k[t+t⁻¹]` | finite, degree 2 |
| §0.7 Check 4 | `SO(8)`, `t` with 8 distinct eigenvalues | `Z_{O(8)}(t)` = diagonal in the eigenbasis, forced `(λ,λ⁻¹)` on each pair ⇒ `⊂SO(8)`; so `sts⁻¹≁t` for improper `s` | holds; with eigenvalue `1` of multiplicity `≥2`, `O(2)⊂Z_{O(8)}(t)` has improper elements ⇒ same class |
| §1.1 Burnside | `S₃`, `Δ=⟨(12)⟩`, 3 cosets | fixed cosets: `e:3`, transpositions `1,1,1`, 3-cycles `0,0`; sum `6=|Γ|·1` | 3-cycles missed; general count `[Γ:Δ]+(|Γ|−1)≤|Γ|` forces index 1 |
| §1.2 Check 3 | `ℓ=2,3,5,7,11` | squares: `ℓ=2`: none of `2,3,6`; `ℓ=3`: none; `ℓ=5`: `6`; `ℓ=7`: `2`; `ℓ=11`: `3` | **false at 2, 3** (R01) |
| §1.4 Check 3 | `U(1)` vs `G_m` | units of `ℚ[x,y]/(x²+y²−1)`: `ℚ(i)^×t^ℤ` with `t=x+iy`, conjugation `t↦t⁻¹` ⇒ invariant units `ℚ^×` | holds |
| §1.6 | `(SL₂×G_m)/μ₂` | `(g,t)↦tg` iso to `GL₂`; `[(h′xh′⁻¹,1)]=[(y,1)]⇒z=1` | injective |
| §2.1 Check 2 | norm-one torus of imaginary `E` | `H¹(ℝ,T)=ℝ^×/ℝ_{>0}=ℤ/2`; `(X_*)_{Γ}=ℤ/2`; `(X_*)_{Γ_ℓ,tors}=0` for `ℓ` split | auxiliary `ℓ` inert |
| §2.1 Tate–Nakayama torsion form | `Ĥ⁻¹` vs `(X_*)_{Γ,tors}` | `x+cx=0⇒2x∈(1−c)X_*`; `nx=(1−c)y⇒n(x+cx)=0⇒x+cx=0` | equal groups |
| §2.4 Check 2 | `SO(2)⊂SL₂(ℝ)`, `n=diag(i,−i)` | `n⁻¹c(n)=diag(−i,i)·diag(−i,i)=−1`; `a·c(a)=1` | nontrivial class |
| §2.4 Check 3 | `GL₃(ℝ)`, torus `ℂ^×·ℝ^×` | `(12)(13)(12)=(23)≠(13)` | `n⁻¹c(n)∉T` |
| §2.5 | `c(g)=gt⁻¹n⁻¹c(n)c(t)`, `u=gt⁻¹n⁻¹` | `c(u)=gt⁻¹n⁻¹c(n)c(t)c(t)⁻¹c(n)⁻¹=u`; `Int(g)μ=Int(u)Int(n)μ=Int(u)μ_h`; `σ(gt_p⁻¹)=gα_σσ(t_p)⁻¹=gt_p⁻¹` | (i)–(iii) hold |
| §3.1 | CM `F`, `[F:ℚ]=2d` | `c`-fixed dim `d`, `Γ`-fixed dim `1` | fails for `d>1` |
| §3.1 complement | `V=X_*⊗ℚ` | the `Γ`-stable complement of `V^Γ` is the sum of nontrivial isotypics, unique; its `c=+1` part lies in `V^Γ∩V′=0` ⇒ it is `V^{c=−1}` | `T_c` descends |
| §3.2 Check 4 | `a=[[1,1/q],[0,1]]`, `b=[[1,0],[1/q,1]]` | `aⁿ=[[1,n/q],[0,1]]`, bounded; `tr(ab)=2+1/q²`, `v_q=−2` | `ab` in no compact subgroup |
| §3.3 Check 2 | `(2+i)/(2−i)` | `=(2+i)²/5=(3+4i)/5`; norm `1`; unit away from `5` | 5-Weil weight 0 |
| §3.5 | `γ∈T(ℚ)`, `m=#μ(L)` | `Λ₀=μ_k×F` free part `F`; `Λ₀^m=F^m` torsion free | `γ^m` neat |
| §3.6 | Serre `T`, `χ` | `(χ+cχ)(γ)=χ(γ)·\overline{χ(γ)}=|χ(γ)|²>0`, rational `l`-unit ⇒ `l^w`; every complex conjugation acts as `c` on `X_*⊗ℚ` (`+1` on `V^Γ`, `−1` on `V′`) ⇒ same `w` for all `σ` | holds |
| §3.7 Check 2 | imaginary `E`, `l` inert | `v_λ(x)=v_λ(x̄)`, `xx̄=1⇒2v_λ(x)=0` ⇒ unit ⇒ root of unity | finite |
| §3.8 | `k[ε]/ε²`, `ε↦2ε`; doubled line | fixes the dense point / punctured line; not identity | reduced, separated needed |
| §4.1 Check 3 | `Sp₄`, `diag(−1,1,−1,1)` | centralizer `Sp₂×Sp₂=SL₂×SL₂`; Levi derived groups of `Sp₄`: `SL₂`, `SL₂`, `1`, `Sp₄` | not a Levi; route unaffected |
| §4.2 Check 2 | `Hom(ℚ(√2),ℚ̄)` | Frobenius fixes a point iff `ℓ≡±1 mod 8` | hypothesis fails, as it should |
| §4.4 Check 2 | `D` ramified `{p,∞}`, `E` inert at `p` | `E_p`, `E_∞` fields ⇒ `E↪D` (Hasse); `T*_ad` anisotropic at `∞` | holds |
| §4.6 `G/G_der≅T₁` | `e=det(g)λ^{−(n−1)/2}` | `N(e)=λⁿ·λ^{−(n−1)}=λ` | holds for odd `n` |
| §4.6 Check 2 | Shin11 lines 717–719 | `|H¹(E/ℚ,Z(Ĝ)^{Γ_E})|=2` iff `2|[F⁺:ℚ]` or `2|n`; `1` otherwise | README's parities agree |
| §5.1 | `w_s(z)=z·id` on `H¹` | `ψ(zx,zy)=z²ψ`; weight on `H¹` is `z⁻¹` (Deligne82 lines 1001, 1008–1009) | `ν∘w_s=z²` |
| §5.5 fibre | finite `ℚ`-scheme with one `ℚ̄`-point and a `ℚ_ℓ`-point | reduced ⇒ `Spec K`, one embedding ⇒ `K=ℚ` | `γ_v` rational |
| §5.6 | `χ∘w_s=z^m` | `(χ+cχ)(w_s(z))=z^m·c(z̄^m)=z^{2m}=mν(w_s(z))`; difference `c`-invariant on anisotropic `T/w_s` ⇒ `0`; `χ(ct₀)=\overline{ν(t₀)^m/χ(t₀)}=χ(t₀)` | `t₀` real |
| §5.7 Check 2 | `a²=4q` | semisimple with char. poly `(X∓√q)²` is scalar `±√q`, central, in every torus | holds |
| §5.8 Check 2 | `SL₂`, elliptic `γ` with field `E` | `𝔎(T/ℚ)=(ℂ^×)^{z↦z⁻¹}={±1}`; invariants in `ℤ/2` at nonsplit places, sum must vanish | holds |

Every "iff" was tested in both directions where an instance exists (§§0.1, 0.4, 0.5, 3.1, 3.5, 3.6, 0.7); the degenerate cases `G_m`, trivial group, `SL₂`, `S=∅`, `F=ℚ`, `w=1`, `τ=τ′`, `n=1`, `F⁺=ℚ`, `a²=4q` all gave the stated values.

**Proof routes and ownership.** Every `*Needs:*` input is a target here, a declared gap, a pinned declaration, or a section that exists at the named supplier's current head with the stated content: IntegralHeckeAndGaloisDeterminants §0.7 (invariant coordinate algebras under conjugation, all arities); ReductiveGroupsPartII §§RG2.0.1, RG2.0.2, RG2.0a.1–RG2.0a.3, RG2.1.1, RG2.1.5, RG2.3.4 (*compact-elements-in-hyperspecial-subgroups* at its line 4478, hypotheses as cited), RG2.5.1; SchemeKTheoryOperations §6.3.1 (its line 1810 states `reductiveCharacterEquiv` onto `ℤ[X]^W` for a split connected reductive group over any field with the highest-weight triangularity theorem, exactly what §0.3 consumes); DeligneWeightsAndPurity §§0.1–0.2; AdelicAlgebraicGroups §3.4 (*class-number-finite*), §4.1, §4.3 (`Neat.IsNeatAut`, eigenvalues of tensor subquotients, the `√2` remark); EndoscopicTransferAndUnitaryTraceComparison §1.1, §1.2 (a) local/(b) global, §1.3, §1.5, §1.6 (inner twists; `transferTorus` goes from the inner form to `G*`, so §4.4's direction is correctly owned here), §1.9 (a) Kneser/(c) Hasse, §1.11 (a)/(b), §1.14 (b), (d) quasi-split with simply connected derived group, §1.15 (stated with `γ₀∈G(F)`, so the gap is needed as declared), §3.3; ShimuraData §§1.2–1.4, 4.2–4.3; ShimuraVarieties §P.5 (local conjugacy of real tori near a regular element, as §2.2 cites), §5.8, §7.0i (`TauCeti.Shimura.abelian_absolute_hodge`); AutomorphicBundles §B1.1 (`finiteTensorStabilizer`); MotivesAndAlgebraicCycles §6.8 (torsor, twist, no rational point); AbelianSchemesAndArithmeticModuli §§A1.3a, A5.1, A5.7, A6.11, A6.21; PELModuli §§M3.1–M3.2 (`unitaryCentre_sha_vanishing`; for odd `n` the central bijection, and its Check records `ker¹≠1` is possible, so §4.6's vanishing is new and owned here); Chebotarev Layer 10 and GlobalNumberFields Layer 1 on main, with the three Chebotarev theorems and `weakApproximation_denseRange` at the pin; ReductiveGroups Layers 0–4, 6, 7, 8 (isomorphism/existence theorems and the inner/outer and pinned automorphism interfaces are in Layer 8 at its lines 1023–1057), 10B, 11C on main; GroupSchemesOverABase §GS8.2. No cycle: the supply direction is single (gate below). No sibling or main roadmap states the conjugacy quotient, `Out′/Conj′/Aut′`, the Serre condition for tori, prime-units, Weil points, Harder's approximation as a target, the common-source conjugacy, the odd-degree unitary vanishing or the Frobenius-class theorems (object greps over all 367 open roadmap pull requests and main: "class function", "conjugacy quotient", "Harder", "Serre condition", "Weil point", "l-unit", "ker¹(ℚ", "orthogonal outer", "Jordan … lemma", "independence of ℓ", "O(T)^W"); the only related owner missed is R03.

**Gaps.** The four declared gaps are precise and minimal: §RG2.0.2 at the ReductiveGroupsPartII head has analytic charts and the inverse function theorem but not the openness of the regular-centralizer type (gap `regular-centralizer-openness` is exactly that, and ShimuraVarieties §P.5 covers the real place); ET §1.2(b) has the global-mod-local group but not the compatibility with the sum of local maps; ET §1.6 has no Kottwitz82 Corollary 2.2; ET §1.15 has only `γ₀∈G(F)`. The same four slugs are in `plan.json` `gaps` and under the README's supplier contracts.

**Policy.** The pull request changes only `packages/ReductiveGroupsPartIII/` (README, Suggested.lean, metadata, sources, the `gaps` of `design/plan.json`, the package report). No `lemma`, no pull-request number, no process narrative in README or docstrings ("This repairs the source statement" at line 1092 is about the source, not the process), no `set_option`, no computational algorithm; every target has a locator; each definition has at least three discriminating Checks (§0.1: 4, §0.2: 7, §0.7: 4, §3.1: 4, §3.2: 4, §3.3: 4, §3.4: 4, §3.5: 4). `sources.toml` has one key per work, with `Noot09` and `Kottwitz82` waived.

**Dependency gate** (command of the brief, run from the board checkout):

```
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Position 233 in `merge-order/ORDER.txt`; every cited supplier is earlier (ReductiveGroupsPartII 23, IntegralHeckeAndGaloisDeterminants 27, AdelicAlgebraicGroups 34, SchemeKTheoryOperations 37, AbelianSchemesAndArithmeticModuli 46, MotivesAndAlgebraicCycles 82, DeligneWeightsAndPurity 91, ShimuraVarieties 114, PELModuli 128, ShimuraData 130, EndoscopicTransferAndUnitaryTraceComparison 162, AutomorphicBundles 229) or on main; BunGAndNewtonStrata (241) appears only as a consumer.

## Not verifiable

- Kottwitz82 Corollary 2.2 and Noot09 §1.5, Theorem 2.4, Lemmas 2.5–2.6, §3: waived in the manifest; cited by locator only.
- Langlands, Lemma 7.15 (the obstruction to torus transfer): not in the manifest; §4.4 rests on LR87 Lemma 5.6 (read, lines 2907–2923), which cites it.
- Harder 1966, Lemma 5.5.3: not in the manifest; §2.2 is read through KMPS22 Lemma 1.2.2 and Borovoi98 Lemma 5.6.3, both of which cite it.
- §4.6 for CM fields without an imaginary quadratic subfield: KMPS22 lines 1647–1651 assert it "by the proof of" Shin's lemma; I verified Shin's displayed parity formula (lines 717–719) and the `F⁺=ℚ` case, not the general computation.
- Elaboration of `Suggested.lean` was not re-run in this pass (no Lean command is given to it); the binder-by-binder comparison above is against the pinned definitions, and the package report records 4 `sorry` warnings and nothing else.

## Source issues

- **Error** in KZ25 at §5.1.3, printed p.47 (lines 2094–2096): the source says the `F`-points of `Conj_H` are the semisimple `H(F)`-conjugacy classes for any field `F` of characteristic zero; it should be for `F` algebraically closed (over `ℚ`, trace-zero elements of `SL₂(ℚ)` give one point and two classes, and `5/2∈Conj(SL₁(D))(ℚ)` has no lift); affects nothing (the paper uses only quotient points, cf. its Remark 5.3.7).
- **Misprint** in KZ25 at §6.1.1, printed p.55 (lines 2447–2448): the source says `H¹_B(A(ℂ),ℚ)` has Hodge types `(0,−1),(−1,0)`; it should be `(1,0),(0,1)` (those are the types of `H₁`, Deligne82 lines 1008–1009); affects nothing once the convention is fixed.
- **Misprint** in KZ25 at Lemma 6.2.6(2) proof, printed p.58 (lines 2603–2609): the source says `h⁻¹gh=g` and then `h₁gh₁⁻¹=g′`; it should read `h⁻¹gh=g′` with one consistent orientation; affects nothing.
- **Gap** in KZ25 at Lemma 6.3.3 proof, printed p.60 (lines 2683–2685): the source says any lift `γ̃₁∈G(ℂ)` has eigenvalues of absolute value one and so lies in a maximal compact subgroup; it should take a semisimple lift (a unipotent lift has eigenvalue `1` and unbounded powers); affects the proof, not the statement.
- **Error** in KMPS22 at §2.2.3, printed p.25 (lines 1126–1128): the source says an `l`-unit is bounded at every place `v∤l`; it should say every finite place (`l∈G_m(ℚ)` is an `l`-Weil point, hence an `l`-unit by Lemma 2.2.4, but unbounded at `∞`); affects a stated result (Lemma 2.2.4 as printed).
- **Error** in KMPS22 at Lemma 2.2.11, printed p.29 (lines 1323–1331): the source says an irreducible finite-type scheme with a dense set of rational points suffices; it should add reduced and separated (`Spec k[ε]/ε²` with `ε↦2ε`; the line with doubled origin); affects a stated result.
- **Error** in KMPS22 at Proposition 2.2.13 proof, printed p.29 (lines 1345–1347): the source says the connected centralizer of a semisimple element is a Levi subgroup; it should say a connected reductive subgroup of full rank (`diag(−1,1,−1,1)∈Sp₄` has centralizer `SL₂×SL₂`); affects the proof only (conjugacy of maximal tori in it is all that is used).
- **Misprint** in KMPS22 at Remark 2.3.16(2), printed p.36 (lines 1653–1655): the source says two points of `G(k)` have the same image in `Conj′(G)` iff they are `G′(k)`-conjugate; it should say two semisimple points (a unipotent and the identity share the image); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6a83d3d", "job": "RT-ReductiveGroupsPartIII~1b", "model": "fable", "worker": "fable-rt201"} -->
