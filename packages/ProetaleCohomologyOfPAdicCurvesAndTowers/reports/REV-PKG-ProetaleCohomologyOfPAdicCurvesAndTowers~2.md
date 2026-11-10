# Review of ProetaleCohomologyOfPAdicCurvesAndTowers (package, round 2)

**Verdict:** needs changes

20 findings: 15 blocking (P1/P2), 5 P3. The package is repairable. Its Lean acceptance file elaborates, but that does not validate the mathematical prose. No author file was changed. References to `README.md` and `Suggested.lean` below mean `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`.

## Previous findings, checked first

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, missing field restriction | Repaired | README.md:863 now says “for `F ≠ ℚ_p`, `π` supercuspidal”. CDN23 line 955 supplies the restriction; lines 1034 and 1532 show the dependency. The new negative control at line 868 gives a nonzero Hom for `F = ℚ_p`, whereas the restricted assertion gives zero only outside that field. |
| F02, supplier identifiers | Partly repaired | README.md:29 now cites “§1.5 (*the simplified Stein and affinoid diagram*)”; line 108 names the finite-piece comparison in prose. The previously listed eight suppliers' replacement sections exist. The remaining MP and SZ labels are stale against today's package/head, and a downstream ownership description is obsolete: R17. |
| F03, arithmetic components | Repaired | README.md:856 says “`𝔽_p` for `K = F` ... and `𝔽_p²` for `K ⊇ F₂`”. The two geometric height classes are exchanged by Frobenius: invariants of `𝔽_p²` are the diagonal `𝔽_p`. Related disconnected-space applications elsewhere still fail: R05. |
| F04, Jacobian compatibility | Partly repaired | README.md:529 correctly says the remark “says only that Théorème 7.9 could be deduced from it”. Line 545 moves the comparison to the hypotheses of §4.9 and cites §R07.2.28. The newly supplied argument and Check have domain and normalization defects: R08–R10. |
| F05, stale pin hash | Repaired | README.md:74 says “Nothing in the pinned Tau Ceti concerns rigid or pro-étale cohomology”. The obsolete hash is gone; the quaternion Steinberg file is unrelated to representations. |
| F06, missing Katz–Messing entry | Repaired | README.md:117 cites “KM74, Theorem 2”; line 912 and sources.toml:344–358 record that work once, as uncertified. No duplicate key was introduced. |

The repair report marks none of these “not actionable in this package”. R08–R10 assess new repair text; they do not reinstate the earlier review's inadequate uniqueness argument. I also searched the rest of the package for each repaired pattern. Earlier table rows were reused only where they actually contained computations; the 15 seeded targets, all changed mathematical passages, and the remaining claims were read again.

## R01 (P1) — The Weil–Deligne multiplication has the inverse weight

**Location:** README.md:57 and 477: “`(λ₁ + p^{deg g₁}λ₂, g₁g₂)`”, together with “`Ng = p^{deg g} gN`”.

**Claim:** These describe the same semidirect-product representation.

**Witness:** For `N(e₁)=e₀`, `Φ=diag(1,p)`, degree one, `ΦNΦ⁻¹=p⁻¹N`; the displayed multiplication instead forces `ΦNΦ⁻¹=pN`. At `p=2`, the coefficients are `1/2` and `2`.

**Repair:** Change the additive action in the group law to `p^{−deg g₁}` everywhere; retain `NΦ=pΦN` and geometric Frobenius of degree `f`. State that the additive subgroup acts by `exp(λN)`. Recompute the two-term witness at line 483. The corrected multiplication gives `Φ exp(λN) Φ⁻¹=exp(λN/p)`, exactly the required relation. CDN-CURVES line 4431 and line 4437 contain the same inconsistency; copying its formula does not fix it. PadicHodgeTheory §5.3, `TauCetiRoadmap/PadicHodgeTheory/README.md:1027` at #1062, independently gives inverse scaling on geometric Frobenius.

## R02 (P1) — The dual of the Steinberg quotient retains the relations

**Location:** README.md:180: “`Sp_J(L)^* = lim_n LC(X_{n,J}, L)^*`”.

**Claim:** Every distribution on the flag variety is a functional on its Steinberg quotient.

**Witness:** For `d=1,J=∅`, the right side contains `δ_a`, with `δ_a(1)=1`. Constants vanish in `LC(ℙ¹(K),L)/L`, so `δ_a` cannot descend; `δ_a−δ_b` does descend.

**Repair:** Write the dual as the annihilator of the relation submodule inside `LC(X_J,L)^*`. For the inverse-limit presentation, put `V_n=image(LC(X_{n,J},L)→Sp_J(L))` and use `lim_n V_n^*`. Keep the nuclear-Fréchet conclusion, with these finite-dimensional stages. Add the mass-one/mass-zero test. For `J=Δ` the relation submodule is zero and the answer is still `L`. CDN-STEIN §5.2.2, line 1936, has this erroneous natural identification too.

## R03 (P2) — The imported tower and the stated level use different uniformizers

**Location:** README.md:775: “`M_n ... the Drinfeld levels of EndoscopicTransferAndUnitaryTraceComparison §12.4`” and “`Ǧ_n = 1 + ϖ_D^n O_D`”.

**Claim:** Supplier level `n` is the cover killed by this `Ǧ_n`.

**Witness:** #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4627`, indexes by `ϖ_F^m`, hence `ϖ_D^{2m}` in rank two. At `q=2,m=1`, the deck-group orders are `12` and `3`, respectively.

**Repair:** Introduce the explicit dictionary `M_{2m}=M_Dr,m` and define odd level `n` as the quotient of supplier level `m=⌈n/2⌉` by `(1+ϖ_D^nO_D)/(1+ϖ_D^{2m}O_D)`. Transport actions, descent and central quotient through this dictionary. Apply it to §§7.1–7.8, especially the level-one negative control. At `q=2,n=1`, quotienting the order-12 group by its order-4 subgroup gives order 3. This preserves all levels. CDN23 line 181 uses `ϖ_D`-levels. The same distinction is already explained by `packages/PadicLocalLanglandsForGL2QpPartII/README.md:46` (a consumer, not a proposed supplier).

## R04 (P2) — Supercuspidality needs absolute irreducibility

**Location:** README.md:775 and 815: “`WD(M)` is irreducible”; the route then uses “`End_{(φ,N,G_F)}(M) = L`”.

**Claim:** Irreducibility over any finite coefficient field `L` implies supercuspidality and scalar endomorphisms.

**Witness:** Over `L=ℚ_p`, take trivial inertia, `N=0`, and geometric Frobenius `A=[[0,p],[1,0]]`. Its polynomial is `X²−p`, its slopes are `1/2,1/2`, but `End=L(√p)`, not `L`.

**Repair:** Require `WD(M)` absolutely irreducible, with scalar endomorphisms, in the Layer 7 convention and all its uses; permit coefficient extension when needed. The witness splits into two unramified characters over `L(√p)` and is not a discrete-series parameter for Jacquet–Langlands. Its exclusion is necessary even with slope `1/2`. The named supplier already makes this distinction: #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:1058`, and its explicit nonsplit-coefficient Check at line 1066. Retain genuine absolutely irreducible slope-`1/2` examples in §§7.4–7.5.

## R05 (P1) — A connected-curve exact sequence is applied to disconnected towers

**Location:** README.md:803 applies “the diagram of §4.2” to `M_{n,C}^ϖ` and `M_{n,C}`; line 808 says a “non-constant” function has a non-étale exponential class.

**Claim:** The quotient by a single copy of `C` and the stated negative control work for these disconnected spaces.

**Witness:** On `M_{0,C}^ϖ=Ω⊔Ω`, let `f=(0,1)`. It is nonzero in `O/C`, but `df=0` and `exp(f)=0`. The zero class is étale.

**Repair:** Extend §4.2 componentwise, replacing `C` by `H⁰_dR(Y)=∏_{π₀(Y)}C`, with the product topology. Its connected statement is valid under line 277's convention; line 458's disconnected example must explicitly invoke the extension. In §7.3 use “not locally constant” and state bounded-function constancy componentwise for the proper-component semistable models in §7.2. Qualify line 807: the central quotient gives two copies at level zero, the full tower gives `ℤ` copies. Then `(0,1)` is zero in the correct quotient, while a nonconstant function on one component is not. This also supplies the precise vanishing of locally constant functions after taking the supercuspidal multiplicity in §7.5.

## R06 (P2) — De Rham comparison does not uniquely determine Hyodo–Kato structure

**Location:** README.md:459: “uniqueness of the Hyodo–Kato structure with given de Rham comparison on finite-dimensional pieces”.

**Claim:** Equal scalar-extended de Rham spaces identify the two diagrams canonically.

**Witness:** `D₀=(C̆,φ=σ,N=0)` and `D₁=(C̆,φ=pσ,N=0)` both base-change to `C` with an identity comparison. Their slopes are `0` and `1`; they are not isomorphic isocrystals.

**Repair:** Replace this uniqueness argument by a named comparison of the two Hyodo–Kato complexes, respecting `φ,N,ι_HK` and the syntomic period map, constructed on a common semistable model and then descended. State the model/common-domain hypotheses and inputs in *Needs*. A bare vector-space comparison must be rejected by the two rank-one examples. The equality of diagrams can remain a target; it cannot follow from the asserted uniqueness. CstConjectureForDaggerVarieties §1.5 (#1759, `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:439`) supplies a diagram, not this uniqueness principle.

## R07 (P1) — The declared class of base rings excludes its period-ring examples

**Location:** README.md:281: “over a complete valuation ring `R` ... (in practice ... `A_inf` or `A_cris`)”.

**Claim:** These constructions over valuation rings apply to the listed period rings.

**Witness:** In `A_inf`, `p` and `[p^♭]` are incomparable for divisibility. Reduction modulo `p` excludes `p∣[p^♭]`; applying `θ₀` excludes `[p^♭]∣p`.

**Repair:** State the actual complete topological `O_C̆`-algebras allowed for each ghost-circle/leg construction, specifying their topology and convergence conditions; do not call `A_inf` or `A_cris` valuation rings. Keep the valuation-ring cases as examples. Match the general base-ring setup of CDN-CURVES §3.6.1, and verify both `O_C` and `A_inf` are admitted with their intended completions. The divisibility witness then ceases to be a required valuation-ring property.

## R08 (P3) — The Tate-curve negative control asserts false nonextension

**Location:** README.md:537: “its `p`-divisible group does not extend to `O_C`”.

**Claim:** An elliptic curve without good reduction cannot have its generic p-divisible group extended over `O_C`.

**Witness:** Over algebraically closed characteristic-zero `C`, `E[p^∞]≅(ℚ_p/ℤ_p)²` after choosing a compatible basis. The constant étale p-divisible group of height two extends this group over `O_C`.

**Repair:** Replace nonextension by the precise fact used: the identity component of the Tate curve's Néron model has p-divisible group `μ_{p^∞}` of height one, whereas `E[p^∞]` has height two. Its universal cover has Dimension `(1,1)`, versus `(1,2)` for `Ĵ`; it therefore cannot supply the abelian-scheme comparison. Distinguish an arbitrary extension from extension as the p-divisible group of a good-reduction abelian model. This repair accepts the constant extension witness and preserves the intended dimension test.

## R09 (P2) — Universal-cover rigidity is applied outside its domain

**Location:** README.md:529: “its invariance under the thickening `O_C → O_C/p` is §R07.2.26”.

**Claim:** The cited nilpotent-thickening result directly defines/evaluates `G̃(O_C)` and proves that equality.

**Witness:** #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4126`, requires `p` nilpotent and a nilpotent kernel. Here `p^m≠0` for every `m`; the kernel `(p)` is not nilpotent.

**Repair:** Define evaluation on the p-adically complete ring as `lim_m G̃(O_C/p^m)`, and prove the extension of the point functor agrees with the sequence description of `Ĵ`. Apply §R07.2.26 to the finite thickenings only: in `O_C/p^m`, `(p)^m=0`; the transition maps are isomorphisms on universal covers, so the limit is `G̃(O_C/p)`. Cite §R07.2.25's `Nilp_R` domain explicitly. This gives the proposed equality by a valid argument without claiming `O_C` lies in that domain.

## R10 (P2) — The added logarithm proof conflates covariant realizations

**Location:** README.md:545: “`Lie E(G) = D(G)` ... through which `D(𝒥[p^∞])` is the crystalline `H¹`”.

**Claim:** The raw covariant `F`-module used for `F=p` fixed points is simultaneously the Lie realization and the cited supplier's crystalline `H¹`.

**Witness:** #849, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2152` defines `D` contravariantly; line 2257 identifies `Lie E(G)` with its dual. For `μ_{p^∞}`, raw covariant `F=σ`, while the normalized Lie isocrystal has `φ=p⁻¹σ`.

**Repair:** Keep three explicitly named objects: `D_contra=H¹_cris`, `D_raw=D_contra^∨(−1)` with `F`, and `D_norm=D_raw(1)=D_contra^∨` with `φ=p⁻¹F`. Identify the logarithmic Lie realization with `D_norm`; convert its `φ=1` condition to `F=p` on `D_raw`. Add the actual comparison of universal-vector-extension logarithms as a target, including compatible lifts; do not assert that two independently chosen lifts literally agree. The `μ` test then gives `(B_cris^+)^{σ=p}` on both routes, whereas using raw `F` directly as the Lie Frobenius gives `ℚ_p`. Cite #879 §§R07.2.20, R07.2.28 and #849 §§A4.2, A4.CR.7.2 with their different conventions. The desired final period isomorphism is not refuted; the newly claimed supplied route is insufficient as written.

## R11 (P2) — The fixed-point theorem is deliberately narrowed to a convenient carrier

**Location:** README.md:719: “semistable because that is the generality in which ... supplies `AΩ_𝔛`”; it acknowledges the source's flat-model generality.

**Claim:** It suffices to plan the semistable case of the general fixed-point theorem.

**Witness:** CDN-DUKE Theorem 2.9, lines 358–373, allows every flat formal model with smooth generic fibre. For `p≥5`, `Spf O_C⟨x,y⟩/(y²−x³−p)` has smooth generic fibre and cuspidal, nonsemistable special fibre.

**Repair:** Add the general flat-formal-model construction `Lη_μ Rν_*A_inf` and its fixed-point comparison at this target, explicitly identifying the semistable specialization with AInfCohomology §AI.6.2. Retain the source's hypotheses. On the example, the equations for a generic singular point force `x=y=0`, contradicting `p≠0`; the special fibre is a cusp. The repaired target includes it. No semistable-only supplier gap or narrowing of the headline substitutes for this general library result.

## R12 (P2) — The period-bound route consumes stronger uniformity than its contract

**Location:** README.md:598: “a universal `N = N(r)`”, attributed to CohomologyComparisonsPartII and the formal-comparison gap.

**Claim:** The stated supplier contract directly gives a bound independent of ramification, the prime and dimension on geometric formal pieces.

**Witness:** #1364, `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:572`, gives `A(e,p,r)`; its refined bound requires enough roots and retains dimension dependence at `p=2`. The package's gap requests exactly `A(e,p,r)`.

**Repair:** For the rational comparison route, use the contracted `A(e,p,r)` at fixed arithmetic base and explain the geometric base-change/gluing step and its required uniformity. If the stronger geometric `N(r)` assertion is retained, make it a separate explicit target with the cyclotomic/base-change argument and the additional formal comparison it consumes; do not label it supplied by the existing gap. Quantifier test: at fixed `e,p,r`, one exponent controls all charts and `n`; allowing `e` to vary does not preserve that quantifier. At `p=2,r=2`, the modified lattice remains `(1/8)ℤ₂(2)`. CDN-STEIN line 2201 states the stronger geometric result, but is not an ownership contract for its missing proof input.

## R13 (P2) — The five-term finite-presentation theorem has two owners

**Location:** README.md:840: “and that in an exact sequence `A → B → C → D → E` ... `C` is finitely presented”.

**Claim:** This roadmap must prove the generic five-term finite-presentation criterion.

**Witness:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:510–514`, §0.7, already owns CDN23 Lemme 2.9 for exactly the torsion `G′` representations used here.

**Repair:** Import §0.7 for the tower application, remove the generic five-term theorem as an owned target, and keep the genuinely new cpcf-sheaf two-out-of-three theorem. If retaining an abstract abelian-category observation, label it as the elementary argument in the proof, not another library target. For `A=B=0`, the argument is the supplier's kernel closure; for `D=E=0`, its cokernel closure. No mathematical capability is lost by importing the existing owner. This is a board-package overlap, not an unlisted open-PR conflict.

## R14 (P3) — The Tate pattern Check is not fine

**Location:** README.md:312: “a circle ... subdivided into two edges”.

**Claim:** This is a curve pattern of the kind used in §§2.2–2.3.

**Witness:** Its two components meet at two nodes. Line 277 permits at most one intersection per pair; line 318 excludes a loop with two vertices. CDN-CURVES lines 1689–1692 impose that restriction.

**Repair:** Use three vertices and three edges of positive rational lengths summing to `v_p(q)`, or explicitly label the two-vertex object non-fine and then refine it before applying reconstruction. For three vertices, each pair meets once, `rank H¹(Γ)=1`, and monodromy is still multiplication by the total length. Keep the two-vertex polygon as a negative control.

## R15 (P3) — The similarity Check omits its Tate twist

**Location:** README.md:505: “both sides ... polynomial `X² − aX + q`”.

**Claim:** This is the Frobenius polynomial of the two `(1)`-twisted sides of §4.6.

**Witness:** For `E/𝔽₂: y²+y=x³`, `#E(𝔽₂)=3`, so `a=0`. Untwisted polynomial: `X²+2`; after `(1)`: `X²+1/2`.

**Repair:** State `X²−(a/q)X+1/q` for the twisted geometric-Frobenius action, and explicitly distinguish the untwisted polynomial. Both sides then agree with the section's normalization. Keep `N=0`. CDN-CURVES Theorem 8.12, line 4542, twists both sides; it does not justify dropping the twist in the Check.

## R16 (P2) — An affinoid-disc exhaustion is not the asserted semistable model

**Location:** README.md:579: “the Stein smooth model given by the dagger discs `|T| ≤ |ϖ|^{−m}`”.

**Claim:** These standard disc models form a model meeting §5.1's proper-component definition.

**Witness:** The standard one-variable disc model has special fibre `𝔸¹_k`, with `H⁰(O)=k[T]`, not a proper component. Moreover the transition `T_m=ϖT_{m+1}` reduces to the zero map, not an open immersion.

**Repair:** Replace this by an explicit semistable formal model with proper special-fibre components and an actual tube exhaustion, or move affine-space cohomology to the more general Stein/dagger comparison and say it is not an example of this particular model construction. Keep the affine-space result; do not infer its model from a generic-fibre exhaustion. Test both properness and the special-fibre gluing maps. In dimension one a suitable model uses a chain of proper rational components, not gluing the standard affine disc reductions as open subschemes.

## R17 (P3) — Remaining supplier and consumer labels are stale

**Location:** README.md:35, 44, 130, 846–873 and 884–886: `MP.0`, `MP.2`, `SZ.0`, `SZ.6`, and the old Part II ownership description.

**Claim:** These are the present locations and ownership relationships.

**Witness:** The current Modp package has numbered §§0.3–0.7 and 2.4–2.6, not MP labels; #1757 has §§0.2 and 6.2, not SZ labels. The Part II package imports §§7.1–7.5 here.

**Repair:** Replace MP citations with their actual current subsections: finite presentation §0.3, calculus §0.4, coherence §0.5, five-term §0.7, category `C` §2.4, ordinary Banach approximation §2.6. Replace SZ citations by §§0.2 and 6.2 after matching their uses. Rewrite the Part II consumer bullet to describe the existing import/specialization, not re-proving old §§3.4–3.5. Witness locations: `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:401,438,457,510,845,898`; #1757 `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:240,799`; `packages/PadicLocalLanglandsForGL2QpPartII/README.md:37,564`. The old design files explain the stale labels but do not make them current package citations. This is a numbering repair with existing mathematical suppliers, not an unowned prerequisite.

## R18 (P3) — Definition APIs, Checks and two declaration docstrings are missing

**Location:** README.md:206, 318 and 392; Suggested.lean:62 and 88.

**Claim:** Each definition has an API and at least three discriminating Checks, and each Lean declaration has a mathematical docstring.

**Witness:** §3.3 has two Check bullets (397–398) for its complex and regulator; §2.3 has no API list; §0.5 never defines the boundedness condition on its measures. Both named helper theorems lack docstrings.

**Repair:** Add the missing API lists and actual definitions, and at least three discriminating Checks per defined object. For the regulator include trivial constant symbols mapping to zero, the displayed nonzero differential, and multiplicative-to-additive compatibility on two units, rejecting a rescaled differential. Define measures as bounded distributions and test Dirac mass, a bounded mass-zero difference, and an unbounded compatible distribution. For adoc gluing include the source/target and coordinate action of each gluing map: multiplying an algebra homomorphism itself by a unit (line 323) does not preserve `1`; compose with a coordinate-rescaling automorphism instead. Add mathematical docstrings to `parabolic_mono` and `steinbergRelations_le_comap`. These proved helpers support the retained definitions and need not be deleted as sorried padding.

## R19 (P2) — Comparison locators are narrower than the claims

**Location:** README.md:318: “the de Rham cohomology ... is computed by the Čech complex ... (CDN-CURVES Proposition 3.20)”.

**Claim:** The cited proposition provides an all-degree derived comparison.

**Witness:** CDN-CURVES lines 1926–1929 state `H¹_dR(Y) ≅ H¹_dR(Y^ado)` and independence of the choices; they do not state a quasi-isomorphism in every degree.

**Repair:** State the degree-one comparison actually used by Layers 3–4, with its cocycle map and independence, or separately own and justify the all-degree extension using the required acyclicity. Do not attribute that extension to Proposition 3.20. On an annulus the corrected statement still computes `H¹=C·dlog T`; its `H⁰=C` calculation is a separate elementary statement. This repair retains all the generality of the cited result. Also repair §1.1(a), README.md:228: CDN-CURVES Remarque 0.2(ii) addresses affinoid-curve degree one, not every degree on an arbitrary qcqs analytic adic space. Cite the general site comparison and its qcqs localization argument explicitly, or mark that general argument as the target rather than attributing it to the remark.

## R20 (P2) — Raw and p-normalized monodromy are identified without a ramification adapter

**Location:** README.md:465 promises agreement “compatibly with `φ`, `N` and `ι_HK`”; line 586 imports the uniformizer-based model complex, while line 49 fixes the p-based period coordinate.

**Claim:** The model and geometric monodromy operators agree unchanged for ramified bases.

**Witness:** Take `e=v_π(p)=2` and a Tate curve with parameter `q=π²`. The model's uniformizer length is `2`; the geometric graph length is `v_p(q)=1`. Thus the two raw monodromy coefficients differ by two.

**Repair:** Name the raw model operator and the geometric p-normalized operator separately and insert `N_p=N_raw/e`, with the sign adapter dictated by the chosen comparison convention. Transport the period coordinate and uniformizer-change formula simultaneously. CDN-STEIN lines 327–328 use the π-coordinate with `N(u_π)=−1`; the p-normalized operator gives `N_p(u_π)=−1/e`. #1064, `TauCetiRoadmap/CohomologyComparisons/README.md:802–819`, explicitly distinguishes these operators and computes the signed transport. #857, `TauCetiRoadmap/CrystallineCohomology/README.md:313–315`, uses its own positive Taylor convention. State the adapter rather than identifying the conventions by name. For `q=π²,e=2`, division by two gives coefficient1, agreeing with §0.2; for `e=1` it is the identity. Add this ramified Check in §§4.3 and 5.2 and use the normalized operator in §§5.4–5.5's p-based period tensors.

## Verified sound

### Scope, checks performed and their limits

Read the 912-line README, all 122 lines of Suggested.lean, metadata, all 20 manifest entries, the three declared gaps, the previous review and its repair report. Reviewed the 50 numbered subsections, including all 15 sampled targets and the added Jacobian material. The report below records computations for the sample, headlines and affected passages; it is not a claim that finitely many examples prove the other assertions.

The scope is a new general roadmap, not a revision of an existing roadmap on main. Main's AdicEtaleGeometry and AdicSpacesPartIV were read as shape comparisons. No algorithmic deliverable, forbidden supplier, `set_option`, `lemma`, sorry-valued data, placeholder proposition, machine path or PR number was found in the package's mathematical files. Statements are paraphrases; no copied source passage was found. The layer dependency chain is mathematical: coefficient and representation objects precede patterns; patterns precede curve comparisons; curve/Stein results precede half-spaces and towers. The named source programme in the Summary is not used to justify the order. R11 is the explicit generality shortcut; R13 is the ownership duplication. Every layer has Examples and Dependencies. Definition-level completeness has the defects in R18.

The manifest parses, has 20 unique work identifiers (15 certified cache records, 5 settled uncertified records), and covers the works listed in References. No new source was required or fetched. The sampled texts are the versions recorded in the manifest; page numbers below refer to those cached versions unless a printed journal page is explicitly given. No new missing-reference request was created.

### Lean acceptance test, signatures and padding

Ran the requested `lake env lean` on the package's Suggested.lean from the pinned content checkout: **exit 0; only warning: declaration uses sorry at line 116**. There are no Tau Ceti imports requiring a build. Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

A scratch copy with `#check @name` for all eight declarations also elaborated, with only that warning. The signatures agree with their README descriptions and the supplied signature ledger; no section hypothesis disappeared and no change was needed. The finite-extension headline explicitly carries `Fact p.Prime`, `NontriviallyNormedField K`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional ℚ_[p] K`, `Field A`, and `CharZero A ∨ CharP A p`. Its simple carrier definitions are legitimately more general than the theorem.

| Declaration group | Signature/definition test | Computed result |
| --- | --- | --- |
| `flagSubspace` | `n=0`; `n=2,m=0,1,2,3` | zero carrier; respectively `0`, span of first coordinate, `K²`, `K²`. No out-of-range coordinate is evaluated. |
| `parabolic`, `parabolic_mono` | `d=0`; `d=1,J=∅,Δ`; inclusion | `GL₁`; upper triangular subgroup, `GL₂`; `B≤G`. Reverse inclusion fails on the coordinate-swap matrix. |
| `translation` | nonabelian `S₃`, `g=(12),h=(23)` | `(g·(h·f))(x)=f(h⁻¹g⁻¹x)=((gh)·f)(x)`; `g⁻¹h⁻¹` would give a different three-cycle. |
| `steinbergRelations`, `steinbergRelations_le_comap` | `d=1,J=∅`; `J=Δ`; equivariant projection | relation subspace is constants; then zero; translating a pullback is the pullback of the translate. |
| `generalizedSteinberg` | `d=0`; `d=1,J=∅`; zero coefficient ring | `A`; `LC(ℙ¹(K),A)/A`; zero module. The zero ring is excluded from the irreducibility theorem by `Field A`. |
| `generalizedSteinberg_isIrreducible` | three one-tactic scratch probes | `simp`: no progress; `rfl`: incompatible simple-order goal; `infer_instance`: fails to synthesize irreducibility. The library near-matches only characterize irreducibility; none is a one-lemma proof of this representation's irreducibility. |

There is exactly **one** sorried theorem, so the padding probe covered every sorried declaration. It is a genuine deep theorem, not a README Check. The two proved helper theorems are needed to form the actual quotient and its action; R18 concerns their absent docstrings. All eight own backticked identifiers resolve in Suggested.lean; no arbitrary carrier, free predicate or surrogate headline was inserted.

### Headline coverage

| README headline | Acceptance-file treatment | Pin evidence |
| --- | --- | --- |
| Generalized Steinberg irreducibility, §0.4(a) | Stated at line 116 | Native locally constant functions, representations, submodules and quotients suffice. CDN-STEIN Proposition 5.1, line 1918; GK14 Corollary 4.3, line 1300, covers type A in characteristic `p`. |
| Symbol/Kummer isomorphism, §2.4 | Named in module docstring | No rigid-analytic curve cohomology carrier; scheme étale cohomology is not that carrier. |
| Affinoid, dagger, Stein and proper curve diagrams, §§3.5, 4.1, 4.2, 4.7 | Each named in module docstring | Missing analytic curve cohomology, Hyodo–Kato and positive crystalline/semistable period rings. |
| Filtrations and Weil–Deligne similarity, §§2.5, 3.2, 4.3, 4.6 | Named in module docstring | `WittVector.Isocrystal` alone supplies neither geometric cohomology nor monodromy. |
| Jacobian period isomorphism and integration, §§4.8–4.9 | Named in module docstring | Missing Jacobian/universal-vector-extension carriers. |
| Semistable Stein fundamental diagram in every degree, §5.5 | Named in module docstring | Missing weak formal schemes, dagger and syntomic cohomology. |
| Half-space cohomologies, integral étale result and Dat complex, §§6.2, 6.4, 6.5, 6.9, 6.10 | Named in module docstring | Missing `Ω^d` as rigid space and its cohomology. Defining a topological set complement would not supply these. |
| Tower components, models, multiplicities, diagram, finite copresentation, non-admissibility, §§7.1–7.8 | Named in module docstring | Missing tower spaces, their cohomology and LL/JL correspondences. |

No further statable headline or stand-in was found.

### Seeded source audit

“Supported” here means that the displayed locator supplies the indicated statement with its hypotheses; it does not erase a separate finding in the section's Checks or supplier route.

| Target | Text read, exact locator and page | Outcome |
| --- | --- | --- |
| 0.5 | CDN-STEIN §5.4.1, lines 2046–2068, p.41, using Proposition 5.6 | Cocycle/dependence presentation and distribution quotient supported. SS91 and IS01 originals remain uncertified. R18 concerns the undefined measure condition/API, not the presentation. |
| 1.1 | CDN-CURVES Remarque 0.2(ii), line 135, p.4; CDN-STEIN Remark 1.4, lines 104–117, p.3; proof of Corollary 3.46, lines 1420–1428, p.29 | Curve comparison and open-disc warning supported. Its first locator is narrower than the general qcqs assertion: R19 requests an explicit locator/proof for the general site/localization argument. |
| 2.2 | CDN-CURVES §3.5.2, lines 1689–1722, p.42 | Fine-triangulation restriction and pattern data supported. R14 refutes the two-vertex example. |
| 2.3 | CDN-CURVES §3.1, lines 1213–1237, p.30; Theorems 3.17 and 3.19, lines 1748 and 1854, pp.43,45; Proposition 3.20, line 1926, p.47 | Reconstruction supported; degree-one comparison only at the last locator: R19. |
| 2.4 | CDN-CURVES §5.1.3, lines 2478–2491, p.59, Corollary 5.5 | The quotient by trivial compatible symbol sequences gives the Kummer group. Constants vanish as the README says. The source's preceding injectivity arrow is erroneous; see Source issues. |
| 4.3 | CDN-CURVES Theorem 8.9, lines 4477–4490, p.108; Remarque 8.2 and introduction Remarque 0.16 | The graph, component and residue pieces, including the Hyodo–Kato `(-1)` twist and products for infinitely many components, agree. The comparison with a chosen model needs the actual same-complex identification, not R06's false uniqueness. |
| 4.6 | CDN-CURVES Theorem 8.12, lines 4542–4561, pp.109–110 | Twisted similarity supported. The proof explicitly invokes all endomorphisms of component Jacobians, which explains the declared gap. R15 corrects the example's polynomial. |
| 5.2 | CDN-STEIN §3.1.2 and Proposition 3.12, lines 905–918, p.18; GK05 Theorem 3.4/Corollary 3.7 | The HK construction is supported for the stated class; R20 supplies the missing monodromy normalization and R16 corrects the affine-disc model. |
| 5.3 | CDN-STEIN Proposition 1.11, lines 183–197, pp.4–5; §3.3.1, line 1360, p.28; Corollary 3.46, line 1411, p.29; Proposition 6.1, lines 2193–2208, p.44 | Truncation `q≤r`, rationalization/gluing order and modified Tate lattice supported. R12 identifies the stronger bound not present in the formal supplier contract. |
| 6.1 | GK05 §§6.1–6.2, lines 1206–1257, PDF pp.31–32; CDN-STEIN §5.1, lines 1880–1898, pp.37–38 | General-dimensional model supported; GK05's `d≥2` range is supplemented by the explicitly imported half-plane model at `d=1`. |
| 6.5 | CDN-STEIN Theorem 5.13, lines 2169–2179, p.43 | Exact rows and closed vertical injections supported. `Ω^{r−1}/ker d` and closed `r`-forms are the correct terms; top-degree and degree-zero tests below agree. |
| 6.6 | CDN-STEIN Proposition 6.5/Corollary 6.6, lines 2270–2276, pp.45–46; Theorem 6.28, lines 2601–2616, p.52; GK05-RT Theorem 4.5, line 1770, printed p.381; GK07 Proposition 4.5, line 1164, printed p.373 and remark at line 1212, p.374 | Vanishing, reduction, logarithmic closedness and integral lattice supported with the stated strongly dominant/trivial coefficient specialization. The standard-model `H⁰(O)=O_K` is correct. |
| 6.7 | CDN-DUKE Theorem 2.9, lines 358–373, p.9; Lemmas 2.11–2.12, lines 380–425, pp.9–10; Corollary 2.13 | Twisted Artin–Schreier proof and truncation supported; generality is stronger than the roadmap's chosen carrier: R11. |
| 7.3 | CDN20 Proposition 2.12, lines 914–928, p.23; Proposition A.1, line 2103, p.53; Remarque A.2, lines 2123–2133, pp.53–54 | Bounded-vector theorem supported. The proof of bounded-function constancy uses proper special-fibre components. The roadmap's nonconstant/disconnected Check and application are R05. |
| 7.5 | CDN20 Theorem 0.8, lines 252–261, p.7; Corollary 2.1, line 654, and period-space calculation at lines 702–707; CDN23 lines 1479–1484, p.39 | Multiplicity diagram and bounded-vector injection supported in the genuinely supercuspidal slope-`1/2` setting. R03–R04 repair the coefficient and level interfaces used to reach it. |

The only author-marked unverified works are the five settled uncertified entries. No source excerpt was copied into the repository.

### Computed adversarial table

The standing connectedness in README.md:277 was applied to Layers 2–4; it does not extend to the tower spaces. All equalities below are computations on the specified test objects. “Retain” means that test gives no repair; “Rxx” points to the change required above.

| Statement | Instances | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §0.1 graph complexes | isolated vertex; interval; one loop; vertex with two legs | `H¹,H¹_c`: `(0,0)`, `(0,0)`, `(L,L)`, `(0,L)`; for two legs `ker ∂*={(a,−a)}` agrees with dual compact-support cohomology | Retain |
| §0.2 metric monodromy | one loop length `µ`; subdivisions of lengths `a,b,c`; tree | `Nµ(x)=µx`; subdivision gives `(a+b+c)x`; tree has zero target, hence zero map | Retain; R14 fixes admissible pattern |
| §0.3 flag/translation/quotient | `d=0,1`, `J=∅,Δ`, zero ring, nonabelian `S₃` | Values in the Lean table above; inverse pullback has multiplication order `h⁻¹g⁻¹`; parabolics increase with `J` | Retain bodies |
| §0.3 continuous dual | two distinct points in `ℙ¹` | `δ_a(1)=1`, `(δ_a−δ_b)(1)=0`; quotient kills `1`, so only second descends | Fails: R02 |
| §0.4 irreducibility/lattices | `d=0`; `d=1`, coefficients characteristic `0,2,3` with residue characteristic matching | `Sp_0=A` has dimension 1; rank-one finite-flag quotient has dimension `(q+1)−1=q`; zero ring gives dimension 0 and is excluded by `Field` | Supports boundary/coefficient conventions; deep theorem uses cited irreducibility |
| §0.5 presentation | `r=0`; `r=1,d=1`; `r=2,d=1` | constants `ℤ`; cocycle `g(b)−g(a)`; dependence forces all values to 0 because three linear forms on `K²` are dependent | Retain presentation; R18 for measures |
| §1.1 coefficients | geometric point; closed disc with `ℓ≠p`; open disc with `p` | point: `(H⁰,H¹)=(ℚ_p(1),0)` both sites; closed disc `H¹=0=0`; open disc pro-étale `H¹=O(D)/C≠0`, and the source's nonzero kernel warns against global comparison | Retain qcqs restriction |
| §1.2 tensor convention | rank 0, rank 1, countable product | `B⊗̂0=0`; `B⊗̂C̆=B`; `B⊗̂∏C̆=∏B`, while algebraic tensor only contains sums with a common finite-dimensional coefficient span | Retain completion requirement |
| §1.3 period spaces | slope `0`, slope `1`, ordinary elliptic sum | `X¹(C̆)=B_cris^{+,φ=p}` with kernel `ℚ_pt`; `X¹(C̆(−1))=ℚ_p`; sum has Dimension `(1,1)+(0,1)=(1,2)` | Retain; rejects opposite exponent |
| §2.1 base/residue | `A_inf`; annulus coordinate `T`; exact differential | incomparable ideals `(p),([p^♭])`; residues of `dT/T` at the two ends are `1,−1`, sum 0; `res(dT)=0` | R07; residue convention sound |
| §2.2 pattern | fine disc, annulus, two-vertex Tate polygon | disc graph ranks `0,0`; annulus ordinary rank0/residue rank1; Tate pairs meet twice instead of at most once | R14; first two examples sound |
| §2.3 reconstruction | `xy=p^µ`; `xy=0`; gluing scaled by `α≠1` | generic annulus smooth since `xy≠0`; nodal special fibre has two branches; scalar-multiplied homomorphism sends `1` to `α≠1` | R18–R19; use coordinate rescaling, degree-one comparison |
| §2.4 symbols | constant `c`; annulus `T`; disc `1+pT` | compatible roots make class of `c` zero; `dlog T` has residue1; `dlog(1+pT)=p dT/(1+pT)≠0` | Retain; source's injection arrow is not copied |
| §2.5 filtration | good-reduction genus `g`; Tate curve; disc | good reduction pieces `(0,2g,0)`; Tate `(1,0,1)` and rank-one `N`; disc `(0,0,0)` | Retain dimension and monodromy pattern |
| §3.1 separated de Rham | disc; annulus | separated `H¹`: `0` and `C·dlog T`; residue of coordinate class `1`, exact differentials `0` | Retain separation |
| §3.2 quasi-compact HK | proper good ordinary elliptic; Tate; good ordinary short with one boundary | dimensions/slopes: `(2;0,1)`, `(2;0,1)` with `rank N=1` only for Tate; boundary short retains slope-one rank1, not full rank2 | Retain boundary slope selection |
| §3.3 regulator | constants; `1+pT`; `p=2,3` | constants map to0; differential `p/(1+pT)dT`; `p=3` cokernel0, `p=2` source guarantees `2·coker=0`, not necessarily coker0 | Retain weakened `p=2` conclusion; R18 |
| §3.4 integral exactness | `p=2,3`; zero homology | bound `p²=4,9`; a group killed by2 is 4-exact without being zero; zero group satisfies either | Retain bounded-error rather than exact assertion |
| §3.5 affinoid/proper diagram | closed disc; closed annulus; proper genus1 | disc separated HK0 leaves completed units; annulus residue contribution `ℚ_p`; proper: dimensions `H¹_ét=2`, BC `(1,2)`, `H¹(O)` Dimension `(1,0)` | Retain closed-disc completion and proper quotient |
| §4.1 dagger diagram | dagger disc; dagger annulus | disc `HK¹=0`, first row `O^†/C ≅ H¹`; annulus period residue term `ℚ_p` | Retain overconvergence distinction |
| §4.2 Stein diagram | open disc; two disjoint annuli; rank-one comparison ambiguity | disc `HK¹=dR¹=0`; `(0,1)` maps to0 in both differential and exponential although nonzero modulo diagonal `C`; `φ=σ,pσ` give same scalar extension `C` | R05–R06 |
| §4.3 filtration/model comparison | Mumford genus `g`; half-plane; Tate `q=π²,e=2` | pieces `(g,0,g)`, total `2g`; half-plane graph residue has slope1; model monodromy2 versus graph monodromy1 | Filtration sound; comparison needs R20 |
| §4.4 WD group | Tate two-term module, `p=2,3` | conjugation coefficient `1/2,1/3`; printed group law requires `2,3`; corrected negative-degree law matches | R01 |
| §4.5 Weil–Deligne passage | unramified representation; Tate | unramified inertia logarithm0, hence `N=0`; Tate `N(e₁)=µe₀`, `N²=0`, with Frobenius scaling as R01 | Retain once group convention corrected |
| §4.6 similarity | supersingular `E/𝔽₂`; half-plane | twisted elliptic polynomial `X²+1/2` on both sides, not `X²+2`; half-plane twist cancels slope1 to slope0 | R15 |
| §4.7 proper curve | `g=0`; ordinary and supersingular `g=1` | zero throughout for `g=0`; ordinary `(1,1)+(0,1)=(1,2)`; supersingular `2·(1−1/2,1)=(1,2)`; quotient `(1,0)` leaves height2 | Retain |
| §4.8 Jacobian cover | `g=0`; ordinary `g=1`; Tate | `0`; cover Dimension `(1,2)`; Tate generic p-divisible height2 extends étale, whereas Néron identity component height1 gives `(1,1)` | R08 |
| §4.8 thickening | `O_C`; `O_C/p²`; `O_C/p³` | `(p)^m≠0` for every `m` in `O_C`; in the two quotients the kernel is killed by its square/cube; finite-level cover evaluations agree and their limit agrees | R09 |
| §4.9 logarithm/variance | `μ_{p∞}`; `ℚ_p/ℤ_p`; two bounded lifts | raw slopes `0,1`; normalized slopes `−1,0`; fixed-point outputs `B_cris^{φ=p}`, `ℚ_p`; differences `p^n(a_n−b_n)→0` for bounded lifts | R10; lift-independence test sound |
| §5.1 model class | standard disc; standard half-plane | disc special `H⁰=k[T]` and transition reduces to0; proper rational component `H⁰=k`; half-plane components have `q+1` intersections | R16 |
| §5.2 HK | affine-space cohomology; `N=0`; two-term `N≠0` | `H⁰=F`, positive degrees0; `exp(cN)=1` if `N=0`; if `N(e₁)=e₀`, `exp(cN)e₁=e₁+ce₀` | R20 for the raw/normalized comparison and signed transport; R16 for the model |
| §5.3 syntomic | `p=2,r=2`; `p=3,r=2`; degree0 | modified denominators `2²·2!=8`, `3¹·1!=3`; truncation degree0 yields constant `ℤ_p`; no conclusion about degree1 | R12 for uniformity, lattice Check sound |
| §5.4 BK syntomic | point; positive-slope rank-two module | `N=0`, fixed `φ=1` on constants gives `ℚ_p`; slope `1/2` module has no `φ=1` positive-crystalline invariants, so unwanted kernel0 | Retain derived fixed points/truncations |
| §5.5 Stein fundamental diagram | `r=0`; affine line `r=1` | degree0 `ℚ_p→C` is injective with source constants; affine line degree1 has HK0 and pro-étale term `O/C`, matching the exponential term | Retain, conditional on model/comparison inputs |
| §6.1 standard model | `d=1,q=2`; `d=2,q=2` | rational component valency3; plane has `q²+q+1=7` rational point blowups; a divisor blowup contributes no modification | Retain |
| §6.2 logarithmic regulator | `r=0`; `r=1` | empty wedge1 gives constants; `dlog((z−a)/(z−b))` has residues `+1,−1`, total0 | Retain; primary originals uncertified |
| §6.3 Frobenius | `r=1`, two-term monodromy relation | pure degree1 Frobenius `p`; `Np=p·pN` forces `(p−p²)N=0`, hence `N=0` in characteristic zero | Retain |
| §6.4 HK/Steinberg | `r=0`; `r=1` | `HK⁰=F`, fixed `φ=1` is `ℚ_p`; `φ=p` on degree1 gives `X¹=Sp_1(ℚ_p)^*` | Retain with corrected dual presentation R02 |
| §6.5 pro-étale diagram | `r=0`; `r=d+1` | `H⁰=ℚ_p`; at `d+1`, `Sp_{d+1}=0`, `Ω^d/ker(d:Ω^d→0)=0`, closed `(d+1)`-forms0, so both rows0 | Retain |
| §6.6 integral de Rham | `d=1,j=0,1` | global integral functions `O_K`; degree1 bounded measures satisfy `µ(1)=0`; `δ_a−δ_b` has mass0 and residues `1,−1` | Retain standard-model result |
| §6.7 fixed points | geometric point; cusp model | point `H¹_ét=0`, twisted Artin–Schreier cokernel0; cusp generic smooth but special singularity has one tangent line of multiplicity2, not an SNC crossing | R11 |
| §6.8 `AΩ` half-space | `r=0`; twisting degree `r` | degree0 constants `A_inf`; a degree-`r` coefficient Frobenius `p^r` is cancelled by twist `r` in the rational crystalline specialization | Retain specialization normalization |
| §6.9 integral étale | `r=0`; `r>d`; rank-one reduction | `ℤ_p`, respectively0; reducing integral mass-zero measures gives `Sp_1(𝔽_p)^*`, whose total mass remains0 | Retain |
| §6.10 compact-support complex | `d=1`, banal `ℓ` | `H¹_c=St`, `H²_c=Λ(−1)`; geometric Frobenius on top class is `q`, not `q⁻¹`; degree shifts are `[-1],[-2]` | Retain stated coefficient restriction on splitting |
| §7.1 components | rank `n`, level1; scalar in division algebra | height-zero count `q−1`; scalar norm `b^n` gives inverse action `b^{−n}`; at rank1 the generic fibre itself is the component torsor | Retain action convention; R03 level adapter |
| §7.2 model/action | geometric level0; odd determinant valuation | two height classes; `type(v)+i mod2` unchanged, giving two `G`-orbits; `ϖ_D` exchanges them | Retain over geometric/base-split field; R05 clarifies arithmetic scope |
| §7.3 diagram/boundedness | quotient/full level0; locally constant `f` | quotient2 components, full tower `ℤ`; `exp(0,1)=0`, which is étale | R05 |
| §7.4 multiplicities | unramified irreducible coefficient example; slope shift | `X²−p` irreducible over `L`, split over `L(√p)`, endomorphism dimension2; a slope-`1/2` module twisted by `φ=p` has slope `3/2` | R04; slope restriction remains necessary |
| §7.5 multiplicity diagram | rank2 slope `1/2`; slope0; slope `3/2` | first has Dimension `(1,2)` over `ℚ_p` when `L=ℚ_p`, and θ-kernel0; slope0 kernel `ℚ_pt`; slope`3/2` fixed equation has negative slope and gives0 | Retain positive/slope-`1/2` hypothesis, repair R04 |
| §7.6 cpcf/finite presentation | finite constant system; `{ℤ/p^n}`; infinite discrete constant system | limits finite, `ℤ_p`, infinite discrete `𝔽_p^(ℕ)` respectively; last is not profinite. Five-term end cases reduce to kernel/cokernel closure | R13; cpcf object remains owned here |
| §7.7 arithmetic torsion | level0 `K=F`, `F₂`, ramified quadratic disjoint from `F₂` | `K⊗F₂` is a field, product of two fields, field; `H⁰` dimensions `1,2,1`; geometric value is2 | Previous F03 repaired |
| §7.8 non-admissibility | `F=ℚ_p`; `F≠ℚ_p`; level1 vs2 | first admits a nonzero Hom to `Π_M(V)`; restricted theorem gives0 in second setting; at true `ϖ_D`-level1, nontrivial `Ǧ₁`-type multiplicity0 | Previous F01 repaired; R03–R04 for carrier/type |

### Pinned library and ownership audit

Object searches covered flags, locally constant quotient representations, analytic cohomology, monodromy, period rings, Jacobians, syntomic comparison and finite presentation. Near-matches were treated as leads, not proofs.

Opened these declarations at the pins (paths relative to their library repositories):

| Pinned file and line | What it supplies / what it does not |
| --- | --- |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` | `Matrix.GeneralLinearGroup.toLin`, the actual matrix-to-linear automorphism equivalence. |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | `Submodule.pointwiseDistribMulAction`, action on submodules; no flag/parabolic theorem. |
| `Mathlib/GroupTheory/Coset/Basic.lean:424` | `Subgroup.quotientMapOfLE`; line 430 computes it on representatives. |
| `Mathlib/Topology/LocallyConstant/Algebra.lean:327` | `LocallyConstant.comapₗ`, linear pullback; the quotient maps used in the file have continuous representatives. |
| `Mathlib/RepresentationTheory/Basic.lean:329` | `Representation.quotient` requires exactly the proved invariance condition. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)`; it includes nontriviality, but no topological smoothness/admissibility. Its equivalent simple-module criterion is not a Steinberg theorem. |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40,65` | Native basis flag and its coordinate vanishing criterion. The package's small coordinate specialization supports its headline; this is not a separately planned flag library. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75,88` | `BDeRhamPlus`, `BDeRham`; neither supplies positive crystalline or semistable rings/cohomology. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | An isocrystal module with Frobenius; finite dimensionality, a geometric origin, topology and `N` are additional data, not implicit in this carrier. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | `Scheme.EllAdicCohomology`, for schemes, not analytic adic spaces. |
| `TauCeti/Algebra/Quaternion/Steinberg.lean:14` | Quaternion-symbol Steinberg relation; no generalized Steinberg representation or curve cohomology. |

No fully qualified declaration in Suggested.lean collides with a readable roadmap or library declaration. The generic coefficient/representation constructions use native Mathlib operations; the missing analytic carriers are substantial constructions, so an empty replacement for them would violate the acceptance-file rule.

The board-package index was read before resolving missing-package leads. `PadicLocalLanglandsForGL2QpPartII` is present locally, and §4.1 exists. `Semistable.aOmega` is a planned supplier declaration at #1044, `TauCetiRoadmap/AInfCohomology/README.md:2860`; it is not being claimed as a pinned Mathlib declaration. These two resolver leads are therefore not missing-owner findings.

The open-head overlap report has no other PR changing this roadmap, no dropped cited id and no id defined only by an open revision. Its five closest roadmaps were inspected: #1759 CstConjectureForDaggerVarieties, #1757 ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, #1062 PadicHodgeTheory, #1064 CohomologyComparisons, #1364 CohomologyComparisonsPartII. The model-free dagger diagram and this roadmap's general-`C` curve/model-dependent Galois diagrams have stated distinctions; comparison on their common range needs R06's repair. Scholze imports tower geometry/finite copresentation and owns the subsequent finite-length argument. The local Part II package imports this roadmap's tower results. The concrete duplicate found is R13; the concrete convention mismatch is R04. Ownership was checked through `roadmaps grep/show` at supplied heads and the board packages, not inferred from PR descriptions.

### Resolved supplier ledger and order

All *Needs* lines and supplier paragraphs were read. These anchors resolve the grouped citations. PR numbers identify reviewed heads here; the roadmap must cite names and sections.

| Supplier | Resolved sections and anchor in its README |
| --- | --- |
| AdicEtaleGeometry (main) | Layer A1, `TauCetiRoadmap/AdicEtaleGeometry/README.md:1703`, analytic sites. |
| AdicSpacesPartIII (main) | R3.4 and R3.7, `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053,11218`, quasi-Stein/GAGA. |
| AdicSpacesPartIV (main) | F1.5–F1.9,F1.11, `TauCetiRoadmap/AdicSpacesPartIV/README.md:3766,4238,4515,4662,5594`, dagger completions/comparisons. |
| EnhancedDerivedSheaves; StableReduction (main) | E2 at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1290`; stable-reduction Layers 1,2,7 at `TauCetiRoadmap/StableReduction/README.md:372,405,621`. |
| ClassicalAdicEtaleCohomology #875 | §§1.3–1.4,4.1,4.6–4.7,9.1,9.6–9.7, Layer8, `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:354,449,1917,2528,2617,4557,5117,5213,3983`. |
| CrystallineCohomology #857 | CR.5.1,CR.6.1,CR.6.5 at `TauCetiRoadmap/CrystallineCohomology/README.md:8466,10029,11098`. |
| AInfCohomology #1044; PrismaticCohomologyPartIII #1070 | AI.3.1,AI.6.1–6.3 at `TauCetiRoadmap/AInfCohomology/README.md:1898,2658,2824,2901`; §§6.3,6.25 at `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:213,536`. R11 extends the carrier locally. |
| LocallyAnalyticDistributions #854 | §§0.0,0.2,0.CR.6.6 at `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1010,1125,1139`; finite-piece comparison at 1147 is not restricted to proper spaces or curves. |
| PadicPeriodRings #940; VectorBundlesAndIsocrystals #1205 | §§4.1,4.3 at `TauCetiRoadmap/PadicPeriodRings/README.md:417,470`; Layers1,5 at `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:209,1061`, including BC dimensions at 1341 and the period-space example at 1629. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | RD.4.10,4.11,4.18,4.29,4.34,4.38,7.7 at `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:7286,7324,7507,7772,7872,7978,13968`; the final section compares Frobenius, not all endomorphisms. |
| CstConjectureForDaggerVarieties #1759; CohomologyComparisons #1064; PartII #1364 | §1.5 at `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:439`; §§4.11–4.12 at `TauCetiRoadmap/CohomologyComparisons/README.md:915,925`; §§4.1–4.5 at `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:500,531,570,594`. R06/R12 delimit what these supply. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | §§12.2–12.8,12.11–12.14,12.19–12.21 at `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4567,4593,4623,4652,4678,4704,4723,4787,4806,4841,4860,4962,4980,4997`. R03 is a substantive level adapter. |
| HilbertModularVarietiesAndShimuraCurves #1005 | R18.5.1–R18.5.3 at `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1769,1793,1817`. |
| TropicalAndBerkovichArithmetic #1494 | §§2.11,2.13–2.17 at `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1237,1265,1279,1291,1316,1369`. |
| JacobianChallenge; ReductiveGroupsPartII (main) | LayerD at `TauCetiRoadmap/JacobianChallenge/README.md:218`; RG2.2 at `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2831`. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory #879; AbelianSchemesAndArithmeticModuli #849 | R07.2.20,2.25,2.26,2.28 at `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:3698,4057,4124,4325`; A4.2,A4.CR.7.2 at `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1868,2143`. Domains and variance require R09–R10. |
| SmoothRepresentationsOfLocalGroups #1688 | SR.0,SR.0d,SR.2 and SR.3 Steinberg/segment material: `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:581,1667,1908` and the SR.3 targets, compared rather than rebuilt for complex coefficients. |
| GL2AutomorphicRepresentationsAndTransfer #931; PadicHodgeTheory #1062; PadicLocalLanglandsForGL2Qp #1312 | R16.3 at `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:951,961,971`; §§5.3–5.4,8.1 at `TauCetiRoadmap/PadicHodgeTheory/README.md:1016,1044,1378`; §6.9 local JL at `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:2311`. R04 restores the imported definition of supercuspidal type. |
| ModpRepresentationsOfGL2OverLocalFields (board package) | Actual locations and the duplicate theorem are recorded in R13/R17. Its mathematical inputs exist, but its former design labels are not current citation locations. |

Dependency-check output, from the exact requested `gate --depcheck ... --movable` invocation:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The dependency graph passing does not validate a supplier's level index, coefficient convention or theorem hypotheses; R03, R04, R09, R10, R12 and R20 are those semantic checks.

All three declared gap slugs occur in both `design/plan.json` and the exact supplier contracts. None has supplier `none`. The formal-syntomic gap specifically requests `q≤r` and `A(e,p,r)` on formal/weak formal completions; the period-rings gap extends beyond the canonical completion of an algebraic closure of a discretely valued field; the endomorphism gap extends the supplier's Frobenius-only characteristic-polynomial theorem. These are precise missing interfaces, not unowned prerequisites. Their existence is not a finding; R12 concerns consuming more than the first contract promises. Acceptance after repair would remain conditional on these three contracts.

## Not verifiable

- SS91, *The cohomology of p-adic symmetric spaces*: settled uncertified. Its original locators cannot be checked against an available legal text. The accessible CDN-STEIN presentation and restatements were checked instead; this does not certify the original numbering.
- IS01, *Logarithmic differential forms on p-adic symmetric spaces*: settled uncertified. CDN-STEIN §5.4.1 supplies the accessible presentation used in the sample, but not independent verification of the original locator.
- DS01, *Residues on buildings and de Rham cohomology of p-adic symmetric domains*: settled uncertified; original text unavailable in the provided legal cache.
- NAK84, Theorem 4: settled uncertified; the use in CDN23 Remarque 2.15(ii), lines 1487–1495, was read, but the original theorem could not be independently certified.
- KM74, Theorem 2: settled uncertified; the new manifest entry repairs coverage, not access. The broader all-endomorphisms assertion remains the declared supplier contract.

No request to reopen any of these settled references was made. No unread open-PR ownership claim is used to accept the package. No corrected README or Lean implementation was written; repairs above were checked on their stated counterexamples, while the elaboration result is for the author's unchanged file.

## Source issues

- **Error** in CDN-CURVES at §8.2.5, printed p.107 (lines 4431–4437): the source says positive degree scales the additive semidirect factor by a positive power; it should be the inverse power for its stated `Ng=p^deg(g)gN` relation; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, p.38 (line 1936): the source says the Steinberg dual is naturally all inverse-limit flag distributions; it should be the annihilator of quotient relations, or duals of finite-stage quotient images; affects a stated result.
- **Misprint** in CDN-CURVES at §5.1.3, printed p.59 (line 2483): the source says principal units inject into the symbol group; it should be a homomorphism, since nontrivial constant principal units have compatible roots and map to zero; affects a stated result.
- **Misprint** in CDN-STEIN at §5.4.1, p.41 (lines 2063–2064): the source says degree `s` in the de Rham target and twist `s` in the pro-étale target; it should be degree `r` and twist `r`; affects a stated result.
- **Gap** in CDN20 at Théorèmes 0.4 and 0.8, printed pp.6–7: the source says the multiplicity formulas for the supercuspidal modules defined without a numerical slope restriction; it should include the slope-one-half condition used in §2.1; affects a stated result.
- **Gap** in CDN23 at Proposition 2.18, printed p.40: the source says the Banach vanishing without repeating the restriction on the local field; it should require `F≠ℚ_p`, as does the Corollary 1.34 input; affects a stated result.
