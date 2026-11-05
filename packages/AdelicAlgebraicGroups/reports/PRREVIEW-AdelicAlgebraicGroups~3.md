# Review of AdelicAlgebraicGroups (pull request #792 at 872269e)

**Verdict:** needs changes

Three blocking findings remain: reciprocal supply with QuaternionicModularForms, nonexistent pinned height declarations, and the upward LFunctions dependency. The targeted build and direct Lean elaboration pass; the gate fails. No change was made to the pull request.

Previous findings were checked first, against this head, rather than assumed correct:

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, Fuchsian cycle | README:124–128, “supplies the coarse quotient Riemann surface” | **Withdraw**: main supplies these objects without a reverse AA edge; the checker uses an open revision instead. |
| R02, LFunctions | README:505, “LFunctions supplies primitive finite-order Hecke continuation” | Not repaired; R03. The earlier replacement misses its `s ≠ 1` hypothesis. |
| R03, main suppliers/order | README:503–512, “GlobalQuadraticForms, layer 5”, “ClassFieldTheory, layers 11–12”, “IntegralLattices, 2F–2G” | Unchanged; permitted main suppliers. Board diagnostic, not a reason to re-plan their work. |
| R04, heights | README:258, “use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2`” | Not repaired; R02. |
| R05, citation key | README:5333, “[PR94]” | Not repaired; R04. |
| R06, anchors | README:586, `<a id="local-haar-character"></a>` | Not repaired; R05. |
| R07, outside files | Nine files under the three other roadmap folders | Not repaired; R06. |
| R08, promised names | README:2713, `RealSiegel.IsReduced e C b` | Not repaired; R07. |
| R09, Orr edition | README:5406, “arXiv:1609.01315v6, 19 July 2023” | Repaired: v6 has the cited sections/pages. |
| R10, Lean form | Suggested.lean:12, “headline targets”; :303, “The restricted product with its Borel σ-algebra is a Borel space” | Partly repaired: instance docstring fixed; title/order remain, R08. |
| R11, global instances | Suggested.lean:54,85,301,304, `scoped instance` | Repaired: all four instances are scoped. |
| R12, fork locators | README:257,260,294–295, supplier links to fork commits | Not repaired; R09. |
| R13, locators/style | README:142, “summable-series-and-logarithm reading”; :2564, “for compatible Haar measures” | Not repaired; R10. |

No settled “not actionable” repair report was found. Additional corrections hold: cotangent class `T−1` (README:1919), **nonzero** invariant measure (:2309), and quaternion finiteness modulo central units, with full finiteness over ℚ (:5249).

## R01 (P1) — Quaternionic supplier and consumer form a cycle

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:294–295`, “Definite quaternion class sets and stabilizers”; also :4813–4825 and :5187–5201.

Claim: QuaternionicModularForms §§0.1–0.3 supply AA's norm, class-set and stabilizer interfaces.

Witness: `TauCetiRoadmap/QuaternionicModularForms/README.md:37,45–50` explicitly consumes AA's adelic/Hecke machinery while supplying its quaternionic interfaces back: AA → QuaternionicModularForms → AA.

Repair: make QuaternionicModularForms a consumer. Transfer the shared compact-stabilizer-modulo-centre target to AA.5.3, derive class finiteness from AA.3.4, and use the earlier algebraic quaternion norm owner. Remove the reverse supplier rows and coordinate the ownership transfer. Theorem-level separation does not cure a roadmap cycle. Test Hamilton/ℚ (24 Hurwitz units, class number 1) and a real quadratic field (infinite central units, finite central quotient); both must remain supported without a return edge.

## R02 (P1) — The height contract cites nonexistent pinned declarations

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:258`, “use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2`”; consumed at :3363–3377.

Claim: those three declarations are available in `TauCeti/NumberTheory/Height/Arakelov/Basic.lean`.

Witness: the pinned Tau Ceti has neither that directory nor any occurrence of those declaration names. Main's `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:1357–1372` owns the relative-height definition and comparisons as §2.5 targets.

Repair: cite that existing roadmap section as the supplier for the entire tuple-height contract; remove the nonexistent pinned filename and `TauCeti.` declaration claims. Retain AA's adelic extension and comparison. No new gap is needed for the already stated §2.5 targets. The normalization test is `(2,1/2)` over ℚ: `(√17/2)·2 = √17`; after quadratic extension the relative height is 17 and the absolute height remains √17. The empty tuple has projective height 1, while raw `height2` is 0. These match the actual supplier.

## R03 (P2) — LFunctions is an upward supplier

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:260,505–506`, “Layer 5 for continuation and Layer 7 for nonvanishing”; also :110,2024–2026,2051,2316.

Claim: AA.2.4 imports general finite-order Hecke continuation and nonvanishing from LFunctions.

Witness: `UPWARD: AdelicAlgebraicGroups (#31) -> LFunctions (#301) at README lines [110, 260, 505, 2316]`. LFunctions is a new roadmap; its resolved Layer 5 begins at README:930.

Repair: transfer the precise finite-order Hecke analytic prerequisite to a single earlier owner, with LFunctions consuming it, or restructure the merge order and all affected consumers consistently. Use the pinned unitary-weight continuation/cancellation machinery and existing ray-class counting as inputs; explicitly include the nonzero germ at 1 for **every** nontrivial finite-order ray-class character and the finite Euler correction. Do not claim the existing cyclotomic-only Chebotarev theorem supplies that full generality. In particular, `TauCeti.continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` at `TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:134` requires `s ≠ 1`. For the quadratic character modulo 4, its square is trivial on good ideals and `L(1,χ)=π/4`; that theorem cannot prove the required value is nonzero. The earlier repair proposal missed this hypothesis. Moving ownership must retain this case as well as nonquadratic characters, and eliminate the upward edge without duplicating LFunctions.

## R04 (P3) — The bibliography key fails the gate

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3107,3955,3965,3976,3984,4176,4184,5333`, `[PR94]`.

Claim/witness: these are scholarly citations, not actual pull-request references, but the supplied gate reports eight `prnum` failures on exactly this key.

Repair: rename the displayed key to `[Platonov–Rapinchuk]` everywhere, preserving the 1994 edition. The replacement does not match `PR` followed by digits and leaves every locator intact. This is scanner compatibility, not a citation objection.

## R05 (P3) — Nine HTML anchors fail the residue rule

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:586,607,845,919,1393,4003,4483,4812,5023`, `<a id="…"></a>`.

Claim/witness: `residue=9`; the gate forbids these tags even when they are ordinary navigational anchors.

Repair: delete the nine tags and retain the prose headings/target slugs. This removes every reported match without removing a mathematical statement.

## R06 (P3) — Nine changed files lie outside this review's folder

Location: the PR diff includes `README.md`, `Suggested.lean` and `metadata.toml` in each of `TauCetiRoadmap/ReductiveGroupsPartII`, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups` and `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants`.

Witness: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdelicAlgebraicGroups'` reports nine files and 22,029 insertions; gate `outside-folder=9`.

Repair: rebase this roadmap onto main after its stacked suppliers merge, so those supplier commits leave the PR diff. Do not delete the suppliers' content. Validate that the diff has zero paths outside this folder.

## R07 (P3) — README names do not match the acceptance file

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1015,1018,1022–1023,2713–2718,4046,4970,5028–5057`; representative claim: `RealSiegel.IsReduced e C b`.

Witness: `Suggested.lean:371` defines `IsReduced C b`, without `e`. There are no declarations of `infiniteDiagonal`, `finiteEmbed`, `levelUnits`, `principalLevel`, `level0`, `level1`, the named membership predicates or `CongrMod`.

Repair: describe README-only maps, congruence predicates and Checks in prose. Explain that the kept Lean predicate is the matrix in the standard basis and the README's basis version is obtained by the Gram matrix. Do not add API padding to Lean. On `diag(4,1)` with `C=2`, the stated ordering inequality fails (`4<2`), while in the exchanged basis it holds (`1<8`); the basis cannot simply disappear from the prose signature.

## R08 (P3) — Restore the required Lean module form and layer order

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean:12,18–40,88–354`, title “headline targets”; Layer 0's restricted Haar statements follow Layers 1, 3 and 4.

Witness: there are no `/-! ## Layer k: … -/` section comments; the file jumps from approximation to restricted Haar products. The four instance docstrings and scoping are now fixed.

Repair: use the required “target signatures” title, say explicitly that these are the headline statements against the pinned APIs, place the declarations in README layer order, and add the layer comments. Replace “deferred until” with the direct list of nonstatable headlines and missing carriers. Re-elaborate the unchanged signatures after reordering; the current 20 theorem statements already elaborate under default options.

## R09 (P3) — Supplier links still identify forks and commits

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:257,260,294–295`, the MassFormula, LFunctions and QuaternionicModularForms supplier rows.

Claim/witness: the supplier links select historical fork commits instead of the named main roadmap or authorized open head. The quaternion cycle in R01 is hidden by treating an old supplier snapshot as the contract.

Repair: cite roadmap names and section/target locators at their authoritative versions. Preserve the mathematical mass, analytic and quaternion contracts while applying R01/R03's ownership fixes. A reader following the resulting section citation must find the same hypotheses, especially quaternion stabilizers **modulo** central scalars.

## R10 (P3) — Two source locators overstate what the cited page supplies

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:139–142`, “summable-series-and-logarithm reading”; :2558–2564, the general Iwasawa integration formula.

Witness: Sutherland line 291, §23.3 p. 6, constructs box measures, not logarithmic convergence. Arthur line 1286, §4 p. 24, gives factorization and `H_P`, not the integration identity.

Repair: attach the positive-product assertion to the actual pinned infinite-product declarations and spell out the logarithm deduction; retain Sutherland for box measures. Label the integration formula as the deduction from RG2.4 local integration, AA.0's product measure and AA.2's modulus, citing Arthur p. 21 only for its `GL₂` instance. Test the convention with the upper Borel and `diag(2,1)`: `δ=2`, so the left-Haar density is `1/2`, not 2. Consolidate the repeated Checks blocks in §§0.3,2.1,2.4 and format the paragraph Checks in §3.7 as individual bullets; the computed tests themselves can stay.

## Verified sound

Read both target files, the previous review, gate, citation leads and repository guidance. Shape examples: main FuchsianOrbifolds, GlobalNumberFields and GlobalQuadraticForms. Instance tests do not prove the admitted theorems.

**Build, signatures and padding.** Built the missing `TauCeti.Algebra.AlgebraicGroup.Hopf.Map` object, then ran the authorized targeted build and direct `lake env lean` on `Suggested.lean`. Both pass, with exactly 20 `sorry` warnings and no other warning in direct elaboration. A scratch copy printed `#check @name` for all 66 declarations, including the four scoped instances. Required binders survive. Coordinate evaluation, integration and representatives determine the restricted-product equivalence, quotient measure and GL₂ homeomorphism.

On a scratch copy, tried `simp`, `rfl`, `infer_instance` and one-lemma `exact?` branches on each of the 20 admitted theorems. Nineteen retained `sorry`; the strong-approximation search reached the default heartbeat limit. A separate default-options probe of that theorem with the first three tactics also retained `sorry` and elaborated. No padding, `set_option`, admitted example or sorry-defined data was found.

**Headline coverage.** The endpoints are restricted/convergent Haar products; integral-model realization and Weil restriction; quotient integration and Tamagawa/scalar normalization; real/adelic reduction, class finiteness, covolume/compactness, heights, cusps and subgroup containment; approximation, neat levels/coverings, quaternion norms and Fourier limits; GL₁ tori and GL₂ component/surface comparisons. Twenty kept theorems cover the statable principal conclusions. The docstring names the missing gauge/Artin, parabolic/Cartan–Siegel, Weil-restriction, geometric-component, torsor-class, ray-class/cohomology and complex-quotient interfaces. No additional omitted statable headline was established. Heights require the absent carrier in R02.

**Computed adversarial pass.** 122 retained rows cover all 15 sampled targets, headline theorems and finding witnesses. The full pass comprised 177 cases; unsampled supporting rows are omitted for length. “Keep” means agreement on that instance, not a proof. Zero rings and inseparable number-field extensions are excluded by the carriers. The table tests characteristic 2, nonreduced fibres, rank zero, nonabelian actions and ramification where admitted.

| Statement | Instances tried | Computed values on the two sides / negative control | Result; change |
|---|---|---|---|
| 0.1 principal pieces | Empty index set; one factor C₄, B={0,2} | Empty product is {1}; U∅ has 2 elements, U{0} has 4 | Keep |
| 0.1 Borel generators | Countable product C₄ with B={0,2} | Principal-piece cosets do not distinguish 0 from the vector 2 at index 0; coordinate boxes do: membership 1 versus 0 | Keep the coordinate-box condition |
| 0.1 principal inclusions | C₂ inside C₄ with discrete topology | Preimage of {1} is empty; preimage of {0} is {0}; both measurable | Keep |
| 0.1 normalized local Haar | ℚ₂, ℚ₃, ℂ; scalar 2 or 3 | vol(ℤ₂)=vol(ℤ₃)=1; vol(2ℤ₂)=1/2; vol(3ℤ₃)=1/3; complex area scaling by 2 is 4 | Keep |
| 0.1 image versus pushforward character | x↦2x on ℚ₂ | Image mass 1/2; pushed measure of ℤ₂ is mass((1/2)ℤ₂)=2 | Keep inverse in pushforward |
| 0.1 linear change of variables | Dimension 0; diag(2,3) over ℝ | Empty determinant and scalar are 1; det=6, image unit-box volume=6, pushforward density=1/6 | Keep |
| 0.2 unique Haar product (Lean:314) | Finite C₂×C₃; counting | Full box mass 2·3=6; each singleton mass 1; six singleton masses sum to 6 | Keep |
| 0.3 finite rescaling | Scalars 2 and 1/2 | Overall scalar 2·(1/2)=1; original and rescaled unit-box masses agree | Keep |
| 0.3 change restricting subgroup | One factor ℚ₂, B=ℤ₂ versus 2ℤ₂ | Both restricted carriers are ℚ₂; the same Haar gives new integral box mass 1/2, not 1 | Keep original local measures |
| 0.3 finite splitting | C₂×C₃×C₅ | Total mass 30; first-two-factor mass 6 times tail mass 5 is 30 | Keep measure addition to supplied topology |
| 0.3 factorizable integration | Counting on C₂ and C₃, constants 2 and 3 | Product-function integral 6·6=36; separate integrals 4·9=36 | Keep |
| 0.3 modular product | Upper affine group factor and compact factor | Modular values 2 and 1; product value 2 | Keep |
| 0.3 transported measures | x↦2x over ℝ | Pushforward mass([0,2])=1; target Lebesgue mass=2; transported local mass must be 1 | Keep specified pushforward |
| 0.3 convergent product (Lean:329) | aₙ=1−1/(n+2)², n≥0 | Partial product (N+3)/(2(N+2)) tends 1/2; tail after first factor is 2/3; (3/4)(2/3)=1/2 | Keep |
| 0.3 exceptional normalization | Same tail, exceptional factor mass 2 | Resulting whole integral box mass 2·(1/2)=1, not 1/2 | Keep exceptional factors |
| 0.3 logarithmic convergence | aₙ above versus aₙ=2 | Σ absolute errors = Σ(n+2)⁻² finite, product=1/2; constant-2 errors sum to infinity | Mathematics holds; repair locator R10 |
| 1.1 evaluation topology and points | Gₐ, Gₘ, identity group | Coordinate evaluation is x; unit coordinate at 2 is 2 with inverse 1/2; identity group has one point | Keep; no coordinate inversion |
| 1.1 integral model with marking | Gₐ, generic coordinate X↦pT | Local image p⁻¹𝒪 versus 𝒪 for identity marking; global image p⁻¹ℤ versus ℤ | Keep marked generic fibre |
| 1.1 integral units | Gₘ over ℤₚ | p is not integral as a unit because p⁻¹∉ℤₚ; 1 is integral | Keep algebra-valued inverse |
| 1.1 nonreduced fibre | A=ℤ[ε]/(ε³,3ε), primitive ε | Generic fibre ℚ; fibre at 3 is 𝔽₃[ε]/ε³, length 3 | Keep nonsmooth model distinction |
| 1.1 wrong primitive square-zero Hopf model | 𝔽₃[ε]/ε² | Δ(ε)²=2ε⊗ε≠0; at characteristic 2 the coefficient is 0 | Excludes invalid characteristic-3 example |
| 1.1 model spreading and enlargement | Same ε model, invert 3 | ε=0 after inverting 3; bad fibre disappears, generic group unchanged | Keep |
| 1.1 reductive integral models | Gₘ versus Gₐ over 𝔽₂ | Geometric unipotent radical dimensions 0 versus 1 | Keep connected/smooth reductive hypothesis |
| 1.2 finite product points | Gₘ over R×S | Units are Rˣ×Sˣ; (2,3) has inverse (1/2,1/3) | Keep |
| 1.2 integral-point comparison | Gₐ at p=2 | x=1/2 lies outside ℤ₂ but inside ℚ₂; restricting subgroup membership distinguishes them | Keep |
| 1.2 restricted realization (Lean:163) | Gₐ over ℚ; one exceptional prime 2 | Adelic coordinate 1/2 at 2 and 0 elsewhere is admitted; 1/p at every prime is excluded | Keep finite-support integrality |
| 1.2 model independence | Gₐ, markings X and pT | Integral subgroups coincide at q≠p; differ by p⁻¹ at p; restricted carrier unchanged | Keep |
| 1.2 finite/infinite projections | Principal rational 2 in Gₘ | Both projections evaluate to 2 at every respective place; reassembled point is diagonal 2 | Keep; R07 is naming only |
| 2.1 rational characters | GL₀, GL₁, SL₂, Resℚ(i)/ℚGₘ | Ranks 0,1,0,1; last geometric rank 2 | Keep rational/geometric distinction |
| 2.1 restriction to centre | GL₂ | det(tI)=t²; lattice map n↦2n has cokernel ℤ/2 | Keep finite cokernel, not integral isomorphism |
| 2.1 dual map | Gₘ→Gₘ, x↦x² | Character pullback n↦2n; dual logarithm map h↦2h | Keep; arbitrary rescaling would fail |
| 2.1 Harish-Chandra logarithm | Idele p at finite p only | Idele norm p⁻¹; H=−log p; principal p has log p−log p=0 | Keep sign |
| 2.1 split centre | Real quadratic F, archimedean (2,1/2) | Norm 1; point not in positive diagonal {(t,t)} | Keep A_G smaller than full archimedean centre |
| 2.1 positive scalar splitting | Degree-2 number field, positive diagonal 2 | Norm 4, H=2log2; inverse logarithmic section is exp(h/2) | Keep degree factor |
| 2.1 norm-one quotient | ℚ, Gₘ | Norm-one quotient compact; full idele classes contain ℝ>0, hence noncompact | Keep |
| 2.2 homogeneous integration (Lean:354) | H=C₂⊂G=C₄, counting | f=1 gives 4 on G; inner integral 2 and quotient mass 2 give 4 | Keep |
| 2.4 nontrivial quadratic germ | χ modulo 4 | L(1,χ)=π/4>0; square-trivial pinned lemma has false premise s≠1 here | R03 repair must cover this value |
| 2.5 local scalar Jacobian | ℚ(i)/ℚ, basis (1,i) | Map ℝ²→ℂ has pushed dxdy=(1/2)(2dxdy), so j∞=1/2 | Keep |
| 2.5 discriminant product | Same extension, integral basis | Finite jv=1, global product 1/2=\|−4\|⁻¹/² | Keep |
| 2.5 change of basis | Replace (1,i) by (2,2i) | Archimedean j becomes 1/8; finite product multiplies by 4; total still 1/2 | Keep reciprocal determinant |
| 2.5 gauge norm transport | Scalar 1+i | Field norm 2; complex normalized absolute value 2 | Keep; ordinary modulus √2 is wrong |
| 2.5 rank-zero transport | Dimension d=0 | Discriminant multiplier \|d\|⁰=1 and empty determinant 1 | Keep |
| 2.5 induced local factor | Unramified quadratic extension, z=1/2 | Frobenius swaps two lines: det(I−zF)=1−z²=3/4 | Keep residue degree, not two fixed lines |
| 3.1 rational parabolics | GL₁, GL₂, GL₃ with fixed minimal P | Standard parabolic counts 1,2,4=2⁰,2¹,2² | Keep |
| 3.1 relative coroots | GL₂, α=e₁−e₂ | Pairing with α∨ is 2; reflection swaps coordinates | Keep |
| 3.1 nonreduced relative roots | Quasi-split SU₃ | Roots ±α,±2α with positive multiplicities 2,1; modulus exponent 2α+2α=4α | Keep nonreduced system |
| 3.1 rational-character splitting | GL₂, (x,y)=(2,0) | Projection x+y=2; central lift (1,1); complementary component (1,−1) | Keep canonical dual maps |
| 3.1 positivity uses every simple root | GL₃, H=(1,−1,0) | α₁₂(H)=2, α₂₃(H)=−1, α₁₃(H)=1 | Keep all inequalities; highest root alone fails |
| 3.1 Iwasawa multiplication order | n=[[1,1],[0,1]], a=diag(2,1) | na=[[2,1],[0,1]], an=[[2,2],[0,1]] | Keep specified order |
| 3.1 H_P is not a group homomorphism | Weyl element w∈SO₂ and a=diag(2,1) | H_P(a)=(log2,0); H_P(wa)=(0,log2), while H_P(w)=0 | Keep right-K invariance only |
| 3.1 integration density | Upper GL₂, a=diag(2,1) | δ(a)=2; δ(a)⁻¹=1/2 | Formula passes; R10 locator repair |
| 3.2 fixed maximal compact | Möbius inversion on i and 1+i | Imaginary parts 1 and 1/2 after inversion, respectively | Keep dependence on compact/base point |
| 3.2 strict versus weak cones | Rank 1, a=1, t=1 | Weak inequality 1≥1 true; strict 1>1 false | Keep threshold adjustment |
| 3.2 reduced forms (Lean:371) | Identity matrices n=0,1,2, C=2 | Diagonal product and det both 1; decisive inequality 1<2 | Keep strict boundary C>1 |
| 3.2 reduced order | diag(4,1) versus diag(1,4), C=2 | 4<2 fails; 1<8 holds; determinant condition 4<8 holds in both | Keep basis ordering; R07 |
| 3.2 scale invariance | diag(1,4) scaled by λ=3 | Ordering 3<24; product 36<72; same truth values as 1<8 and 4<8 | Keep λ>0 |
| 3.2 Cholesky bounds | b=[[1,1],[1,5]] | N=[[1,1],[0,1]], d=(1,4); Nᵀdiag(d)N=b, det=4, diagonal product=5 | Keep |
| 3.2 lower-bound comparison | diag(1,4), vector (1,2) | Quadratic value 1+16=17; weighted coordinate contributions 1 and 16 | Keep |
| 3.2 sorting is necessary | Diagonal entries (4,1) | Product/determinant ratio 1 gives no ordering; permutation changes 4<2 false to 1<8 true | Keep sorting clause |
| 3.3 primitive GL reduction | GL₁(ℝ), including negative numbers | Ω={1}, A=ℝ>0, K={±1} gives ℝˣ, not just ℝ>0 | Keep components |
| 3.3 lattice reduction (Lean:381) | diag(4,1), n=2 | Integral permutation gives diag(1,4), C=2 satisfies all three conditions | Keep |
| 3.3 rank-zero reduction | Empty Gram matrix | det=1; C=2 works, GL₀(ℤ)={1} | Keep, not a separate Lean theorem |
| 3.3 action on positive forms | g=diag(a,a⁻¹) acting by inverse pullback | g⋅I=diag(a⁻²,a²), not diag(a²,a⁻²) | Keep stated convention |
| 3.3 closed orbit | Gₘ weights (1,−1), w=(1,1) | Orbit xy=1 closed; integral points (1,1),(−1,−1); positive component contains only first | Keep components and closedness |
| 3.3 nonclosed orbit control | Gₘ weight +1 on 1 | Orbit is nonzero line; closure adds 0 | Closed-orbit hypothesis excludes it |
| 3.3 affine quotient rational points | Gₘ/μ₂, quotient x↦x² | Rational quotient point 2 has no rational lift; 1 has lifts ±1 | Keep scheme quotient, not naive rational cosets |
| 3.3 denominator bound | Compact integral matrices and inverses | Integral GL₂ entries/inverses have denominator 1; diag(2,1/2) needs denominator 2 | Keep both matrices |
| 3.4 class finiteness (Lean:213) | Gₐ and GL₁ over ℚ, full integral level | Both class sets have cardinality 1 | Keep |
| 3.4 arithmetic volume (Lean:199) | Gₘ and SL₂ over ℚ | Character ranks 1 and 0; archimedean quotient volumes infinite and finite | Both directions tested; keep |
| 3.4 norm-one volume (Lean:222) | Gₘ over ℚ, Gₐ over ℚ | Compact norm-one class group; additive domain volume 1 | Keep connected hypothesis |
| 3.4 full volume iff (Lean:231) | Gₘ versus Gₐ | Character ranks 1 versus 0; multiplicative split direction infinite, additive domain mass 1 | Keep |
| 3.4 compactness iff (Lean:241) | Gₘ, SL₂, definite SL₁(D) | All cocharacters central for torus; diag(t,t⁻¹) noncentral in SL₂; definite SL₁ has no nontrivial rational split cocharacter | Compact, noncompact, compact, respectively; keep |
| 3.5 relative/absolute height | GL₁ point 2 over ℚ and quadratic extension | Relative √17 then 17; absolute √17 in both | R02 supplier repair; formula passes |
| 3.5 identity/rank zero | GL₂ identity; GL₀ | Combined tuple norm 2 over ℚ, 4 relatively over degree 2; empty projective height 1 versus raw height2=0 | Keep conventions |
| 3.5 Gₐ representation | [[1,1],[0,1]] and inverse | Six squared nonzero unit entries total 6; height √6 | Keep combined norm |
| 3.5 properness | GL₁ real scalar t→∞; finite p-coordinate p | Heights ≥t and ≥p; neither escapes with bounded height | Keep both g and g⁻¹ |
| 3.5 compact-translation comparison | GL₁ compact {±1} | h(−g)=h(g), comparison constants 1 | Keep |
| 3.6 cusp finiteness | SL₂(ℤ) | One rational cusp orbit, represented by ∞ | Keep |
| 3.6 finite overlap | Standard SL₂ region | Identity overlap nonempty; deep inversion overlap impossible because Im(−1/z)=y/\|z\|²≤1/y | Keep |
| 3.6 strict walls | Elliptic point ρ at y=√3/2 | y>√3/2 is false at equality; y≥√3/2 is true | Keep distinction |
| 3.6 separated parabolic ends | Opposite cusps, y>1 | Transformed height <1, so cannot also be >1 | Keep |
| 3.7 inverse adjoint | GL₁ over ℝ with positive form | θ(x)=x⁻¹, fixed group {±1}; identity involution fixes noncompact ℝˣ | Keep nontrivial convention |
| 3.7 compact components | GL₂ standard form | Fixed subgroup O₂ has determinant ±1; SO₂ would omit det −1 | Keep full compact |
| 3.7 Siegel-triple domain | Empty window, no roots, thresholds 1/2 | Empty window gives ∅; Ω={1}, no roots gives AK; with roots 1 belongs at t=1 and fails at t=2 | Keep |
| 3.7 embedding/character compatibility | Gₘ via t↦diag(t,t⁻¹) | Restriction (a,b)↦a−b; determinant restricts to 0 | Keep algebraically determined restriction |
| 3.7 tilted split torus counterexample | x=2 in [[x,x⁻¹−x],[0,x⁻¹]] | Matrix [[2,−3/2],[0,1/2]] sends i to −3+4i; transpose leaves the upper-triangular torus | Keep Cartan condition |
| 3.7 weaker versus stronger Cartan condition | Nonsplit torus [[a,2b],[b,a]], a=3,b=2 | det=9−8=1; transpose violates upper-right=2·lower-left; split rational torus is trivial | Keep stabilization of S_H, not necessarily H |
| 3.7 finite intersection components | H=SO₂, ambient positive diagonal torus | H∩full diagonal={±I}; H∩positive diagonal={I} | Keep identity-component caution |
| 3.7 subgroup containment | H=G, identical triple | Restriction map id, Weyl representative 1, C={1}; inclusion is equality | Keep |
| 3.7 pullback of Siegel sets | Identity embedding | SG∩G=SG={1}·SG | Keep; general source hypothesis checked |
| 4.1 weak approximation definition | μ₂ over ℚ at ∞ and 2 | Image {(1,1),(−1,−1)} has 2 points; target {±1}² has 4 | Keep; no false all-group assertion |
| 4.1 empty places | Any affine group, including trivial group | Empty product has 1 point; identity maps onto it | Keep |
| 4.1 split group weak approximation | SL₂ elementary matrices | [[1,a],[0,1]] has determinant 1 for every a; replacing a by nearby rational values preserves 1 | Keep route |
| 4.1 coordinate torsor | ℚ[t]/(t²−2), μ₂ | Q-points 0; real points 2; geometric canonical torsor map is an isomorphism | Keep |
| 4.1 torsor scalar extension | Same torsor, identity and ℚ→ℝ | Identity retains no section; real extension has ±√2 and trivial class | Keep actual base change |
| 4.1 nontorsor | Gₘ acting on A¹ | Orbits {0} and nonzero line: 2, not 1 | Excluded by canonical-map condition |
| 4.1 nonreduced torsor | α₂ over 𝔽₂ acting on itself | Coordinate length 2, geometric point count 1; canonical map remains invertible | Keep comodule scheme condition, not pointwise transitivity |
| 4.1 simply connected weak approximation (Lean:271) | SL₂, trivial group | Elementary coordinates approximate independently; trivial source/target each cardinality 1 | Keep; Hasse source limits below |
| 4.2 strong approximation (Lean:281) | SL₂; SL₂×definite SL₁(D), S=∞ | SL₂(ℝ) noncompact; product has noncompact points but quotient SL₁(D)(ℝ) compact | Keep every nontrivial quotient condition |
| 4.3 neat congruence (Lean:425) | 1+4ℤ₂; 1+3ℤ₃ | Distances ≤1/4<1/2 and ≤1/3<3⁻¹/² | Keep; residue 2 included |
| 4.4 covering cardinality (Lean:467) | GL₁ principal levels 3 and 9 | Group orders φ(3)=2, φ(9)=6; fibre index 3 | Keep |
| 4.5 full quaternion stabilizer | Totally definite D/F, real quadratic F | Unit powers ηⁿ give infinitely many central elements; after quotient their images are one element | Keep modulo-centre form; R01 |
| 4.6 quaternion norms (Lean:493) | Split algebra; Hamilton algebra | Nrd(diag(−1,1))=−1; Hamilton norm sum of four squares >0 on units | Both directions compatible; keep |
| 4.6 norm versus regular determinant | Split diag(−1,1) | Reduced norm −1; determinant of left multiplication (+1) | Keep native norm, not regular determinant |
| 4.6 partial real ramification | Real quadratic F, one ramified real place | Allowed signs (+,+),(+,−); excluded (−,+),(−,−) | Keep positivity only where ramified |
| 4.6 square-class compactness (Lean:503) | C_F≃ℝ>0×C_F¹ | (t,k)²=(t²,k²); positive quotient factor has cardinality 1, compact factor modulo its closed image remains compact | Keep |
| 4.6 nontrivial idele square class | ℚ, local unit −1 at 3, others 1 | −1 mod 3 is not a square; a positive rational with all even valuations is a rational square | Keep quotient nontrivial |
| 4.6 quadratic kernel measure (Lean:519) | C=∏ℕ{±1}, χₙ coordinate characters | Haar mass kerχₙ=1/2; normalized restricted mass=1; ψ_J integral 1 iff J=∅ or {n}, otherwise 0 | Limit coefficients match Haar; keep |
| 4.6 invariant weak limits (Lean:530) | Same group, distinct χₙ | For fixed nonempty J, coefficient eventually 0; trivial coefficient always 1 | Keep |
| 4.6 distinctness control | Repeat χ₀ | Integral χ₀ stays 1 under kernel Haar, while full Haar gives 0 | Keep injectivity |
| 5.1 logarithmic torus (Lean:574) | ℚ; imaginary quadratic; real quadratic | Unit ranks 0,0,1; connected components point, point, circle | Keep |
| 5.1 auxiliary level | Q={3}, p=2,n=1 | 4 mod3=1 is a square; 2 mod3=2 is not | Keep pⁿ-th-power condition |
| 5.1 empty auxiliary level | Q=∅ | No modified local factors; same quotient for every p,n | Keep |
| 5.1 component group correction | Q=∅, class group C₃, p=2 | Actual class group C₃; maximal exponent-2 quotient is trivial | Keep corrected README, source issue below |
| 5.1 torus cohomology | Unit ranks 0,1,2 | Betti ranks (1), (1,1), (1,2,1)=binomial coefficients | Keep |
| 5.2 GL₂ action | diag(1,−1) on i | Raw Möbius value −i; folded upper-half-plane action gives i | Keep orientation correction |
| 5.2 components (Lean:624) | Full finite integral level over ℚ | Positive rational determinant double class count 1; component is SL₂(ℤ)\ℍ | Keep representative equation |
| 5.2 compact at infinity | SO₂ versus O₂ | GL₂(ℝ)/(ℝ>0SO₂) has two components; O₂ identifies them | Keep full compact |
| 5.2 central torsion | Principal levels 2 and 3 | −I≡I mod2; −I≠I mod3 | Keep neat threshold |
| 5.2 elliptic stabilizers | SL₂ at i and ρ | Orders 4 and 6 before central quotient; 2 and 3 after | Keep orbifold versus neat quotient distinction |
| 5.3 definite quaternion class set | Hurwitz order | One right ideal class; unit group order 24 | Keep; change ownership R01 |
| 5.3 finite-adelic compactness | One Hurwitz class and compact open U | D_fˣ=DˣU, quotient is continuous image of compact U | Keep |

**Seeded source audit: all 15 requested subsections.** Acquisitions used the sources service; numbers refer to its extractions. Source hypotheses were retained.

| Sample | Text opened, locator and result |
|---|---|
| 0.1 Borel structure/local normalization | Sutherland lines 285–309, §23.3 p. 6: normalized local measures and measurable adelic boxes. Conrad lines 440–447 supports countable-base topology. The general countable group formulation is AA's extension, not a theorem literally stated by Sutherland. PRR's local modulus pages remain uncertified. |
| 0.3 products/transport/rescaling | Conrad lines 253–295, Remark 3.5 and Theorem 3.6 p. 6; Borel lines 674–678, §5.5 p. 21; Rosengarten lines 49–63, §1 p. 2 and 1017–1045, Lemma 3.5 p. 26. Lemma 3.5 requires nonempty adelic points (the identity suffices). Transport agrees; logarithmic convergence needs R10. |
| 1.1 affine points/integral models | Conrad lines 53–97, Proposition 2.1 p. 2; 232–247, Theorem 3.4 pp. 5–6; 253–295, Remark 3.5/Theorem 3.6 p. 6. Finite presentation over the S-integers and marked generic fibres are retained. ConradRGS lines 3334–3338, Definition 3.1.1 p. 81, and 3659–3664, Corollary 3.1.11 pp. 88–89, require smooth affine groups and connected reductive geometric fibres. |
| 1.2 restricted-product realization | Conrad lines 281–295 and the conclusion at 440–447; Borel lines 98–124, §§1.2–1.3 p. 7. Topological, not merely abstract, comparison; finite exceptional sets and integral subgroups are retained. |
| 2.1 characters/logarithms/split centre | Arthur lines 705–765, §3 pp. 15–16; 1307–1315, (5.1) p. 24. Borel lines 125–128, §1.3 p. 7; 696–736, §§5.7–5.9 pp. 21–22. Rational character rank, finite-index centre restriction and norm-one splitting agree. Number fields use restriction of scalars and squared complex modulus. |
| 2.5 scalar Jacobians/restriction of scalars | Rosengarten lines 53–63, p. 2 fixes dx, 2dxdy and scalar invariance; Gordon lines 1615–1633, (48) p. 32 is the quadratic-torus check only. MarzecNeururer lines 2562–2581, Proposition 5.10 pp. 61–62 and 2625–2638, Theorem 5.14 pp. 62–64 support ramified Artin induction, including inertia invariants and residue degrees. General discriminant transport is an owned deduction; PRR 3.60 remains uncertified. |
| 3.1 parabolics/Iwasawa | Borel §1.13 p. 11; BorelTits lines 1711–1714, §5.3 p. 96, and 1792–1807, §§5.8–5.9 p. 98, retain the central kernel and possibly nonreduced relative root system. Arthur lines 1271–1299, pp. 23–24 supports factorization and H_P. The integration locator needs R10; the computed modular sign is correct. |
| 3.2 real Siegel/reduced forms | BKT lines 331–366, §2.2 p. 8 and 810–832, Definition 4.11/§4.5 pp. 17–18; BKTErratum lines 11–34, §1.1 p. 1, 50–52, Remark 1.1 p. 2, and 133–141, §1.6.1 p. 4. Fixed K, strict reducedness, Cholesky deductions, sorting and inverse action are distinguished. AA avoids BKT's unsorted-basis overclaim. |
| 3.3 primitive/closed-orbit reduction | Orr lines 192–215, §2.A pp. 5–6 now matches the bibliography. Borel Theorem 4.5 pp. 17–18 and §5.3/Theorem 5.4 pp. 19–20 support arithmetic finiteness and closed-orbit embedding. Read Borel lines 640–654 for the disconnected reductive extension. BHC's separate embedding and weight-bound proofs could not be read from the scan; PRR reduction locators are uncertified. |
| 3.5 heights | Arthur lines 3963–3990, §13 p. 70, states a suitable faithful representation, compact height balls, polynomial inverse control and rational-point counting. AA specifies the representation-plus-inverse norm and states the extra deductions. The degree convention matches main DAT §2.5; R02 concerns its claimed pin. |
| 3.6 fixed-K cusps | BKT lines 378–392, Proposition 2.7 p. 9, items (1)–(5), read with BKTErratum lines 28–34. Finiteness, overlap, nonconjugate cusp separation, deep self-overlap and distinct-parabolic separation have the common-K restriction. |
| 3.7 subgroup containment/orbit maps | Orr v6 lines 221–245, Lemma 2.1/§2.B pp. 6–7; 656–678, Theorem 4.1 pp. 15–16; 705–777, §4.B pp. 17–19; 1002–1027, §4.F Proposition 4.14 pp. 24–25. OrrSchnell lines 33–41, Theorem 1 pp. 1231–1232; 65–82, §A p. 1232; 83–168, §§B–C pp. 1232–1234; 241–247, §E p. 1236. Read BGST lines 628–653, Proposition 28.1 pp. 14–15: pullback requires containment for every subgroup Siegel set, which AA supplies first. BHC's simultaneous self-adjointness proof remains unreadable. |
| 4.1 weak approximation/torsors | HW lines 258–262, notation p. 6 fixes density in the product of completions; Rapinchuk lines 96–105, Lemma 1.2 p. 3 is the SL₂ elementary-matrix instance, labelled as such. Stacks Tag 0245 line 4181 gives effective affine fpqc descent; Tag 04TY line 320 defines torsors; Tag 04SK line 747 states algebraic-space descent with the covering-size condition. SSF §§1.15,2.3 supplies the geometric comparison; PR94 remains uncertified. |
| 4.6 compact quotients/quaternion norms | Khayutin lines 1001–1044, Proposition 3.6/proof arXiv v3 pp. 24–25: compact square quotient and distinct quadratic-character kernels are the input to the explicitly stated abstract Fourier deduction. Voight lines 9749–9763, §14.7 pp. 225–226 independently confirms the norm-image formula with positivity precisely at ramified real places; this does not certify the cited PRR page numbers. |
| 5.1 GL₁/logarithmic tori | Arthur lines 705–731, §3 p. 15; CG lines 3567–3593, §8.2 pp. 78–79. The logarithmic torus has dimension r₁+r₂−1. AA supplies the missing compact-at-infinity convention and keeps the class-group contribution rather than copying CG's exponent-quotient claim. |

Additional text checks: BHV lines 12992–13040, Appendix B.1 pp. 343–345, support compact lifts, surjectivity of averaging and the modular compatibility criterion after inversion; its manuscript pagination matches the README. Milne lines 1483–1525, Theorem 3.3 and Proposition 3.5 pp. 33–34, support arithmetic covolume and neatness. DudasMichel lines 1239–1279, Propositions 7.12 and 7.14 pp. 27–28, were checked against finite-field values. Voight lines 6993–7005 and 7128–7134 verify the Hurwitz unit order and ideal-principality claims (numbering agrees with the cited edition; the fetched author copy is a later revision). 

**Pinned-library audit.** Pins inspected: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Thirteen object-level entries record declarations opened:

| Object | Pinned file/declaration and what it actually supplies |
|---|---|
| Restricted topology | `Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean:374,621`, `isOpenEmbedding_inclusion_principal`, `locallyCompactSpace_of_group`: uses open restricting subgroups and eventually compact ones; not Haar products. |
| Restricted units | `Mathlib/Topology/Algebra/RestrictedProduct/Units.lean:84`, `RestrictedProduct.unitsEquiv`: algebraic unit comparison, not a pushed-measure identity. |
| Infinite-product logarithm | `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:83`, `Real.rexp_tsum_eq_tprod`: requires positivity and summability of logs. These need verification. |
| Modular character | `Mathlib/MeasureTheory/Group/ModularCharacter.lean:45,130`, `modularCharacterFun`, `modularCharacter`: the scalar of right-translation pushforward of left Haar. At upper diag(2,1), this is 2. |
| Index/volume | `Mathlib/MeasureTheory/Group/Measure.lean:285`, `MeasureTheory.Subgroup.index_mul_measure`: finite index and measurable subgroup, left-invariant measure; H.index·μ(H)=μ(G). |
| Finite-factor splitting | `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean:73`, `awayDecomposition`: an actual group equivalence with finite factors split off. AA's new content is its measure clause. |
| Norm-one idele compactness | `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Compact.lean:126`, `IdeleClassGroup.isCompact_normOne`: the exact compact subgroup assertion; AA's new square quotient follows from its structure. |
| Reductivity | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,78`, `reductiveCommHopfAlgProperty`, its iff: smooth, geometrically connected, no connected normal smooth unipotent geometric subgroup. It is not the disconnected notion. |
| Identity component | `TauCeti/Algebra/AlgebraicGroup/Connected/Comultiplication.lean:220`, `identityComponentHopfIdeal`: finite type over an algebraically closed field; no automatic number-field descent. The docstring correctly omits the disconnected headline. |
| Adjoint weights | `TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100,191`, `Derivation.adjointWeightSpace`, `isInternal_adjointWeightSpace`: cotangent dual, finite/projective cotangent, specified split-torus coordinate map. AA's counit-derivation presentation requires the stated comparison. |
| Homogeneous quotient | `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:216`, `fppfHomogeneousQuotient`: sheafification of a coset presheaf; neither normality nor affine representability is part of this definition. AA adds the reductive affine quotient result. |
| Quaternion norm | `TauCeti/Algebra/Quaternion/NormForm.lean:78,84`, `QuaternionAlgebra.normForm`, `normForm_apply`: (x·star x).re, with the actual three-parameter quadratic form. In characteristic zero a,b≠0 exclude degenerate quaternion presentations in the kept theorem. |
| Character induction and analytic scope | `TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:82`, `indVirtualCharacters_eq_virtualCharacters_isElementary`; `Induction/Monomial.lean:81`, `FDRep.exists_character_eq_indClassFun_of_isNilpotent`: finite groups, algebraically closed characteristic-zero coefficients; the second also needs nilpotence and irreducibility. `TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:84,134` distinguishes square-cancellation from square-triviality and excludes 1 in the latter. |

**Ownership and supplier resolution.** Main was verified at `775563ef`. `roadmaps grep/show`, pins, supplied siblings and board packages were searched for Haar products, adelic points, Artin/Hecke germs, heights, Siegel sets, quotient measures and quaternion norms/classes. No namespace collision was found. Other open work was not audited.

The resolved contracts include:

- `TauCetiRoadmap/ReductiveGroupsPartII/README.md:509,644,686,749,958,1568,2577,5179,6230,6265,6308,6351–6405`: point topology, characteristic-zero and equal-characteristic chart bridges, Weil restriction, relative roots, derived ideals, Lang/Hensel, integral Iwasawa, Kneser–Tits and adjoint modulus. The named prototype declarations occur at Suggested.lean:124,175,329,1374,1487. AA's rational-character and adelic measure clauses differ from these local/algebraic suppliers.
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2502–2519,3330`, §§1.15,2.3; `Suggested.lean:1175`: torsors, sections, class sets and their base change. These are on main; the coordinate-comodule equivalence is the additional AA target.
- GlobalNumberFields layers 0,1,4,5,6,8: places/product formula, field weak approximation, finite/full adeles, idele norm and base change; AA does not re-own the additive or multiplicative base field carriers. Completed/RestrictedProducts supplies topology, not the restricted Haar construction.
- `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:448` Layer 9 supplies Cartan/Iwasawa theory; `RepresentationTheory/CompactGroups/README.md:205,318` supplies Haar probability/Peter–Weyl; `RepresentationTheory/InductionRestriction/README.md:661` supplies Brauer induction. Character-kernel weak limits are AA's additional compact-abelian theorem.
- `TauCetiRoadmap/GlobalQuadraticForms/README.md:544–690`, Layer 5, supplies Hasse–Minkowski isotropy. LocalFieldsRamification Layer 0 begins at README:59. ClassFieldTheory layers 11–12 and IntegralLattices 2F–2G exist on main. Their arithmetic inputs are consumed, not new AA targets.
- `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:1357–1372` is the height owner, R02. Board searches of height-related packages did not turn it into a pinned declaration.
- `TauCetiRoadmap/FuchsianOrbifolds/README.md:193,215,286,311`, main layers 0,1,4,5, supplies the quotient surface, cusps and holomorphic degree theory. Main contains no reverse AA dependency. Its new Part II and its open revision are not substituted for this main contract.
- `Completed/Chebotarev/README.md:216–230` supplies cyclotomic-character continuation/nonvanishing, explicitly stopping short of general Hecke theory. `Completed/ArithmeticDirichletSeries` supplies weights and analytic machinery. The LFunctions contract requires R03 rather than a fictitious generalization of these inputs.
- R01 requires one-way quaternion ownership. FunctionFieldArithmetic extends reduction to positive characteristic; OrthogonalTamagawaAndLatticeMass and BorelRegulators consume AA for their applications. They do not already supply its general number-field theory.

No good-prime bypass or computational algorithm was found. Ramified/dyadic and number-field cases remain in scope. No gap waives R02. Most of the 59 citation leads are own/supplier target names; the three pinned-height claims are unresolved.

**Gate and dependency output.** The worker's exact summary at this head is:

```text
gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=8 sorry-data=0 sorry-examples=0 residue=9 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=7 metadata=0 stray-files=0 dirty=0 outside-folder=9 source-material=0 build=0 FAIL
```

The requested dependency check was rerun with `--movable` and produced:

```text
not movable: AdelicAlgebraicGroups consumes LocalFieldsRamification (#328) and is consumed by OrthogonalTamagawaAndLatticeMass (#132), which comes first: moving AdelicAlgebraicGroups after LocalFieldsRamification would put a supplier after a consumer, a cycle through AdelicAlgebraicGroups
UPWARD: AdelicAlgebraicGroups (#31) -> ClassFieldTheory (#262) at README lines [109, 2316, 3960, 4928]
UPWARD: AdelicAlgebraicGroups (#31) -> GlobalQuadraticForms (#317) at README lines [3960, 4824, 4928]
UPWARD: AdelicAlgebraicGroups (#31) -> IntegralLattices (#242) at README lines [122]
UPWARD: AdelicAlgebraicGroups (#31) -> LFunctions (#301) at README lines [110, 260, 505, 2316]
UPWARD: AdelicAlgebraicGroups (#31) -> LocalFieldsRamification (#328) at README lines [119, 4399, 4414, 4430, 4465, 4928]
UPWARD: AdelicAlgebraicGroups (#31) -> RepresentationTheory (#180) at README lines [106, 259, 1371, 1426, 2032, 2316]
CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds
depcheck: 163 roadmaps, 1181 edges, 7 problem(s)
```

R03 addresses the genuine upward new-roadmap edge. The other five UPWARD lines concern existing main suppliers; the Fuchsian CYCLE line uses an inadmissible open revision of an existing roadmap. Those six diagnostics are reported as apparent false positives against this job's main-supplier rule, with their exact lines above; they require board reconciliation, not re-planning those suppliers here. The gate still fails. R01 is an additional manual graph finding. No tooling or order file was edited.

## Not verifiable

- **PR94**, Platonov–Rapinchuk (1994): Theorems 2.2,6.4,6.6,7.8,7.12, Proposition 6.17, §4.4 and the cited proof routes. The sources service found bibliographic/landing pages, not a legal readable book. Local H¹ vanishing, the full simply connected Hasse route and its approximation deduction are therefore not source-certified here.
- **PRR**, Platonov–Rapinchuk–Rapinchuk (2023): the service reached the Cambridge book landing page, not full text. Theorems 1.34,3.2,3.12,3.60,3.64,3.71,4.12,4.20,5.22,5.24, Lemma 3.63 and the other cited page ranges remain locator-only. Independent checks above do not certify those theorem/page numbers or every step of the number-field arithmetic-closure proof.
- **BHC**: the legal Heidelberg institutional copy was fetched, but the article is an image-only scan and this worker has no usable OCR/PDF text. §§1.1,1.6–1.9,3.8,5.3–5.4 (pp. 486,489–492,501,504–506) were not text-verified. Borel's separate statements and the real small-dimensional computations do not substitute for reading these proofs.
- **Platonov** and **PlatonovAddendum**: Mathnet's supplied URLs yielded bibliographic HTML, not readable English article text. Propositions 3.2–3.3/§3.4, pp. 1144–1145, and addendum §§1–2, pp. 784–785, remain uncertified, particularly the native-field arithmetic-closure and distinct-completion steps.
- **Schneider**: the service marked the Springer book uncertified/paywalled. The local Lie-group locators are retained as locator-only citations and are not requested again.
- **Edition limits**: Khayutin was read in the cited arXiv v3, not independently against Annals pagination. Voight's open author copy has the cited theorem numbering, but the 2021 page layout was not independently compared. Orr v6 and the specified BHV manuscript were read in the exact versions named.

OrrSchnell, BHV and Voight were resolved. No source text was copied into the repository or report.

## Source issues

- **Misprint** in Conrad at Example 2.2, preprint p. 3: the source says the larger coefficient ring is closed or open in the smaller one; it should be the smaller ring in the larger; affects nothing.
- **Misprint** in Arthur at §5, printed p. 25: the source says left Haar density is the positive exponential of twice rho times right Haar; it should be the negative exponential; affects nothing.
- **Misprint** in DudasMichel at Proposition 7.14, printed p. 28: the source says a finite torus order is the determinant of Frobenius minus identity; it should be its absolute value, giving 3 rather than −3 for the nonsplit rank-one torus over 𝔽₂; affects nothing.
- **Misprint** in Rosengarten at the local L-factor definition preceding (3.4), arXiv p. 25: the source says the local Artin L-factor is the determinant; it should be the reciprocal determinant, consistent with its pole and convergence-factor conventions; affects nothing.
- **Misprint** in MarzecNeururer at Remark 5.12, printed p. 62: the source says the m-th Frobenius character value uses the trace of the first power; it should use the trace of the m-th power; affects nothing.
- **Misprint** in Khayutin at proof of Proposition 3.6, arXiv p. 25: the source says the quadratic quotient torus is isotropic over ℚ; it should say anisotropic, as required for the asserted compact adelic quotient; affects nothing.
- **Error** in Gordon at the discussion following (48), arXiv p. 32: the source says the uncorrected gauge product gives integral units infinite volume; it should say the partial products tend to zero, so they do not define Haar measure; affects nothing.
- **Error** in CG at §8.2, arXiv p. 79: the source says all components form an exponent-pⁿ ray-class quotient; it should retain the class-group contribution, already present when the auxiliary set is empty; affects a stated result.
- **Error** in BKT at Definition 2.5 and Proposition 2.7, arXiv pp. 8–9: the source says varying maximal compacts are allowed in the Siegel comparisons; it should fix the same maximal compact throughout; affects a stated result; corrected in print at BKTErratum §1.1, p. 1.
- **Error** in BKT at §4.5 after Definition 4.11, arXiv p. 18: the source says the product bound in another ordered basis preserves reducedness uniformly; it should allow sorting that basis, since diag(t,1) violates the ordering bound as t grows; affects the proof.
- **Error** in OrrSchnell at Theorem 1, printed pp. 1231–1232 (also Orr v6 Theorem 4.1, p. 15): the source says the full torus intersection equals the subgroup split torus; it should at least weaken this to inclusion, since SO₂ intersects every SL₂ maximal split torus in ±I; affects a stated result.
- **Gap** in Voight at proof of Lemma 14.7.5, open author edition p. 226: the source says to choose a nonsquare residue unit under characteristic not two; it should treat dyadic residue fields separately, since every nonzero element of 𝔽₂ is a square; affects the proof.
