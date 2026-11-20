# Review of ScatteringDiagrams (pull request #2650 at de3257f)

**Verdict:** accepted

**Summary.** Accepted: the template update leaves every statement true and every sampled locator supported, and every Check, worked example and headline formula I recomputed holds (crossing, coboundary and sweep signs, the pentagon order, the focus-focus products, the §7.3 wall coefficients). There are two small corrections and one format note, none blocking: nine new sentences say a section "follows" a source, which the project's rules exclude, and two sentences of the description are wrong (`Comma.initial_snd` does exist at the pinned Mathlib, and those nine sections' sources were not moved to their claims). The previous review's only remark is repaired, and one fact about the largest source is left for the human reviewers.

## C01 — Nine sections now open by saying that they follow a source, which the roadmap's organisation rules exclude

The project's planning rules say that a roadmap's organisation is its own and that it does not say it follows a source; results are cited at the claims. The new sentences "This section follows …" at the head of §2.3 (line 1022), §5.1 (1621), §5.3 (1717), §5.5 (1896), §5.6 (1982), §7.1 (2260), §7.3 (2381) and §7.4 (2475), and §6.3's "following GS §2.3 and GHS Definition 3.3, …" (line 2134), tell a reader that the section's plan is the source's. It is not. I set each section beside its sources, and the content and order are the roadmap's own. For example, §7.4 combines BLM §2 and §9 with its own affine-perturbation argument, and no layer tracks BLM's or any other source's contents. On main these locators were "Sources:" lists.

The smallest repair is to put each locator at the statement it supports, as §§0.4, 4.3, 5.4 and 7.2 now do (for example, "(BRI Lemma 3.1)" at the wall-label clause of *reconstructionEquiv*). If a section-level list is preferred, "Sources: …" in place of "This section follows …" would also do.

## C02 — Two sentences of the description are contradicted by the pin and by the head

The description says: "§0.7: the old README cited `Comma.initial_snd`, which does not exist in Mathlib". It also says that `Comma.initial_snd` "is the one exception" among the old supplier declarations. At the pinned Mathlib, `CategoryTheory.Comma.initial_snd` is an instance (`Mathlib/CategoryTheory/Comma/Final.lean` line 123): the second projection of `Comma L R` is initial when `L` is initial. That is exactly the case §0.7 needs, since `H₁` is initial, so the old citation was valid. The new citation `initial_snd_of_isConnected_costructuredArrow` (line 86) is its general form and is also correct.

The description also says that the "Sources:" lists "are moved to the claims they support". This does not hold for the nine sections of C01.

Text that would be right: "§0.7 now cites `Comma.initial_snd_of_isConnected_costructuredArrow`, the general form of the instance `Comma.initial_snd` it cited before; every declaration of the old supplier list exists at the current pins with the stated meaning." Once C01 is applied, the sentence about the "Sources:" lists is true as written; until then, add "except in §§2.3, 5.1, 5.3, 5.5, 5.6, 6.3, 7.1, 7.3 and 7.4, where they open the section".

## N01 — §6.3 names the overlap maps `h_II` and `h_III` after the charts II and III of GS's Figure 2.1, which the README never introduces

`h_II` is the identity transition on the lower overlap and `h_III` the transition `S` on the upper one (lines 2138–2161). Would a clause saying so, or the names `h_lower` and `h_upper`, read better for someone without GS at hand?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 cutoff-modulus Check | `P={0}∪{a≥b≥1}`, `δ=a`, `T(a,b)=b` | `δ'(Tn)≤δ(n)` holds; every `(j,1)` has `δ'=1`, `δ=j` unbounded, so no `λ(1)` | true | none |
| §0.1 supported-ray Checks | `P=2ℕe₁+ℕe₂`; `P={0}∪{a≥1, −a²≤b≤a²}` | ray `e₁` has degrees `2ℕ_{>0}e₁`, `e₁∉P`; `(1,b)` supported via `a=1+abs(b)`; cutoffs finite | true | none |
| §0.1 moduli | identity, composite, injective `T` | `δ(n)>λ(λ'(k))` gives `δ''>k`; `c·k` from `δ≤c·δ'`; max over a finite preimage | true | none |
| §0.3 adic comparison (sample) | `AdicCompletion J A` (Basic.lean 172); `f(I^{ck})⊆J^k` | component `n` is `A/JⁿA`, so `A/J^{k+1}` has index `k+1`; `λ(k)=c(k+1)−1` | matches README | none |
| §0.4 `comap_freeAugmentation_pow_ι` | `c=0,1` | `c=0`: preimage of `U⁺` is `𝔣 = lcs 0`; `c=1`: `T^{≥2}∩𝔣=[𝔣,𝔣]=lcs 1` | true | none |
| §0.4 `exists_bch_exp_mul_exp` | `c=0`; degree 3; Heisenberg | `c=0`: quotient `ℚ`, both sides `1`; `X+Y+½[X,Y]+(1/12)([X,[X,Y]]+[Y,[Y,X]])`; `X+Y±Z/2` | true; `ι b` nilpotent, no junk `exp` | none |
| §0.4 `exists_pbwSymmetrizationEquiv` (sample) | `d=0,1,2`; PET line 756, 789, 832, 50–53 | `β(1)=1` (one permutation of `Fin 0`), `β(ιx)=ιx`, `½(xy+yx)`; PET: invertible over `K⊇ℚ` | README = Lean = PET | none |
| §0.4 BCH-group Check | `[x,y]=z` central | `exp x·exp y=exp(x+y+z/2)=exp(y+z)·exp x` | true | none |
| §0.4 filtration Checks | `U(ℚx)`; abelian with `x_d` in each degree | `x²∈I²U`, `g₂=0`; `x_d∈I^dU`, `x_d∉J²` | true | none |
| §0.5 change-of-degree Checks | `δ→2δ`; `P={b≤a≤b²}` | `δ>⌊k/2⌋ ⇒ 2δ>k`; `max{a: b≤k}=k²`, `max{b: a≤k}=k` | true | none |
| §0.6 inner action (sample) | `x∈F¹g`, `A=U_R(g)` | `x^{k+1}` kills `U/I^{k+1}U`; `exp(ad ιx)` is conjugation (InnerAutomorphism.lean 188) | true | none |
| §0.7 comparison and its lemma | `H₁` initial; `Comma(H₁,K₂)` | `snd` initial by `Comma.initial_snd` (Final.lean 123) or the cited lemma (line 86) | both apply | C02 (description) |
| §0.7 non-initial Check | `J` terminal, `J'` discrete on two objects | `lim F` a point, `lim F'=Unit×Empty` empty | no map | none |
| §0.8 graph Check (sample) | `M=ℚ` in degree 0, `θ=2` | `B^{0,0}(1)=2`, reverse `1/2`; recursion `U²=0`: `x=a+Ua`, `x−Ux=a` | true | none |
| §1.1 cone example and empty presentations | cone of `(1,0),(1,2)`; `0≤−1`; `x≤0∧−x≤−1` | `(a+b,2b)`: `y≥0`, `2x−y=2a≥0`; cones `ℝ×{0}`, `{(0,0)}`, homogenization `{0}` | true | none |
| §1.1 `PointedCone.fg_iff_dualFG` | `V=0`, `⊥`, half-space, circular cone, infinite-dimensional `V` | trivial cases both true; circular cone both false; infinite dimension excluded by `[FiniteDimensional ℝ V]` | true | none |
| §§1.2, 2.1 crossing words | square loop around `0`; four half-axes | `w⁻¹` at `(1,0)`; `w₁⁻¹w₄⁻¹w₃w₂`; crossings `b,a,b⁻¹,a⁻¹`, product `a⁻¹b⁻¹ab` | true by Convention 3 and BRI line 407 | none |
| §1.3 Checks (sample) | `(0,1)⊂ℝ`; two copies of `id` | `(0,1)=ℝ∩{x>0}∩{x<1}` locally closed; fiber cardinality `2` | true | none |
| §1.4 sign Checks and Stokes | half-plane; segment; point in `ℝ` | `({y=0},+dy,c)` pairs `−c`; `(p₀,+dx∧dy)+(p₁,−dx∧dy)`; `dS_nC=−C`; `⟨C,∂γ⟩=0−c` | true | none |
| §2.2 non-stabilizing Check | `N=ℤ²`, alternating complexes | odd/even complexes are subdivisions of each other with the same labels | true | none |
| §2.3 sign factorization, reconstruction (sample) | BRI (5), lines 491–550; Heisenberg on `ℤ²` | at `θ=(−1,1)`: `g=exp(s′Y)exp(ss′Z)exp(sX)`; loop `exp(−s′Y)exp(−sX)·g=1` | true | C01 wording |
| §2.4 Checks (sample) | Heisenberg mod centre; `2m,3m∈P` | `exp(X+Y+Z/2)≠exp(X+Y−Z/2)`, equal mod `RZ`; one supported ray | true | none |
| §3.1 bracket normal | `m′=cm` | `μ=c·m(ρn′)m−c·m(ρn)m=0`; `μ(ρ(n+n′))=0` | true | none |
| §3.3 two-wall Check (sample) | `n=e₁,m=e₂*,n′=e₂,m′=e₁*`; MAN Lemma 2.9 | `μ=e₁*−e₂*`; loop `=c⁻¹exp(t₁t₂[x,y])`, so `c=exp(+t₁t₂[x,y])`; MAN `g₃=t₁t₂[g₁,g₂]` | true | none |
| §3.3 citations (sample) | MAN Thm 2.6; GHKK Thm 1.21(3), C.1; KS Prop 3.3.2 | finite affine input; walls `n₀⊥` through `0`, proof follows Prop 1.20; bijection with initial data | supported | none |
| §3.4 LMY Check | full hyperplane | LMY Def 1.3 (line 250): outgoing iff `P−ℝ≥0m⊆P`, so a full hyperplane is both | true | none |
| §4.1 Checks | `ℤ³` bracket; `T(a,b)=a+b`; `T(a,b)=(2a,b)` | `μ=−e₃*`; `s=1` and `s=0` required at once; `S(e₁*)=½e₁*` | true | none |
| §4.2 rank-two example | `{e₁,e₂}=1`, `d=(1,1)` | `p₁*(e₁)=(0,1)`, `p₁*(e₂)=(−1,0)`; `[D_n,D_{n′}]={n′,n}D_{n+n′}` | true | none |
| §4.3 quantum ray action (sample) | `r=1,2`, `r<0`; NQ (2.14), (2.21) | `Ψ(q^{2r}T)/Ψ(T)=∏(1+q^{2j−1}T)`; `θ(z^{2p})=z^{2p}+(q+q⁻¹)z^{2p+n}+z^{2p+2n}` | matches NQ | none |
| §4.4 slab Check | `q=t(1+w)` | `λ_v(X^a w^b)=t^a(1+w)^a y^{−a}w^b`; `Z₋₂Z₁=X²Y=t(1+W)X` | true | none |
| §5.1 annihilation and zero direction | `ρ(p)=0` | `m(ρ(p))=0` for every normal, so walls fix `A_p` | true | C01 wording |
| §§5.2, 5.4, 5.5 crossing direction | one wall `{x=0}`, `f=1−zⁿ` | right to left applies `θ`: `zᵖ↦zᵖ−z^{p+n}`; `θ⁻¹` returns `zᵖ`; `s(Q⁺)=θ⁻¹s(Q⁻)` | consistent | C01 wording |
| §5.3 Checks and citations (sample) | diagonal shadow; CPS 615, 644; N23 4484, 4574; GHS 1549–1581 | `{0}−ℝ≥0(−1,−1)=ℝ≥0(1,1)`; encounter bound `rh+r−1` | supported | C01 wording |
| §5.5 probe degrees | `δ_ext` | `δ_ext(n+cp,c)=δ(n)+c`; mixed normal `c·m(ρ(p+n′))e_z*` | true | C01 wording |
| §5.6 citations (sample) | CPS 467, 657, 750; N23 4574–4638 | local scattering, chamber independence, transport of theta functions | supported | C01 wording |
| §6.1 swap Check (sample) | swap of `ℤ²`, `v=(1,0)` | `e₁*∘T⁻¹=e₂*`; `⟨e₂*,Tv⟩=1=⟨e₁*,v⟩` | true | none |
| §6.2 semidirect law (sample) | `H` trivial; `H` fixed by transitions | `(g,α)(g′,α′)=(gα(g′),αα′)`; `G≤k⋊1=G≤k` | true | none |
| §6.3 fibre product (sample) | GS §2.3 lines 435–489 with `α=1` | `X=(x₁,fx₂)`, `XY=(ft,ft)=t(1+W)`; `g_f h_II=g_f′ h_III` since `f=wf′` | true | N01 labels |
| §6.3 `FocusFocus.modelTheta_mul` | `(n,m)=(1,1),(−2,1),(−2,2),(−1,1)` | `r=0,1,2,1`: `Y²`, `tX(1+W)`, `t²(1+W)²`, `t(1+W)`; numerator even, no ℕ truncation | true | none |
| §6.3 broken-line Check | `Q=(1,1)`, `d=1,2` | `s_j=1+j/d>0`; weights `1,1` and `1,2,1` | true | none |
| §7.1 ray-factor Check | `1+p₁x+p₂x²` | `−s²/2` contributes `−p₁p₂x³` | `[u]f_u=−1` | C01 wording |
| §7.2 pentagon Check | `{e₁,e₂}=1`, `X=z^{(1,0)}` | both sides: `X↦X+XY+Y`, `Y↦Y+X⁻¹Y`; reversed: `X+XY` against `X+XY+2Y+…` | as claimed; N23 (1.56) agrees | none |
| §7.3 Checks | `P₁=1+ax+bx²`, `P₂=1+cy+dy²` | `b=0`: `1+acu+a²du²`; `[u³]f²=2C+2AB=14abcd+2abc³+2a³cd`; at `(2,1,2,1)`: `1,4,10,20` | true | C01 wording |
| §7.3 `(5,3)` two-bend line | velocities `(5,3),(2,1),(2,0)` | gap `3/2` in `(1,5/3)`; weight `abd·2c=2abcd`; ends below the `x`-axis | true | none |
| §7.4 lattice change | `m₂=(0,2)`; Check `m₂=(1,2)` | `ℓ=2`: `m°=(1,2)`, `r=1`, `ind=2`; `m°=(2,2)`, `r=2`, `ind=1` | `ℓ=r·ind` holds | C01 wording |
| §7.4 BLM Example 5.21 | `1+x²`, `1+y²` | `(1−XY)⁻⁴` on `2ℤ²`, halved exponents give `(1−x²y²)⁻²` | true | none |
| §7.6 Check | `S(e₂*)=−e₂*`, `P=ℕe₁` | pairing holds (both sides `0`); `log(1+x)↦−log(1+x)` | `(1+x)⁻¹` | none |
| Headline: reconstruction (§2.3) | non-f.g. `P={a≥1, −a²≤b≤a²}` | positive chamber is the ray `θ₂=0, θ₁>0`, which meets no `n⊥` | allowed points exist | none |
| Headline: completion (§§3.3–3.4) | `ρ=0` | `μ=0`, every bracket vanishes; input is its own completion | consistent | none |
| Headlines not in Lean | BCH group, §§2.3, 3.3–3.4, 5.5, 7.2–7.7 | module docstring names each with the missing carrier | as required | none |

- Earlier findings: the previous review's R01 (no layer ended with `### Examples` and `### Dependencies`) is repaired. All eight layers now end with both (lines 555/569, 914/928, 1089/1101, 1325/1336, 1599/1611, 2028/2040, 2234/2246, 2621/2632).
- Automatic checks: every one passed for the worker. My rerun of the gate printed all scanners at `0` and `OK`. The dependency check printed `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line (the roadmap is on main). Nothing outside the folder changes.
- Elaboration: `lake env lean` gives five `declaration uses sorry` warnings (lines 66, 75, 93, 109, 168) and nothing else. `#check @` of all 14 declarations, elaborated together, keeps every binder the README states; nothing changed. One-tactic probe: `simp` closes none of the four statements tried, so none is padding.
- Pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d): 72 cited Mathlib names elaborate by `#check` with 0 errors. I read DualFinite.lean 21–105, which has Minkowski–Weyl only in a docstring, plus Comma/Final.lean 86 and 123, MvPowerSeries/Equiv.lean 343, Trunc.lean 318, AdicCompletion/Basic.lean 172 and MonoidAlgebra/Basic.lean 720. I opened 33 cited Tau Ceti declarations in 16 files, and Tau Ceti has neither Lean headline at the pin.
- Source locators: 64 locators checked in 12 sources (PET, BRI, MAN, GHKK, KS, NQ, CPS, N23, GHS, GS, BLM, LMY), all fetched from arXiv. The line numbers in the table are `<source id> line N`.
- Cross-roadmap citations resolved on main: ClusterAlgebras (its supplier section, line 150), RepresentationTheory/LieHighestWeight (line 53), RepresentationTheory/LieGroups (lines 252, 446, 584) and Completed/AnalyticToricGeometry. No cited id moves; the open revision of LieGroups keeps those layers.
- Diff audit: a word diff of all 41 sections against main shows only the statement changes the description lists, besides those in C02.

Overlap check: read ClusterAlgebras and AnalyticToricGeometry (the open and results lists are empty), plus RepresentationTheory/LieGroups and LieHighestWeight on main and ConvexAnalysisAndDuality and TropicalAndBerkovichArithmetic (open). Owners of the shared objects:

- Minkowski–Weyl for cones: owned here (§1.1); ConvexAnalysisAndDuality §1.3 cites it.
- PBW symmetrization: owned here; LieHighestWeight consumes it.
- Skew data, quantum coefficients, completions, broken lines and positivity: owned here; ClusterAlgebras consumes them.
- The BCH group: LieGroups Layer 5's smooth real group is a kept variant of the algebraic group here.
- Toric cones, fans and dual semigroups: owned by AnalyticToricGeometry through Tau Ceti.

Source independence: 16 passages compared with 10 sources, none shared beyond formulas, standard names and lists of conditions forced by the mathematics. They are the sampled passages plus the §0.4 PBW docstring, the §3.2 incoming definition, the §5.2 broken-line definition and the §7.3 shadow definition. §6.3 restates GS §2.3's construction in formulas, with its own prose. The largest share is BLM, with 20 of 78 locator citations. Contents compared with BLM: independent. Layer 7 uses BLM §§2, 3, 5, 8 and 9 in another order, and Layers 0–6 do not use BLM at all.

Research link: Layers 2–3 are the Kontsevich–Soibelman reconstruction and consistent-completion theorems (Kontsevich–Soibelman; Bridgeland; Mandel; Gross–Hacking–Keel–Kontsevich 2018, Theorem 1.21). Layer 5 holds the broken-line theta functions of GHKK 2018 and Carl–Pumperla–Siebert, and Layer 7 the positivity of GHKK Theorem 1.13 and Burcroff–Lee–Mou 2025. This rests on the README's references and those texts at the cited locators.

## Not verifiable

- ZIE Chapter 1 and SCH Chapter 8 (§1.1) are textbooks with no legal open copy; I checked the facts cited (Minkowski–Weyl, finiteness of faces) directly.
- The OCR line of PET that states Hypothesis 8.1 (PET line 733) is inverted and unreadable, and the PDF could not be rendered here. That the hypothesis holds over rings containing `ℚ` rests on PET lines 50–53 and 811.
- Ownership against open pull requests was checked by object search over the 432 open heads, not by reading every roadmap.

## Source issues

- **Misprint** in BLM at Remark 5.20, p. 34: the source writes the condition as `|a d_{2,k} − b d_{2,k}| = 1`, repeating the second coordinate; it should be `|a d_{2,k} − b d_{1,k}| = 1`, the case `m = 1` of Theorem 5.17; affects nothing.

## For the human reviewers

- The source with the largest share of locators, BLM (20 of 78), is cited as arXiv 2503.03719v1 (2025), and Layer 7's positivity for polynomial inputs (§§7.1, 7.3–7.5) rests on it. I did not establish whether it has been refereed.
