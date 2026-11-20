# Review of ScatteringDiagrams (pull request #2650 at de3257f)

**Verdict:** accepted

**Summary.** Accepted: on a second, independent pass over this unchanged head every statement, Check and worked example I recomputed is true (the crossing, coboundary and sweep signs, the Heisenberg reconstruction, the pentagon order, the focus-focus products, and the §7.3 wall coefficients and theta coefficients, the last by a fresh computation of the rank-two completion), and every sampled locator is supported by its source. There are four small corrections and three format notes, none blocking: nine sentences say a section "follows" a source, two sentences of the description are wrong, one locator in §3.1 points at the wrong display, and the paragraph on the LieGroups roadmap omits that it also defines a formal BCH series. Two facts are left for the human reviewers.

## C01 — Nine sections open by saying that they follow a source, which the roadmap's organisation rules exclude

The project's planning rules say that a roadmap's organisation is its own and that it does not say it follows a source; results are cited at the claims. The sentences "This section follows …" at the head of §2.3 (line 1022), §5.1 (1621), §5.3 (1717), §5.5 (1896), §5.6 (1982), §7.1 (2260), §7.3 (2381) and §7.4 (2475), and "following GS §2.3 and GHS Definition 3.3, …" in §6.3 (line 2134), tell a reader that the plan of the section is the source's. It is not: I set the layers beside the contents of the most cited source (BLM §§2–9) and beside BRI §§2–3 and MAN §2, and neither the order nor the scope of any layer tracks them (Layer 7 draws on BLM §8.1, then §§3 and 5, then §9.1–9.3, and adds its own affine-perturbation step).

The smallest repair is to put each locator at the statement it supports, as §§0.4, 3.3, 4.3, 5.4 and 7.2 already do (for example "(BRI Lemma 3.1)" at the wall-label clause of *reconstructionEquiv* and "(BRI (5))" at the sign factorization). A section-level "Sources: …" in place of "This section follows …" would also do.

## C02 — Two sentences of the description are contradicted by the pin and by the head

The description says "§0.7: the old README cited `Comma.initial_snd`, which does not exist in Mathlib", and calls it "the one exception" among the old supplier declarations. At the pinned Mathlib `CategoryTheory.Comma.initial_snd` is an instance (`Mathlib/CategoryTheory/Comma/Final.lean`, line 123; `#check` elaborates): the second projection of `Comma L R` is initial when `L` is, which is the case §0.7 uses. The new citation `initial_snd_of_isConnected_costructuredArrow` (line 86 of the same file) is its general form and is also correct.

The description also says that the "Sources:" lists "are moved to the claims they support"; in the nine sections of C01 they open the section instead.

Text that would be right: "§0.7 now cites `Comma.initial_snd_of_isConnected_costructuredArrow`, the general form of the instance `Comma.initial_snd` it cited before; every declaration of the old supplier list exists at the current pins with the stated meaning." The sentence on the "Sources:" lists becomes true once C01 is applied.

## C03 — In §3.1 the wall-space axioms are attributed to MAN (5), which is the bracket of the tropical vertex algebra, not the axiom

A reader who opens MAN at display (5) to compare the definition of *DirectedWallSpaces* (line 1116) finds the commutator formula for `z^n∂_m` in Example 2.1(i). The bracket condition `[h_{n,m},h_{n',m'}]⊆h_{n+n',μ}` with `μ=m(ρ(n'))m'−m'(ρ(n))m` is MAN's requirement (3) with `μ` defined in (4) (MAN lines 160–170); (5) is the instance from which (3) follows in that example, and §4.1 is the place that uses it. "MAN (3)–(4)" in §3.1, and "(MAN Example 2.1(i), (5))" at the bracket of §4.1, would be exact.

## C04 — The paragraph on RepresentationTheory/LieGroups omits that its Layer 3 also defines a formal BCH series, and nothing compares it with *bchElement*

"Adjacent roadmaps" (lines 2704–2710) says LieGroups owns "the analytic local BCH identity (its Layer 3)". On main that layer also defines the formal series `B(X,Y)` "by the degreewise Dynkin Lie series in the completed free Lie algebra" (RepresentationTheory/LieGroups README, line 459), with first terms `X+Y+½[X,Y]+…`; the open revision of that roadmap keeps it in its §3.3. Its truncation modulo `lowerCentralSeries c` is the element §0.4 calls *bchElement c*, defined here as a logarithm. The two roadmaps therefore each construct the universal BCH element, by different formulas, and neither states that they agree, so an implementer of either cannot use the other's identities.

The smallest change is one clause in that paragraph saying that LieGroups Layer 3 defines the Dynkin form of the series and which roadmap states the comparison. It would fit §0.4 as one API fact: *bchElement c* is the class of the Dynkin partial sum through degree `c` (both have exponential `exp(X)exp(Y)` in `U_c`, and `ι_c` is injective).

## N01 — §6.3 names the overlap maps `h_II` and `h_III` after the charts II and III of GS Figure 2.1, which the README never introduces

Lines 2160–2166. A clause saying that `h_II` is the identity transition on the lower overlap and `h_III` the transition `S` on the upper one, or the names `h_lower`, `h_upper`, would read better without GS at hand.

## N02 — The reference entry for KS names §2.1, but the only KS locator in the text is Proposition 3.3.2

Both citations (§3.3, lines 1206 and 1238) are to Proposition 3.3.2, which is in §3.3 of the paper (KS line 1035); the entry would list §3.3.

## N03 — §0.4 says the symmetrization is Tau Ceti's degreewise map on each symmetric power, which at the pin exists only for `R : Type`

`TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization` takes `(R : Type)`, while `exists_pbwSymmetrizationEquiv` is stated for `R : Type*`. A clause "for `R` in `Type`; in general by the same formula" would keep line 291 exact.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 moduli and Checks (sample) | `P={0}∪{a≥b≥1}`, `T(a,b)=b`; f.g. `P`; `P=2ℕe₁+ℕe₂` | `(j,1)↦1` with `δ=j` unbounded; `δ(n)≤cΣaᵢ≤cδ'(Tn)`; ray `e₁` has degrees `2ℕ_{>0}e₁` | true | none |
| §0.2 Heisenberg truncations (sample) | `g≤1`, `g≤2`; `Z` in degree 1 | `g≤1` abelian on `X,Y`; kernel `RZ` central; `[X,Y]=Z` needs degree 2 | true | none |
| §0.3 moduli | `f(I^{ck})⊆J^k` | `f(I^{c(k+1)})⊆J^{k+1}`, so `λ(k)+1=c(k+1)` | true | none |
| §0.4 `comap_freeAugmentation_pow_ι` | `c=0`; graded tensor algebra | preimage of `U⁺` is `𝔣`; `(U⁺)^{c+1}=T^{≥c+1}` meets `𝔣` in degrees `>c` | true | none |
| §0.4 `exists_bch_exp_mul_exp` | `c=0`; Heisenberg; junk `exp` | quotient `ℚ`: `1=1`; `X+Y+Z/2`; `ι b∈U⁺` nilpotent in `U_c`, no junk | true | C04 (prose) |
| §0.4 `exists_pbwSymmetrizationEquiv` | `d=0,1,2`; PET 756, 789, 832 | `β(1)=1`, `β(ιx)=ιx`, `½(xy+yx)`; pin has surjectivity only (Symmetrization.lean 255) | true, not at pin | N03 |
| §0.4 cofinality bound and Checks | `B`, `k`; `U(ℚx)`; `x_d` in each degree | `⌈(B(k−1)+1)/B⌉=k` generator factors; `x²∈I²U`, `g₂=0`; `x_d∉J²` | true | none |
| §0.5 change of degree (sample) | `δ→2δ`; `P={b≤a≤b²}` | `δ>⌊k/2⌋⇒2δ>k`; `P` closed: `b²+b'²≤(b+b')²`; maxima `k²`, `k` | true | none |
| §0.7 comparison lemma | `H₁` initial | `Comma.initial_snd` (Final.lean 123) and the cited general lemma (line 86) both apply | true | C02 (description) |
| §1.1 `PointedCone.fg_iff_dualFG` | `p=id` on `Dual ℝ V`; empty presentations | `DualFG` (DualFinite.lean 45): `C=dual` of finite set of forms; cones `ℝ×{0}`, `{(0,0)}` | true; pin has only docstring | none |
| §§1.2, 2.1 crossing words | square loop; four half-axes | `w⁻¹` at `(1,0)`; `w₁⁻¹w₄⁻¹w₃w₂`; `b,a,b⁻¹,a⁻¹` gives `a⁻¹b⁻¹ab` | true; BRI 407, MAN 300 same sign | none |
| §1.4 coboundary, pairing, sweep (sample) | half-plane; segment; point in `ℝ`; Stokes on triangle | `+dy`, pairing `−c`=`⟨C,∂γ⟩=0−c`; `±dx∧dy`; `dS_nC=−C`; boundary crossing `+1` | true | none |
| §2.3 factorization, reconstruction (sample) | BRI 487–551; Heisenberg on `ℤ²`, six rays | middle factors `exp(sX)`, `exp(s'Y)`, `exp(ss'Z)` only at `(−1,1)`; both chamber paths give `g` | true | C01 |
| §3.1 bracket normal | general; `m'=cm` | `μ(ρ(n+n'))=0`; `μ=0` for proportional normals; MAN (3)–(4) lines 160–170 | true | C03 |
| §3.2 incoming Checks (sample) | `ℝ≥0e₁`, `+2e₁`; `ρ(a,b)=a`, degree `(0,1)` | `e₁∈rec` for both; `ρ(w)=0`, point support; MAN 259 same definition | true | none |
| §3.3 two-wall Check (sample) | `n=e₁,m=e₂*,n'=e₂,m'=e₁*` | `μ=e₁*−e₂*`; loop gives `c⁻¹=exp(−t₁t₂[x,y])`; MAN 2.9: `ℝ≤0(n₁+n₂)`, `t₁t₂[g₁,g₂]` | true | none |
| §3.3 citations (sample) | MAN 319; GHKK 1019–1025, 1039, 4730; KS 1035 | finite hyperplane input; walls `n₀⊥`; proof in §1.2; bijection with initial data | supported | N02 |
| §3.4 uniqueness Check (sample) | full hyperplane | LMY 250: outgoing iff `P+tm⊂P` for `t≤0`, so both incoming and outgoing there | true | none |
| §4.1 Checks | `ℤ³` bracket; `T(a,b)=a+b`; `T=(2a,b)` | `−e₃*`; `s=1` and `s=0`; `yx∂ₓ(x−y)=xy↦z²`; `S(e₁*)=½e₁*` | true | none |
| §4.2 skew data (sample) | `{e₁,e₂}=1`; `d=(1,2)`; principal lift | `p₁*(e₁)=(0,1)`, `p₁*(e₂)=(−1,0)`; `[Dₙ,Dₙ']={n',n}D_{n+n'}`; `νₙ(r(n))=0`; `κ=1,2` | true | none |
| §4.3 quantum ray action | `r=1,2`, `r<0` | `z^{jn}z^p=q^{2jr}z^pz^{jn}`; `z^p+z^{p+n}`; `(q+q⁻¹)`, `1` at `2p` | true | none |
| §4.4 slab product | `q=t(1+w)`; signs of `n,m` | `r=min` for opposite signs; `X²Y=t(1+w)X`; image `tᵃy⁻ᵃ(1+w)ᵃwᵇ` | true | none |
| §5.3 Checks and bound (sample) | diagonal shadow; `r`, `h` | `{0}−ℝ≥0(−1,−1)=ℝ≥0(1,1)`; `r−1` marks, `r` blocks: `rh+r−1`; CPS 615, 644; GHS 1549–1581 | true | C01 |
| §5.5 probe and theta Check (sample) | `δ_ext`; mixed normal; one wall `1−zⁿ` | `δ(n)+c`; `m(ρ(p+n'))e_z*`; `zᵖ`, `zᵖ−z^{p+n}`; `θ⁻¹` back; MAN 555 | true | C01 |
| §6.2 semidirect law (sample) | associativity; `H=1` | both bracketings `(gα(g')αα'(g''),αα'α'')`; `G≤k⋊1=G≤k` | true | none |
| §6.3 fibre product and lifts (sample) | `k=0`; `g_f h_II` vs `g_f' h_III`; GS 450–465 | `A₀=K[w^±][X,Y]/(XY)`; `wf'=f`; `XY=(ft,ft)`; `ι₋` injective on basis `xᵃyᵇ` | true | N01 |
| §6.3 `FocusFocus.modelTheta_mul` | `(n,m)=(1,1),(−2,1),(−2,2)`; ℕ-subtraction | `r=0,1,2`; `tX(1+W)`; `t²(1+W)²=0` at `k=1`; numerator even, nonnegative | true | none |
| §7.1 (sample) | `1+p₁x+p₂x²`; lift bound; BLM 2198–2216 | `[u]f_u=−1`; `Σb_α≤k`; `Σb≤Σsb≤ℓ_maxΣb`; `gcd`, primitivity, injectivity as stated | true | C01 |
| §7.2 pentagon | `{e₁,e₂}=1` on `x,y` | both sides `x↦x+xy`, `y↦y/(1+x+xy)`; reversed: `x(1+y/(1+x))` against `x(1+y)(1+xy(1+y))` | true | none |
| §7.3 wall coefficients | own computation of the completion to degree 6 | `f=1+acu+(2bd+bc²+a²d)u²+5abcd·u³`; `[u³]f²=14abcd+2abc³+2a³cd`; `[x³y²]f_{(3,2)}=abd` | true | C01 |
| §7.3 rectangles `(5,3)`, `(6,4)` | theta coefficient of `z^{(−2,0)}`, resp. `z^{(−3,−1)}`, in the fourth quadrant | `16abcd+2abc³+2a³cd`; `14abcd+2abc³+2a³cd=[u³]f²` | true | none |
| §7.4 lattice change | `m₁=(1,0),m₂=(1,2)`; BLM 2814–2870 | `ℓ=2`, `r=2`, `ind=1`; direct: `(1−x^{(2,2)})⁻⁴` is the square of `(1−x^{(2,2)})⁻²` | true | C01 |
| §7.5 positivity at joints (sample) | no unfrozen index; zero form; BLM 2330, 3087, 3125 | no walls; injectivity fails, handled in §7.6 by the extension; Theorem 8.11 as stated | supported | none |
| §7.6 Checks | `S(e₂*)=−e₂*`, `P=ℕe₁` | pairing `0=0`; `(1+x)` becomes `(1+x)⁻¹` | true | none |
| Headline: reconstruction (§2.3) | rank one; abelian `g` | single wall `{0}` labelled `g`; class ↦ product of labels | consistent | none |
| Headline: completion (§§3.3–3.4) | `ρ=0`; proportional normals | `μ=0`, input is its own completion | consistent | none |
| Headlines not in Lean | BCH group, §§2.3, 3.3–3.4, 5.5, 7.2, 7.5, 7.7 | module docstring names each and its missing carrier | as required | none |

- Earlier review: it had no findings; its two small corrections and one format note are C01, C02 and N01 above, unrepaired because the head is unchanged. C03, C04, N02 and N03 are new.
- Source locators: 49 read at the statement in 10 sources (BRI, MAN, GHKK, KS, LMY, CPS, N23, GHS, GS, BLM), and about 40 more, with the four in PET, located by number only; all fetched from arXiv. Line numbers above are `<source id> line N`.
- Library at the pins: 17 declarations elaborated by `#check` with no error; opened DualFinite.lean 21–45, Comma/Final.lean 86 and 123, Nilpotent/Log.lean 48–189, MonoidAlgebra/Twisted/Basic.lean 99–461, PBW/Symmetrization.lean 78–262, Cone/Face/Finite.lean 94. Neither pin has a BCH element, the assembled symmetrization equivalence, or Minkowski–Weyl.
- Elaboration: `sorry` warnings at lines 66, 75, 93, 109 and 168, nothing else. The 14 elaborated signatures keep every binder the README states. One-tactic probe: `simp`, `rfl` and `exact?` each fail on all five statements; none is padding.
- Automatic checks: all pass on my rerun. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing outside the folder changes.
- Cross-roadmap citations resolved on main: ClusterAlgebras (lines 107, 150–152, 448), RepresentationTheory/LieHighestWeight (lines 53, 102, 889), RepresentationTheory/LieGroups (Layers 0, 3, 5 at lines 252, 446, 518; kept by its open revision), Completed/AnalyticToricGeometry.
- Computation: the rank-two completion of `1+ax+bx²`, `1+cy+dy²` was recomputed from the loop identity to degree 6 with exact arithmetic, with zero residual, and the theta coefficients by path-ordered transport.

Overlap check: read ClusterAlgebras and AnalyticToricGeometry (the other two lists are empty), and RepresentationTheory/LieGroups, RepresentationTheory/LieHighestWeight and the open ConvexAnalysisAndDuality; Minkowski–Weyl for cones: owned here, ConvexAnalysisAndDuality cites §1.1; PBW symmetrization: owned here, LieHighestWeight consumes it; skew data, quantum coefficients, completions, broken lines, positivity: owned here, ClusterAlgebras consumes them; cones, fans, dual semigroups: AnalyticToricGeometry through Tau Ceti; universal BCH element: defined here as a logarithm and in LieGroups Layer 3 as a Dynkin series, see C04.

Source independence: 17 passages compared with 10 sources, none shared beyond formulas, standard names and lists of conditions the mathematics forces; largest share BLM, 20 of 78 locators; contents compared with BLM: independent (Layer 7 uses BLM §8.1, §§3 and 5, §§9.1–9.3 in that order, and Layers 0–6 do not use BLM).

Research link: Layers 2–3 are the reconstruction and consistent-completion theorems of Kontsevich–Soibelman, Bridgeland, Mandel and Gross–Hacking–Keel–Kontsevich (Theorem 1.21); Layer 5 the broken-line theta functions of GHKK and Carl–Pumperla–Siebert; Layer 7 the positivity of GHKK Theorem 1.13 and Burcroff–Lee–Mou 2025. Rests on the README's references and those texts.

## Not verifiable

- ZIE Chapter 1 and SCH §8.3 (§1.1): no legal open copy was found for either textbook; the facts cited (Minkowski–Weyl, finiteness and exposedness of faces) are standard and were checked directly.
- PET Hypothesis 8.1: the recognised text of that line is unreadable; that the hypothesis holds over rings containing `ℚ` rests on PET lines 50–53 and on Theorem 8.1 (line 756).
- The identity of the shadowed-grading sums of §7.3 with broken-line counts was taken from BLM Lemma 5.23 and Propositions 5.28 and 5.34; I computed the broken-line side, not the gradings.
- Ownership against open pull requests was checked by object search over the open heads, not by reading every roadmap.

## Source issues

- **Misprint** in BLM at Remark 5.20, p. 34: the source says the condition is `|a d_{2,k} − b d_{2,k}| = 1`, with the second coordinate twice; it should be `|a d_{2,k} − b d_{1,k}| = 1`, the case `m = 1` of Theorem 5.17; affects nothing.

## For the human reviewers

- The source with the largest share of locators, BLM (20 of 78), is cited as arXiv 2503.03719v1 (2025); Layer 7's polynomial positivity (§§7.1, 7.3–7.5) rests on it. Whether it has been refereed was not established.
- §6.3 restates the construction of GS §2.3 (the rings, the maps `h_II`, `h_III` and the gluing identity) in formulas with the roadmap's own prose; GS is an arXiv preprint (0808.2749v2).
