# Review of AlmostPeriodicityAndBohrSets (pull request #3191 at eb7df91)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings. The modelling lemma of 7.3 is not the result of Green–Ruzsa it is attributed to, and no cited source proves it, so the small-doubling theorem of 7.4 and the route to the Freiman–Ruzsa theorem of 7.5 are unsupported in arbitrary abelian groups; Layer 5.1 plans the compact abelian Fourier theory that the open roadmap CompactGroupsPartII already plans in its §5.1; and the multiplication formula of the Bohr compactification in 8.2 gives `ι(g)ι(h) = ι(g⁻¹h)`. There are seven small corrections and three format notes, none blocking. Two points are left for the human reviewers (a licence question on reused Lean shapes, and the sources of Layers 8–10 that could not be read).

## R01 (P1) — The modelling lemma of 7.3 is not Green–Ruzsa's Proposition 1.2, and no cited source proves it, so 7.4 (small doubling) and 7.5 rest on an unproved statement

An implementer of 7.3 will open the cited proposition and find a different theorem, and the exponents `L⁴`, `L⁵` of 7.4 and 7.5 in arbitrary abelian groups depend on 7.3 through the density `1/(c 8 ² K^16)` in step 1 of 7.4.

In 7.3 (lines 774–781) the README states that every finite `A` in an arbitrary abelian group has `A' ⊆ A` with `#A ≤ c s * #A'` and a model `G'` with `#G' ≤ c s * #(s • A − s • A)`, the constant depending only on `s`, and says "This is Green–Ruzsa's modelling lemma; their Proposition 1.2 gives explicit `c s`". Proposition 1.2 (GreenRuzsa2007 lines 101–103) models the whole set `A`, assumes doubling `K`, and bounds the model by `(10sK)^(10K²)·|A|`: the constant depends on `K`, exponentially, and there is no subset `A'`. Their Proposition 6.4 (GreenRuzsa2007 lines 572–574) shows that a model of the whole set of size `K^O(1)·|A|` need not exist. Sanders says that good models, of density `K^(−O(1))`, can be arranged in `𝔽₂ⁿ` and `ℤ` (Sanders2012 lines 102–105), treats the general abelian group as "the case of bad modelling" (lines 138–146), obtains for it the exponent 6 and not 4 (Theorem 1.1, lines 15–19), and records the Ruzsa-type statement with `A' ⊆ A`, `|A'| ≥ |A|/k` and `ℤ/q`, `q ≥ |kA − kA|`, for torsion-free groups only (Lemma 11.2, lines 920–923), with the exponent 4 following there (Theorem 11.3). Step 3 of the README's sketch, "as in the cyclic case", is where the general case breaks: the lift `ℤ/q → [0, q)` is a Freiman homomorphism on one of `s` arcs of one cyclic factor, and on `(ℤ/q)^r ⊕ T` the same pigeonhole costs `s^r`. I found no counterexample to 7.3; it is unproved, not refuted.

The smallest repair keeps the layer and changes its generality. State 7.3 for torsion-free groups (Ruzsa, as quoted in Sanders 2012, Lemma 11.2) and for groups of bounded exponent with the constant depending on the exponent (Green–Ruzsa, Proposition 6.1, for `𝔽₂ⁿ`), and keep 7.4 (small doubling) with `L⁴`, `L⁵` in those two classes. For an arbitrary abelian group either state 7.4 with the exponents of Sanders 2012, Theorem 1.1, by its relative route (Layer 6 is then on the path), or give a proof of 7.3 with a locator. The statement of 7.5 itself, and `freiman_ruzsa` in `Suggested.lean`, are supported in arbitrary abelian groups by Sanders 2013, Theorem 1.4 (Sanders2013 lines 146–148: exponent `3+o(1)`, for convex coset progressions, which a box progression of the same rank contains up to a factor `d^O(d)`); cite it there and give that route, since the present one passes through 7.3. The Summary's sentence "Ruzsa modelling then transports the lemma to every finite set of small doubling in an arbitrary abelian group" changes with it.

## R02 (P2) — Layer 5.1 plans the compact abelian Fourier theory that CompactGroupsPartII §5.1 already plans

Two open roadmaps would each build the bijection between irreducible classes and continuous characters of a compact abelian group, the Fourier coefficient against a character, and its Parseval identity, under different names and conventions.

In 5.1 (lines 545–557) the README identifies continuous characters with `PontryaginDual (Multiplicative G)`, proves that irreducible continuous unitary representations are one-dimensional, obtains the bijection with `𝓘`, defines `cft f ψ = ∫ f conj ψ` and proves Parseval; Scope and ownership (lines 1221–1222) lists "the compact Fourier transform" as owned. CompactGroupsPartII (pull request 1047, an older open roadmap), Layer 5, §5.1 "compact abelian Fourier theory", identifies `TauCeti.IrrepClass ℂ G` with `PontryaginDual G` for every compact Hausdorff abelian `G`, proves dimension one, builds the Hilbert basis of characters, identifies the coordinate `f̂(χ) = ∫ conj(χ(g)) f(g) d(haarProb G)` and proves Parseval and the `L²` expansion (its headline signatures `exists_irrepClass_characterEquiv`, `exists_characterBasis`). The README's Scope section names RepresentationTheory/CompactGroups and seven other roadmaps, but not this one.

Cite CompactGroupsPartII §5.1 in 5.1's *Needs:* and in Scope and ownership for the class–character bijection, the coefficient and Parseval, and keep here what that section does not have: the additive `AddChar G Circle` reading, the convolution and reflection identities, pointwise inversion for `u ⋆ v`, the large spectrum, and the comparisons with LeanAPAP's `cft`, `ZMod.dft` and `fourierCoeff` on the circle.

## R03 (P2) — The multiplication on the Bohr compactification in 8.2 is written with the wrong translate: it gives `ι(g) ι(h) = ι(g⁻¹h)`

The formula is the definition of the group structure, and as written it is not a group law extending that of `G`, so `ι` is not a homomorphism.

In 8.2 (line 870): "the group structure, with `(χ ψ) f = χ (x ↦ ψ (L_x f))`". Conventions (line 115) fix `L_x f = fun y ↦ f (x⁻¹ * y)`. With `ι(g) f = f(g)`: `(ι(g) ι(h)) f = ι(g)(x ↦ (L_x f)(h)) = ι(g)(x ↦ f(x⁻¹h)) = f(g⁻¹h)`. On `ℤ` with `f n = e(nθ)`: `(ι(1) ι(1)) f = f(0) = 1`, while `ι(2) f = e(2θ)`.

Write `(χ ψ) f = χ (x ↦ ψ (y ↦ f (x * y)))`, that is `ψ (L_{x⁻¹} f)`; then `(ι(g) ι(h)) f = f(gh)`. The same formula should be used for the monoid structure of 10.3, which the README does not spell out. A Check with the two-term value above would pin the convention.

## C01 — The agreement of `mconvolution` with Mathlib's `convolution` holds for commutative additive groups only

Conventions (lines 110–112) and 0.1 (lines 192–193) say that on an additive group `mconvolution` is `MeasureTheory.convolution f g (ContinuousLinearMap.mul ℂ ℂ) μ`, transported to `Multiplicative G`. Mathlib's definition (Analysis/Convolution.lean line 401) integrates `f t * g (x - t)`, while `y⁻¹ * x` reads `-t + x`. For a noncommutative additive group and `μ` as in Conventions the substitution `s = x - t` gives `convolution f g = g ⋆ₘ[μ] f`, not `f ⋆ₘ[μ] g`. Say "additive commutative group" in both places.

## C02 — The proof of 5.5 cites §5 of Sanders' survey, which is on another subject

Line 646: "The proof follows Sanders (2012) and the survey Sanders (2013, §5)". Section 5 of the survey is "Relative polynomial growth" (Sanders2013 lines 454–478) and contains no Bogolyubov–Ruzsa argument for dense sets. The route the README describes (Croot–Sisask with `S = A`, iterated periods, Chang with `η = 1/2`, a Bohr set annihilating the spectrum) is the sketch "the case of good modelling" in Sanders 2012, §3 (Sanders2012 lines 102–137); the survey's Croot–Sisask material is its §§7–8.

## C03 — Most theorems carry no locator; these are the ones I could attach from the texts

Only 7.3, 9.2, 5.5 and 10.5 point into a source, and "Namioka–Asplund" (line 1035) is not in References. An implementer cannot find the statement being generalised. Locators I read: 1.1 is Sanders 2013, Theorems 7.2 and 7.3 (stated with `O(√p)`); 2.1 is Sanders 2012, Lemma 4.3, and Croot–Sisask 2010, Propositions 1.3 and 3.3 (for `1_A ∗ 1_B`, with another bound); the triangle inequality and covering lemma of 3.1 are Tao 2008, Lemmas 3.2 and 3.6; 3.3 is Tao 2008, Theorem 5.2, stated there for open precompact sets of a unimodular group, so the measurable-set generality is the README's own; 6.1 is Sanders 2012, Lemma 5.2; 7.5 is Sanders 2013, Theorem 1.4.

## C04 — `krein_smulian` is not a declaration of the pinned Tau Ceti

In 10.1 (line 1027) and in the supplier contract for BanachSpaceTheory (line 1390) the Krein–Šmulian criterion is cited as `krein_smulian`. BanachSpaceTheory §2.4 names the realising declarations as `Convex.isClosed_iff_forall_isClosed_inter_closedBall` and `Submodule.isClosed_iff_isClosed_inter_closedBall_zero_one` (TauCeti/Analysis/Normed/Module/Dual/KreinSmulian.lean, lines 272 and 305), and no declaration `krein_smulian` exists at the pin. Use the first name.

## C05 — Three docstrings of `Suggested.lean` point at the wrong sections of Layer 10

`exists_isWAPMean` and `IsWAPMean.eq` say "(Layer 10.4)" (lines 300 and 304) and `ellis` says "(Layer 10.2)" (line 343). In the README the invariant mean is 10.2 and Ellis's theorem is 10.4. Swap the two numbers.

## C06 — `mconvolution_indicator_count` restates the first Check of 0.1

The declaration (line 64 of `Suggested.lean`) is the Check "Counting measure on a countable group, finite `A, B`" of 0.1 (lines 202–203), which is a computation of a value and not a headline; the module docstring's own list of headline theorems does not include it. It does not close by `simp` with the definitions unfolded, so it is not empty, but it asks for a sanity computation. Mark it in its docstring as a sanity check of the convolution convention, or leave it to the README.

## C07 — The description's account of the modelling lemma and of the boundaries no longer matches what the sources and the open roadmaps show

The description says the "exact constants of Green–Ruzsa's modelling lemma" were not verified and that the statement is therefore given "with unspecified constants depending only on the stated parameters". The gap is not in the constants: Green–Ruzsa's proposition has another shape and its constant depends on `K` (R01). The list of boundaries does not name CompactGroupsPartII (R02). After the repairs the text should say which class of groups 7.3 covers and add that roadmap to the suppliers.

## N01 — Two lines of `Suggested.lean` exceed 100 characters

Lines 194 and 199 (125 and 115 characters), in the docstring and the binder list of `bogolyubov_ruzsa`.

## N02 — The module docstring could say which results of the Summary it does not state

The Summary presents the factorisation of almost periodic functions through the Bohr compactification and the de Leeuw–Glicksberg decomposition among the results of the qualitative side; the docstring's list omits both without a word. One sentence would do: the first needs the carrier `BohrCompactification`, a README target; the second would be statable with `IsAlmostPeriodic`, `IsWeaklyAlmostPeriodic` and `IsWAPMean` if the author wants it as a headline.

## N03 — In 7.1 the image of a coset progression under a Freiman 2-isomorphism is a translate of one

The last bullet of 7.1 says the image "is a proper coset progression of the same rank, the subgroup going to a coset". The structure `CosetProgression` is centred at `0` with `H` a subgroup, so the image is a translate of a carrier unless `0 ↦ 0` (which holds in the use made of it in 7.4). "A translate of a proper coset progression" would be exact.

## Questions for the author

- In 5.5 (line 643): "Sanders' theorem has radius polynomial in `1/L`." Which statement is meant? In Sanders 2012 the results I read are for coset progressions (Theorems 1.1 and 10.1) and subspaces (Theorem A.1), with no dense Bohr-set statement carrying a radius; I could not find one in the survey either.
- In 6.2, is the conclusion "every `ψ` of the large spectrum is `δ * φ` with `δ ∈ Δ.mulSpan` and `φ ∈ largeSpec (B'.chordSet.indicator 1) (1/2)`", with `B' = (ν / (C r(B) D)) • B`, a statement of Sanders 2012? Its Lemmas 6.2 and 6.3 (Sanders2012 lines 426–442) are phrased with relative entropy and a bound on `|1 − γ(x)|` over an intersection of two Bohr sets, and I did not derive the README's form from them. A locator, or the derivation as a proof sketch, would settle it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.2 indicator convolution, energy | `A=B=H` finite subgroup; `A=G` compact; scaling | `r(x)=#H` on `H`; `E=#H·#H²=#H³`; C–S: `#H⁴ ≤ #H³·#H`; trivial bound `#H³` | holds | none |
| 0.2 `mulEnergy A B = mulEnergy B⁻¹ A⁻¹` | general | `r_{B⁻¹,A⁻¹}(x)=μ(B⁻¹∩xA)=r_{A,B}(x⁻¹)`; inversion invariance | holds | none |
| 0.1 agreement with Mathlib `convolution` | noncommutative additive group | Mathlib: `∫ f t g(x−t)`; ours `g(−t+x)`; substitution gives `g ⋆ f` | false unless commutative | C01 |
| 1.1 Khintchine `m^m` | `m=1,2,3`; complex | `(2m−1)!! = 1,3,15 ≤ 1,4,27`; AM–GM in general; complex via `‖X²+Y²‖_m ≤ m Σ|z|²` | holds | none |
| 1.1 Marcinkiewicz–Zygmund `(4m)^m` | symmetrisation | `m^m·2^m·2^m = (4m)^m`; `m=1`: `Σ ≤ 4Σ` | holds | locator in C03 |
| 1.2 sampling | general | `(4m)^m k^(−m)·4^m‖f‖^(2m) = (16m/k)^m‖f‖^(2m)` | holds | none |
| 2.1 Croot–Sisask, `croot_sisask` | Markov; pigeonhole; `A=S=H`, `f=1_H` | failure prob `(64m/(kε²))^m ≤ 4^(−m) ≤ 1/2`; fibre `≥ μS/(2K^k)`; `x∉H`: `2^(1/2m) > ε` | holds; Lean = README | none |
| 2.2 `L^∞` form | `μB/μW ≤ e^m` | `(ε/e)(μB/μW)^(1/2m) ≤ ε e^(−1/2)`; `‖μ_W‖_(2m)' = μ(W)^(−1/2m)` | holds | none |
| 3.1 Ruzsa triangle, `ruzsa_triangle` | `0·∞` cases; counting measure | conv `≥ μ(xY⁻¹)=μY` on `XZ⁻¹`; `μ(XY⁻¹)=0` forces `μY=0` or `X=∅` | holds | none |
| 3.2 paths of length three | compared with Tao 2008 §5 | measure form with `c δ^C`; no numeric constant claimed | plausible, not recomputed | locator in C03 |
| 3.3 BSG, `balog_szemeredi_gowers` | `A=B=H`, `K=1`; `μ ↦ tμ`; symmetric corollary | `#H³ ≤ #H³`; both sides `t³`, `t`; `μ(A'A'⁻¹)μ(B') ≤ μ(A'B')²` | holds; Tao2008 line 652 | generality noted in C03 |
| 4.1 Fourier coefficient | `f=1`; `ℤ/2`, `f=1_{0}`; convolution order | `1` and `0`; `1/2 = 1/4+1/4`; `π(z⁻¹y⁻¹)` gives `ĝ ∘ f̂` | holds | none |
| 4.3 measure and covering, `inv_prod_le_measureReal_unitaryBohrSet` | `ι=∅`; volume ratio | `1 ≤ 1`; `((1+ρ/2)/(ρ/2))^(2d²) = (1+2/ρ)^(2d²)`; doubling `(2.5/0.5)^(2d²)=25^(d²)` | holds | none |
| 4.4 `bogolyubov` | `A=G`; `S₃`, `A=A₃` | `Σ_Spec d ≤ α/(α³/4)=4/α²`; tail `< α⁴/4`; `Re h ≥ α⁴/8`; `S₃`: `1/2, 1/2, 0`, dim `2 ≤ 16` | holds | none |
| 5.1 large spectrum | `f=1_A` | `#·η²α² ≤ α`, so `≤ 1/(η²α)` | holds | ownership: R02 |
| 5.3 Chang, general `f` | interpolation | `‖f‖_p' ≤ ‖f‖₁(‖f‖₂/‖f‖₁)^(2/p)`; `p = log(e‖f‖₂²/‖f‖₁²)` gives factor `≤ e` | holds | none |
| 5.5 `bogolyubov_ruzsa` | `A=G`; open subgroup of index `n`; measure bound | `(3e^(CL))^(−2CL⁴) ≥ e^(−C'L⁵)`; `2 • A` elaborates to `A + A` (checked) | consistent with Sanders2012 §3 sketch | C02, question |
| 6.1 regularity, constant `200 r` | covering argument with doubling `25^r` | needs `0.69·C·0.69/5 > 2 log 25 ≈ 6.4`; `C=200` gives `19` | holds | none |
| 6.3 | general | `μ(X+B') ≤ μ((1+κ)B) ≤ 2μB ≤ (2/τ)μX` | holds | none |
| 7.2 Bohr sets contain progressions | `d=1`, `ℤ/N`; widths 2 | `∏(2Nᵢ+1) ≥ d^(−d)/∏λᵢ ≥ n∏(w/(2πd))`; box side `≤ 2/π < 1` | holds | none |
| 7.3 modelling | Green–Ruzsa Prop. 1.2, 6.4; Sanders Lemma 11.2 | source: whole `A`, `(10sK)^(10K²)`; README: `A'`, `c(s)`; lift costs `s^r` | unsupported | R01 |
| 7.4 small doubling | density after 7.3 | `#G' ≤ cK^16 #A ≤ c²K^16 #A'` given 7.3 | depends on 7.3 | R01 |
| 7.5 `freiman_ruzsa` | subgroup; `{0..n−1}`; covering | `#(A+P) ≤ K⁵#A`; `#X ≤ K⁵e^(CL⁵)`; `#(P−P) ≤ K⁸#A` | statement supported by Sanders2013 line 146; route via 7.3 | R01 |
| 8.1 almost periodic functions | `ℤ`: `e(nθ)`, `1_{0}` | orbit in unit multiples; translates at distance 1 | holds | none |
| 8.2 Bohr compactification | `ι(g)ι(h)` with the stated formula; `ℤ`, `e(nθ)` | `f(g⁻¹h)`; `1` against `e(2θ)` | formula wrong | R03 |
| 9.2 `isCompact_closure_toWeakSpace_iff_doubleLimit` | `K={0}∪{1/n}`, `fₙ=1_[0,1/n]` | iterated limits `1` and `0` | holds; source not read | none |
| 9.3 `isWeaklyAlmostPeriodic_iff` | `ℤ`, `1_{n≥0}`, `xₘ=m`, `yₙ=−n` | `0` and `1` | holds | none |
| 9.4 Eberlein, `exists_isWeaklyAlmostPeriodic_coeff` | translate identity; regular rep of `ℤ` | `F(a⁻¹x)=⟪π x ξ, π a η⟫`; coefficient `1_{0}` | holds | none |
| 10.1 Krein, Ryll-Nardzewski | swap on segment in `ℂ²` | fixed point `(1/2,1/2)` | holds as stated | C04 |
| 10.2 `exists_isWAPMean`, `IsWAPMean.eq` | `ℤ`, `1_{0}`; uniqueness argument | averages of norm `1/n`; mean constant on weak closure of hull | holds | C05 |
| 10.3 compactification | universal property read | semitopological monoid target; no value to compute | consistent | formula: see R03 |
| 10.4 `ellis`, Namioka | `2xy/(x²+y²)` | value `1` on diagonal, `0` at origin | holds; not by instances (probe) | C05 |
| 11.1 convolution through the mean | flight parts | `|m(uv)| ≤ ‖v‖ m|u|`; inversion-invariance of `wap₀` | holds | none |
| 11.2 `exists_unitaryBohrSet_subset_mul_inv` | `h(1)`, positivity | `h(1)=m(f²) ≥ m(f)²`; `h(x)>0 ⇒ x∈SS⁻¹`; `IrrepModel` has field `isUnitary` | holds | none |
| 11.3 `exists_unitaryBohrSet_subset_of_mean` | `ℤ`, `A=2ℤ`; GNS | `M(1_A)=1/2`; `φ_A(x)=⟪π x[1_A],[1_A]⟫`; mean `≥ M(1_A)²`; `SS⁻¹ ⊆ AA⁻¹AA⁻¹` | holds | none |

- Source locators checked against the text: 9 (GreenRuzsa2007 Prop. 1.2, 6.1, 6.4; Sanders2012 Thm 1.1, Lemmas 4.3, 5.2, 11.2; Sanders2013 §5 and Thm 1.4), plus Tao2008 Lemmas 3.2, 3.6, Thm 5.2 and CrootSisask2010 Props 1.3, 3.3.
- Library declarations opened at the pins: about 50 (Tau Ceti 26, Mathlib 24); one cited name absent (`krein_smulian`).
- Cross-roadmap citations resolved: 11 (CompactGroups Layers 0, 3–5; AmenableGroups 1, 2, 1.6; BanachSpaceTheory B2, B5; BanachAlgebras §4.4; ArithmeticDynamics §2.9; SieveMethodsAndPrimePatterns §5.4; VonNeumannAlgebras V11; SuccessiveMinima; NoncommutativeIntegration; FourierAnalyticAdditiveCombinatorics 1.1 and Layer 4).
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 16 `sorry` warnings, nothing else. `#check @name` compared for all declarations: `fourierCoeff` does not carry `[T2Space G]` (not needed by its body); no other difference from the README.
- One-tactic probe on a copy: `mconvolution_indicator_count` (`simp` with definitions), `ruzsa_triangle` (`simp`), `ellis` (instances), `exists_isWAPMean` (`simp`) do not close.

Overlap check: read FourierAnalyticAdditiveCombinatorics, SidonSetsAndLinearEquations, CompactGroupsPartII, CompactGroups, BanachSpaceTheory; compact abelian Fourier theory (class–character bijection, coefficient, Parseval) is shared with CompactGroupsPartII §5.1, owner CompactGroupsPartII (R02); Bogolyubov in finite abelian groups stays with FourierAnalyticAdditiveCombinatorics Layer 4, as the README says; nothing else shared.

Source independence: 7 passages compared with 5 sources, none shared; largest share Sanders2012, 3 of 12 locators; contents compared with Sanders2012 (§§4–11): independent, the order Croot–Sisask, Bohr sets, Chang, progressions is forced by the *Needs:* lines of 5.5, 6.2 and 7.4. The books for Layers 8–10 could not be read.

Research link: Layers 2 and 5–7 are the Croot–Sisask lemma (Croot–Sisask 2010) and the Bogolyubov–Ruzsa and Freiman–Ruzsa bounds of Sanders 2012 and 2013; Layer 11 is Følner 1954 and Beiglböck–Bergelson–Fish 2010 per the README's References; rests on the README and on the three texts read.

## Not verifiable

- Eberlein 1949 (9.4), Følner 1954 (11.3), Namioka 1974 and Ellis 1957 (10.4), Grothendieck 1952 (9.2), Chang 2002 (5.3): the sources service found no copy it could classify as legal.
- Beiglböck–Bergelson–Fish 2010 (11.3), de Leeuw–Glicksberg 1961 (10.5), Bourgain 1999 (6.1): paywalled.
- Burckel 1970, Berglund–Junghenn–Milnes 1989, Ruppert 1984 (Layers 8–10, including the locators "Appendix A", "Ch. 4", "Ch. III"), Rudin 1962, Tao–Vu 2006: books not held; 8.1, 8.2, 10.1, 10.3 were checked by computation only.
- The Lean shapes said to follow LeanAPAP and openai/math: the repositories were not opened.
- Ownership against the board's packages: only the two listed packages were considered, neither related.

## Source issues

- none

## For the human reviewers

- **Licence.** `BohrSet` in `Suggested.lean` (line 170) is said to follow LeanAPAP's `BohrSet`, and the README's Provenance section names openai/math at `adc7f124`; both are stated to be Apache-2.0. I did not open either repository.
- **Not tested.** Layers 8–10 cite three books (Burckel; Berglund–Junghenn–Milnes; Ruppert) that could not be read; wording and arrangement were not compared with them.
