<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6396880708 -->
Review (codex) of 15344e5

Verdict: needs_changes

1. **F01** (P1) The stack middle-extension and restriction inputs are not supplied

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:13238` and `:13242`, §7.17: “Apply the supplier’s precise proper quasi-finite tame-DM pushforward and intermediate-extension theorem”; “this contract is explicitly §§7.27–7.28”. Also §7.22 at `:13320`.

   **Claim:** The indicated contracts provide the perverse intermediate-extension operation and its pushforward comparison, and §7.26 provides full faithfulness of dense-open restriction.

   **Witness:** §§7.27–7.28 state degree-zero base change, coarse higher images and nilpotent invariance. §7.26 states atlas descent and monodromy. None states intermediate extension or dense-open restriction. DeligneWeightsAndPurity §8.24 also lacks these operations.

   This is a missing input, not a counterexample to the desired symmetric-sheaf theorem. At a double branch collision the map has kernel μ₂: a theorem confined to representably finite maps cannot fill the gap. The equal-sign tensor is trivial on that kernel, so its rational invariant stalk is one-dimensional; that calculation by itself does not construct a perverse intermediate extension.

   **Exact repair:** Add a numbered rational-coefficient DM-stack perverse descent target, on the supplied constructible category, transporting the scheme perverse structure and intermediate extension through étale atlases. State the proper quasi-finite pushforward comparison used in §7.17 with its finite-type, tame-DM and coefficient hypotheses; list its atlas, scheme §F.8, and §§7.27–7.28 inputs. Include it in §7.17's own Needs line. For §§7.16 and 7.22–7.25, replace the misattribution to §7.26/F.0.2 by the normal-DM dense-open finite-cover criterion in `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:6348`, §IG.5.7, followed by §7.26's monodromy dictionary. Add that exact supplier contract. It precedes the package's mechanically computed placement. Move the rational DM perverse subcase down from GlobalShtukasAndFunctionFieldLanglands §1.4 to this earlier owner, leaving its general Artin extension there; record that ownership adjustment without an upward dependency.

   **Repair test:** For Bμ₂ over an odd-characteristic algebraically closed field, the constant/sign rational stalks are respectively 1/0 dimensional and all positive stabilizer cohomology is zero, including ℓ=2. The proposed stack interface must retain both. On a smooth curve a lisse line shifted by one has its nonzero stalk in degree −1. For dense restriction, retain normality: the cycle cover of a nodal cubic restricts to disconnected copies of its smooth locus, unlike the normal case.

2. **F02** (P2) Finite reduction cannot descend through isogenies

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:13376`, §7.26: “up to isogeny”; “The functors commute with pullback, tensor, dual, finite coefficient reduction and Frobenius descent.”

   **Claim:** The rational/isogeny equivalence also admits finite coefficient reduction without further qualification.

   **Witness:** On Spec 𝔽₅ take the constant ℚ₃-line with lattice ℤ₃. Multiplication by 3 is an isomorphism after isogenies; its reduction modulo 3 is zero on 𝔽₃, hence is not an isomorphism.

   A functor preserves isomorphisms. Spec 𝔽₅ meets the stated normality, connectedness, finite-type and coefficient hypotheses, so these cannot resolve the contradiction. A choice of lattice alone does not make reduction compatible with localization of morphisms.

   **Exact repair:** State finite reduction on the category of chosen O_E-lattices and lattice-preserving morphisms, before inverting ϖ. Then state the rational equivalence obtained by localization, without a finite-reduction functor on that localized category. Keep pullback, tensor, dual and Frobenius compatibility at the relevant levels. Add the displayed ×3 example as a negative-control Check.

   **Repair test:** Before localization, ×3 on ℤ₃ is not an isomorphism and reduces to zero; ×2 is an isomorphism and reduces to ×2 on 𝔽₃. Both now obey functoriality. After localization, ×3 becomes invertible and no reduction is asserted.

3. **F03** (P1) The projective-space proof uses an unowned hyperplane theorem

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:13434`, Layer 8's scheme input: “Higher dimension uses the hyperplane fundamental-group theorem.” Its Needs line is at `:13436`; §8.10 at `:13640` incorrectly assigns projective-space simple connectivity to EtaleCohomologyFoundations §F.0.2.

   **Claim:** The listed suppliers close the proof of simple connectivity of every ℙʳ over every algebraically closed field.

   **Witness:** EtaleCohomologyFoundations §F.0.2 gives the finite-cover dictionary. SchemeAndStackFoundations §3.2 gives curve Riemann–Hurwitz. SGA1 line 8615 explicitly uses X.2.10 for higher dimensions; that theorem has no named owner in this input list.

   The object search found no supplying arbitrary-characteristic hyperplane-cover theorem matching these cited sections; the characteristic-zero complete-intersection result in HeightsRationalPointsAndObstructions does not supply this generality. A source reference is not an ownership contract. The dimension-one computation is valid but does not supply the r≥2 induction.

   **Exact repair:** Declare a precise supplier gap with EtaleCohomologyFoundations §F.0.2 for SGA1 X, **Lemme** 2.10: for algebraically closed k, proper normal irreducible X and g:X→ℙʳ_k with dim g(X)≥2, every hyperplane inverse image Y is connected and π₁(Y)→π₁(X) is surjective. Record the same slug in the plan gaps and Exact supplier contracts, and use it in the projective-space target's Needs. Repoint §8.10 to this local projective-space target. Preserve the general theorem, rather than a projective-space-only workaround. This is a new, precisely owned contract; its absence today would then be conditional supply, not an unowned prerequisite.

   **Repair test:** For X=ℙ² and a line H, the proposed theorem yields connected pullbacks of connected finite étale covers to ℙ¹. Riemann–Hurwitz gives g=1−m, hence m=1. For r=0 the sole connected finite étale algebra is k. The dimension condition matters: a degree-two map ℙ¹→ℙ¹ can pull a point back to two points.

4. **F04** (P3) Generic direct-limit representatives remain local targets

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:6168`, §3.87: “Every x∈C_div equals κ_n(y) for some positive index n and y∈B_n.” The same pattern occurs in §3.102 at `:6409`, and in the representative-existence API bullets of §§3.64–3.65.

   **Claim:** These are additional root-arithmetic theorems to build.

   **Witness:** `Mathlib/Order/DirectedInverseSystem.lean:130`, `DirectLimit.exists_eq_mk`, already gives a component representative for every direct-limit element. The roadmap's proof is exactly that theorem applied to its chosen diagram.

   **Exact repair:** Delete these two representative targets, replace the duplicate API bullets by the same import, and cite the pinned theorem in the Mathlib supplier contract and each consuming Needs line. Keep root-specific finite-map, coaction and cofinality comparisons. This finding is about README duplication, not Lean padding.

   **Repair test:** The element 1+v₂+v₃ is represented at level 6 by 1+t₆³+t₆². The imported theorem also covers the zero ring and arbitrary nilpotent parameters; no extra root hypothesis is needed for existence of a representative.

5. **F05** (P3) Pasting Checks repeat the API without discriminating instances

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:220`, §1.5 Checks: “The two-step pasting comparison has all four projection equations and both inverse roundtrips.” The next two bullets likewise repeat the asserted comparisons.

   **Claim:** These are three discriminating Checks of the chosen normalization-pullback comparison.

   **Witness:** Each bullet repeats a target identity with its variables unchanged; none specifies rings, maps, roots or values. A coherently rescaled alternative is never tested on a distinguished generator.

   **Exact repair:** Replace the three bullets with computed tests: (1) ℤ→ℤ/4→𝔽₂, n=2,u=−1, where T maps to T and 3 maps to 1; (2) add 𝔽₂→𝔽₄ and compare both three-step collapses on these generators and projections; (3) n=0,u=1, where normalization is a polynomial algebra and T still maps to T. Retain the zero-ring empty-spectrum boundary separately if useful. The same pattern recurs in §§1.45 (`:953`), 3.24 (`:5066`), 3.126 (`:6836`), 3.151 (`:7282`) and 3.219 (`:8439`). Give each three actual instances. For §1.45 reuse the three-step, zero-exponent and nonflat tests. For §3.24 use complex conjugation on the coherent family ζ_d=exp(2πi/d): ζ₆ maps to ζ₆⁻¹, conjugating twice returns ζ₆, and the identity family stays 1. For §§3.126/3.219 compute the unit-family evaluation (every root maps to 1), the transition t₂↦t₄²≠0 over 𝔽₂ at f=0, and the unique zero-ring/empty-scheme map. For §3.151 compute scaling t₂↦−t₂, t₆↦ζ₆t₆ and composition t₆↦ζ₆²t₆ over ℂ at f=1, keeping the coefficient 3 fixed. These distinguish a trivial or incorrectly powered action.

   **Repair test:** All proposed paths give the listed values. A rescaling T↦−T is detected before reduction modulo 2 by T≠−T over ℤ/4; its square still satisfies the equation, so checking the equation alone would miss it.

6. **F06** (P3) Residual process narrative and obsolete aliases

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:11072`, §3.383: “The factorial Hopf/coaction interface now supplies”; `:4187`: “Its exact module-descent supplier is R09.3”; `:4230`: “Request generic scheme/module universe comparisons from SF.0”.

   **Claim:** These passages are timeless mathematical proof routes with resolved inputs.

   **Witness:** R09.3 and SF.0 are not named roadmap sections or declared gap slugs. The surrounding package already supplies §2.4, SchemeAndStackFoundations §1.1 and the two explicit universe-lift gaps.

   **Exact repair:** Replace R09.3 by §2.4 together with SchemeAndStackFoundations §1.1; replace SF.0 by the two named universe contracts and their suppliers. Rewrite §3.383's repeated “now”, “checked”, “remaining” progress paragraphs as a single mathematical route listing its actual numbered inputs. Replace `GC0-WEIL-FRAMES` at `:11955` by the named restriction-of-scalars/frame contract already described under suppliers. Replace the dangling `native_nontrivial_root` label at `:11964` by the actual nontrivial order-two line example in §4.4. Normalize the remaining prose ASCII placeholders to Unicode and repair malformed punctuation.

   **Repair test:** The fpqc descent example O(1) on the two standard affines of ℙ¹ still descends without a global frame. Universe transport still takes (3,1) over ℤ/4 to its lifted pair with 3·1²=3. Neither test needs an explorer alias or a claim of completed implementation.

7. **F07** (P3) SGA1 X.2.10 is misidentified as a corollary

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:13434`, `:13436` and `:14752`, and `packages/FunctionFieldArithmeticPartII/sources.toml:457`: “Exposé X, Corollaire 2.10”.

   **Claim:** This is the exact locator for the hyperplane fundamental-group input.

   **Witness:** SGA1 line 8303 labels the result Lemme 2.10; lines 8308–8310 label its connected-cover consequence Corollaire 2.11.

   **Exact repair:** Correct the README citations and the existing SGA1 manifest entry, without adding a second key. Use “Exposé X, Lemme 2.10, printed p.274 (recomposed p.210), SGA1 line 8303”; cite Corollaire 2.11 separately when using the connected-cover formulation. Keep XI, Proposition 1.1 at SGA1 line 8606, printed p.285 (recomposed p.219).

   **Repair test:** For ℙ² and a hyperplane, the corrected lemma supplies the surjection used in R03; the following corollary supplies connectedness of the pulled-back cover. The two distinct numbered statements can now be found directly.

8. **F08** (P2) Residue-field finiteness needs a closed point

   **Location:** `packages/FunctionFieldArithmeticPartII/README.md:11813`, Layer 3 Examples: “A residue field of a finite-type ℚ-algebra is finite over ℚ”.

   **Claim:** Every residue field of a finite-type ℚ-algebra is a finite extension of ℚ.

   **Witness:** For A=ℚ[T] and the prime ideal (0), κ((0))=ℚ(T). The elements 1,T,T²,… are ℚ-linearly independent, so this residue field has infinite degree.

   **Exact repair:** Say: choose a closed point of a nonempty affine finite-type ℚ-chart in the proposed fppf cover; its residue field is finite over ℚ by Zariski’s lemma. This matches the already correct maximal-ideal argument in §§3.121 and 3.144. Add the generic point of Spec ℚ[T] as a negative control. Do not weaken the non-fppf conclusion.

   **Repair test:** At (T), the residue degree is 1; at (T²−2), it is 2. The prime (0) is not maximal and has infinite residue degree, so it is now excluded. A finite extension of degree d cannot contain a root of Xⁿ−2 for n>d; the corrected contradiction still works.

There are eight findings: two P1, two P2 and four P3. The package is repairable. The two Lean acceptance theorems elaborate, their binders are intact, and their small-ring tests pass. The blocking problems concern missing proof interfaces, coefficient reduction after isogenies, and an unrestricted residue-field claim. No package mathematics was edited during this review.

## Previous findings checked individually

The earlier review and repair report were read first. Only earlier adversarial rows containing computed values were usable evidence. Their blanket coverage claims were not treated as completed checks. The earlier repair ledger was used as a location index; its values were recomputed and corrected where necessary. In particular its §8.9 claim about all lisse lines on punctured affine space is false in positive characteristic and is **not** inherited here; the package itself restricts its conclusion to the specific descended line.

| Earlier finding | Status | Current passage or deletion witness and test |
|---|---|---|
| F01 | Repaired | Suggested.lean now says “using affine root-chart and tensor-product carriers”; the matrix definition and matrix determinant theorem are absent. The retained comparison map is genuinely used by both theorems. Determinants at f=3 remain 1,−3,27,729,59049. |
| F02 | Repaired | Scope says “only compatibility with the Koszul action and its invariant-image consequence remains a target”. No sorried arbitrary-module invariant theorem remains. At rank 2, d=2, the antisymmetric image has dimension 1. |
| F03 | Repaired in this package | §2.1: “use SchemeAndStackFoundations §1.21's `rootStack` carrier”. Deleted second-carrier targets are absent. At n=1 over B𝔾_m the base inertia remains 𝔾_m; at f=0,n=2 the nilpotent root remains. AMAG's older outward ownership wording still needs maintainer alignment; this package no longer defines that second carrier. |
| F04 | Partly repaired | “The rank-one comparisons, proper degree-zero base change and coarse-stalk calculations needed here are targets in Layer 7”. The generic rational DM coefficient category is correctly imported from DWP §8.24. R01 and R02 identify defects in the new interfaces. |
| F05 | Repaired | Exact contracts name “`neutralizationEquivalence` and `rootGerbe`” and “`GerbeLimitFamily`, `limitStackDescent` and `nonemptyAffineLimitGerbe`”. Their sections exist at the supplied head. Over ℝ there are two compatible Kummer classes but one real infinite-band point. |
| F06 | Partly repaired | §7.27 now gives “the canonical degree-zero map g*f_*F→f′_*g′*F is an isomorphism”. Most old placeholders were replaced. R01, R03 and R06 locate the surviving missing contracts and aliases. |
| F07 | Partly repaired | The factorial Hopf objects are attached to local numbered constructions; “now supplies” at §3.383 and `native_nontrivial_root` at §4.6 remain process/example residue (R06), rather than missing pinned definitions used by Lean. |
| F08 | Repaired | §10.30 is absent; §10.29 specifies the torsor obstruction and §10.31 retains the degree-one negative control. For the double cover of ℙ¹, 1∉2ℤ. |
| F09 | Repaired | The site gap says “restricted to the essential image of the smaller site”; a separate sheaf gap supplies operations. The lattice gap retains “the sign π_x⁻¹↦O_X(x)”. All six slugs match the plan. |
| F10 | Settled; not re-raised | The repair report marks the proposed architectural split “not actionable in this package” because ownership changes require a maintainer decision. That reason is valid for this read-only package review. No split is demanded here. |
| F11 | Partly repaired | §6.7 now locates “Lemma A.5 and proof, p.518”; the seeded sample is checked below. R07 records a remaining theorem-kind locator error. §3.87's cited context does not replace its already pinned proof (R04). |
| F12 | Partly repaired | The module docstring now says “this file is not the roadmap”. README §3.383 still narrates accumulated interfaces; R06 gives exact surviving passages. |
| F13 | Partly repaired | Exact Tau Ceti contracts now include `PiTensorProduct.reindexRepresentation` and the two AddCircle declarations. Residual prose placeholders and broken punctuation remain (R06). Permanent source keys are not renamed. |
| F14 | Partly repaired | Curve duality is now §0.11 and tensor inputs are L0A–L0B. §8.10 still attributes projective-space simple connectivity to §F.0.2, which does not state it (R03). |
| F15 | Repaired | The Mathlib contract says “their unit-root factor is then A[h], and no μ₀ or Hopf-algebra interpretation is asserted”. At n=0,f=2 over ℤ the comparison is bijective, while the positive-exponent unit criterion would fail. |
| F16 | Repaired | The only sorried declarations are the two sharp comparison criteria. Kernel/cokernel targets remain in README. For n=2,f=2 over ℤ/4 both groups have 2 elements. |
| F17 | Repaired | “π_x maps to arithmetic Frobenius and π_x⁻¹ maps to geometric Frobenius”. The gap asks only for the odd-characteristic ramified residue character. A nonquadratic eigenvalue a becomes a⁻¹ under inversion. |
| F18 | Repaired | §3.61 includes “over the zero ring both quotient carriers have one element”, alongside m=1 and the 𝔽₂ nilpotent test. In 𝔽₂[t₄]/t₄⁴, t₄²≠0 and (t₄²)²=0. |

## Verified sound

The statement, API and Check inventory covers **818 numbered targets** (Layers 1–10: 242,12,428,12,23,12,28,13,18,30), 174 explicit construction-API blocks and 198 Check blocks. All 818 Needs lines and all 717 bullet Checks (658 distinct texts) were read. The report keeps computed rows for the seeded sample, headlines, findings and shared conventions, as required by the comment-size limit. The long coordinate families were evaluated on the same generator, label, nonflat-change and nilpotent models throughout; repeating a target does not turn an example into a proof. The table also addresses the unnumbered projective-space input and the five Lean declarations. Computations test the formulas and exclude specified wrong models; they are not proofs of the general geometric theorems. The ownership failures above remain failures even where a numerical instance agrees.

The tested mathematical core passes the finite-ring comparison tests, zero-ring and zero-exponent controls, wild finite-root charts, coherent divisibility/factorial transitions, coframe orientation, nonflat coefficient changes, relative versus absolute inertia, symmetric collision kernels, exterior signs, weighted fibres, all-degree cancellation and ramified norm obstructions. The README imports the base FunctionFieldArithmetic direction and explicitly begins Part II at root data. No computational algorithm, sorry'd data, forbidden option or second finite-root carrier was found in the retained acceptance file.

### Seeded source verification

All fifteen selected targets were opened together with their cited source passages. No additional author-flagged unverified locator was found beyond the settled B24 citations. Source versions were read as recorded in the manifest; the AGV and TV numbering below is that of the recorded preprints. All statements and descriptions here are paraphrases, not copied source passages.

| Target and README line | Text actually opened | Hypotheses, locator and support |
|---|---|---|
| 1.61, 1193 | FramedRoot-codex-rtOQ9t line 7989, Example 4.9.22 and Exercise 4.9.23, pp.159–160 | The source gives positive-root triples and their arrows; the exercise assumes invertible exponent. The label substitution is an elementary deduction, not an assertion that the exercise proves the n=0/general-ring extension. Mapping label 8 to 2 under ℤ/9→𝔽₃ verifies that extension directly. |
| 1.122, 2236 | AGV08 line 2431, Appendix B.2, pp.53–54; TV17 lines 571,631,778 | Root triples and base change support the construction. Pullback must transport both the root line and the target line; the coherence itself is a deduction from the explicitly contracted sheaf comparisons. TV Proposition 3.4 is on p.13. |
| 1.123, 2253 | AGV08 lines 2434–2439 and 2459–2478, pp.53–54 | The frame/coordinate equivalence is derived from root triples. Its two equations retain the unit identification even at zero sections. The 𝔽₅ frame-change values (1,2)→(4,1) give product 4 on both sides. |
| 1.136, 2482 | NormalizationThree-codex-rtOQ9t lines 1387–1417, §26.17, printed p.31; STACKS-KUMMER line 1442, Lemma 59.28.3 | The affine tensor-product pullback supports the Cartesian claim for arbitrary coefficient change; positivity is required only for the covering conclusion. At n=0,u=1 the tensor comparison remains a polynomial-algebra comparison. |
| 1.157, 2802 | NormalizationThree-codex-rtOQ9t lines 1387–1417 | The same fibre-product universal property gives the square on schemes, with the contravariant ring direction retained. The nonflat ℤ/4→𝔽₂ example has both root images T. |
| 1.231, 4049 | NormalizationThree-codex-rtOQ9t lines 1387–1417 | Three-step coherence is a universal-property deduction, not a separately numbered theorem in the source. Both comparison maps have coefficient 3↦1 and T↦T in the three-step test. |
| 2.14, 4441 | AGV08 lines 2431–2478, Appendix B.2, pp.53–54 | The source presents scheme-base roots. The package states its algebraic-stack-base extension by atlas descent and keeps finite diagonal relative. At n=1 over B𝔾_m the relative inertia is trivial while absolute inertia is 𝔾_m. |
| 3.14, 4874 | AGV08 lines 2404–2430, Appendix B.1, pp.52–53; B24 §3, p.135 | Finite flat Kummer coordinates are supported, including noninvertible exponents. B24's infinite-gerbe locator is settled uncertified and was not read. The finite test sends [2]₄ to [2]₂≠1; a power transition would instead give [4]₂=1. |
| 3.87, 6166 | TV17 lines 650–784, Proposition 3.5, Remark 3.6 and §3.1, pp.14–16 | This is context for root limits, not a separate finite-representative theorem. The exact proof is `DirectLimit.exists_eq_mk` at the pin; R04 deletes the duplicate target. |
| 3.200, 8111 | TV17 lines 668–705, §3.1, pp.14–15 | Grading and root coordinates support the elementary scaling calculation; the exact composition equation is the author's deduction. At level 3, ω followed by ω gives ω² on both sides, and coefficients are fixed. |
| 3.235, 8711 | TV17 lines 631–638 and 668–784, Proposition 3.4 and §3.1 | Coefficient functoriality is deduced from the displayed algebras. The ℤ→ℤ/4→𝔽₂ test sends 7→3→1 and each unity root to the same target root. No flatness is inserted. |
| 3.313, 9965 | TV17 lines 668–784 | The same root/coefficient computation proves composition after the factorial/divisibility comparison. It is not a verbatim TV theorem; 7 and the distinguished roots determine both maps. |
| 5.14, 12391 | YZ19 lines 7095–7115, Lemma A.4(1), pp.516–517 | The proof's frame differential has full rank when the vanishing divisors meet transversely; nonvanishing sections contribute their frame derivative. At two transverse zeros rank=2; repeated equation x,x gives rank=1. The package's pointwise formulation uses that proof step rather than importing the source's global irreducibility assumptions. |
| 6.7, 12763 | YZ19 lines 7248–7314, Lemma A.5, p.518 | The lemma fixes inverse-uniformizer↦O(x). Its displayed frame ratio has the sign misprint recorded below. The package repairs the ratio using its explicit completed-lattice contract: π⁻¹O gives O(x), weighted degree [κ(x):k]. |
| 8.6, 13556 | YZ19 lines 7507–7571, Lemma A.9 and proof, pp.520–521 | The square-coordinate projective cover uses odd characteristic and a nonempty weight-one block. For (a,ρ)=(1,1), [x:y]↦[x²:y] has generic degree 2 and ramification index 2 at x=0. For (2,1), rank=4. Empty R is handled separately. |

### Pinned libraries, definitions and duplication by object

The pin is the content checkout's `lake-manifest.json`, not a newer online library. Focused declarations were opened at the following files and lines; broad object/name searches were also run across both pinned trees. Searches used the actual quotient, unit, tensor, coaction, exterior, site and torsor objects, not only this package’s declaration names.

| Object inspected | Pinned declaration and location | Boundary retained |
|---|---|---|
| Invertible sheaf | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112`, `InvertibleSheaf`; trivial line at 131 | A full subcategory of module sheaves; morphisms need not be invertible. Root arrows correctly use the core. Multiplication by 0 on a line is not a root isomorphism. |
| Tensor/pullback | `TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean:63`, 148,175,203,230; `Pullback.lean:72` | These supply underlying sheaf operations, not the two declared coordinate/universe contracts. Unit sections must evaluate to 1, not an arbitrary scalar. |
| Quotient root | `Mathlib/RingTheory/AdjoinRoot.lean:163`, 203,255,276,317,737 | Real quotient, root relation, extensionality, positive-degree coefficient injection, lift, monic basis. The zero ring needs the separate subsingleton argument; n=0 has relation 1=f. |
| Coefficient changes | `Mathlib/RingTheory/AdjoinRoot.lean:396`, 399,402,405,429 | Map of quotient rings requires the polynomial-divisibility witness; the package's polynomial map gives it. Root goes to root under nonflat maps too. |
| Roots of unity | `TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean:124`,151; `Scheme.lean:82`,101 | Points are units and the scheme character group uses ULift. Polynomial unity-root coordinates are compared explicitly, not definitionally identified. |
| Finite field-root adapter | `Mathlib/RingTheory/RootsOfUnity/Basic.lean:208`,222 | `rootsOfUnityEquivNthRoots` requires nonzero exponent and a domain; its use for finite isomorphism sets is over fields, not arbitrary rings. |
| Cyclic permutation | `Mathlib/Logic/Equiv/Prod.lean:299`, `Equiv.prodShear`; `Mathlib/Algebra/Group/Fin/Basic.lean:67` | Fin addition requires nonzero modulus; the inverse uses cyclic subtraction, not truncated natural subtraction. |
| Direct limits | `Mathlib/Order/DirectedInverseSystem.lean:130`; `Mathlib/Algebra/Colimit/DirectLimit.lean:849`,864,877,880 | Generic representatives, insertions, lift and extensionality already exist. Root-generator comparisons are additional; representative existence is not (R04). |
| Exterior projection | `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:170`,186,204,214,226,234,242 | General commutative rings/modules; injectivity needs unit factorial. At d=2 the projection/antisymmetrization composite is ×2, not identity. |
| Generic stack notion | `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`; `Mathlib/CategoryTheory/Bicategory/Grothendieck.lean:77` | Generic effective descent and total category do not supply an algebraic atlas, root Picard stack, perverse category or Frobenius trace. |

The searches by root-stack, root-gerbe, root-Picard, coherent torsor, exterior, lisse-coefficient and norm objects used `roadmaps grep`/`roadmaps show` across indexed main and open heads, and the board package index was read. The package has no fully qualified Lean declaration collision among the accessible roadmaps. Generic finite roots remain SchemeAndStackFoundations §1.21's; generic gerbes remain AMAG's; root-specific coordinate, infinite-limit and ramified-Picard comparisons are the additional objects here. GlobalShtukasAndFunctionFieldLanglands §1.4 is a later general Artin-stack consumer, not a supplier used here. Its README already defers the rational DM coefficient input to DeligneWeightsAndPurity §8.24. The inaccessible board heads are listed under Not verifiable; no claim that those packages exist nowhere is made.

### Cross-roadmap contracts and supply direction

Every named supplier family was resolved against main or its provided/indexed open head, not recalled from an older round. The read-only resolver reported no unresolved cross-roadmap citations or Lean names. That syntactic result does not validate the stronger claims in R01/R03.

| Supplier | Resolved sections and representative file locations | Consumed content / restriction |
|---|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2745` (§1.18), 2951 (§1.21), 3021 (§1.23), 4671 (§3.2); also §§0.1,0.9,1.1,1.15–1.16,1.19–1.22,2.3,2.10–2.11,3.3–3.7,4.13 | Stackification, two-pullbacks, finite roots, torsors, curve geometry, ordinary Picard/norms. §1.23's affine finite-group statement does not itself cover nonreduced diagonalizable groups: the declared gap is justified. |
| AlgebraicVectorBundles | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215`,228,254 | L0A–L0C supply monoidal modules, rank-one comparison and polynomial operations. Coordinate and coherent-universe adapters are separately declared, not presumed. |
| AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1972`,2096,2170,2186,2196,7398 | §§4.3,4.4,4.23: neutralization, invertible-exponent root gerbe, coherent families and nonempty affine gerbe limits over fields. §3.13 here adds arbitrary-base torsor towers. No unproved neutrality over k is imported. |
| AlgebraicCurves | `TauCetiRoadmap/AlgebraicCurves/README.md:1085`,1102,1150 | Layer 12A–E places/closed points/divisors and weighted degree. The completed-lattice rational-frame comparison remains a named gap; residue root frames are local §6.5. |
| JacobianChallenge | `TauCetiRoadmap/JacobianChallenge/README.md:111`,135,143,218 | Layers A–D: degree, coherent cohomology, family base change and ordinary Picard theory, with properness/flatness and geometric assumptions retained. |
| FunctionFieldArithmetic | `TauCetiRoadmap/FunctionFieldArithmetic/README.md:440`,676,995,1077,1280,1361,1425,1500,1536,1575 | §§0.1,2.1,4.1–4.2,4.5–4.10. Arithmetic Artin convention is reconciled by a↦a⁻¹: π⁻¹ here and π there both give O(x). The ramified residue-unit formula is the precise declared gap. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:200`,248,284,368,457,504,645,759,776,959,979,999,1021,1041,1089,1157,1179,1200,1265 | F.0.2/F.0.4, F.0.A1–A2, F.1–F.2, F.3a, F.4.1–F.4.6, §0.11, F.5–F.6, F.8. These are scheme interfaces; R01/R03 explain the two unjustified enlargements. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:3273`,3288,3307 | §8.24 gives rational constructible DM coefficients with atlas/refinement/pullback/Frobenius and proper finiteness. Its constant-coefficient coarse comparison is not the missing intermediate-extension theorem. |
| ProfiniteCohomology | `TauCetiRoadmap/ProfiniteCohomology/README.md:1549` | Layer 10's actual continuous coefficient objects, especially discrete-module cohomology; no arbitrary topology on a scalar carrier is substituted. |
| RepresentationTheory/SchurWeyl | `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:352` | Layer 8 tensor-permutation background. General module exterior maps are taken from the pinned Tau Ceti file, not inferred from this narrower representation-theoretic setting. |
| InverseGaloisAndArithmeticFundamentalGroups | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:6348` | §IG.5.7 supplies the normal-DM dense-open finite-cover criterion proposed in R01. The geometric hypotheses and connected/nonempty requirements are explicit. |

The six existing gaps have named owners, matching slugs in `design/plan.json` and Exact supplier contracts, and sufficiently specific minimal requests: `finite-diagonalizable-coarse`, `invertible-section-coordinates`, `completed-lattice-root-dictionary`, `quadratic-root-residue-character`, `coherent-site-universe-lifts`, `invertible-sheaf-universe-lifts`. None is itself a finding. The local finite root-frame construction is not requested from AlgebraicCurves. No newly needed gap was silently added by this review.

The required dependency command exited 0 with the following exact output. The movable placement is permitted by the brief, not a defect. The order file was not edited.

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations, AlgebraicModuliForArithmeticGeometry, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 585 edges, 0 problem(s)
```

All 818 Needs lines were read. The graph of explicit local section references has 818 vertices and 1,821 edges, with no missing destination or cycle. Supplier-qualified references were excluded from that local graph and resolved separately. Layers 1 and 3 interleave finite coordinate dependencies, as the reading paragraph explains. The graph check cannot supply the unlisted operations in R01/R03. No current consumer was used as an upward supplier.

### Lean acceptance, headline completeness and padding

`lake env lean` on the actual Suggested.lean, run from the pinned content checkout, exited 0. Its only warnings were the two declarations using `sorry` at lines 77 and 84. No Tau Ceti import or module build was needed. A scratch copy with `#check @name` for **all five declarations** also exited 0: CommRing, parameter f, exponent n and both explicit hypotheses 0<n were retained. No binder changed. The three real definitions have exactly the polynomial-quotient/tensor signatures described in §§1.7 and 1.26; the two criteria agree with §§1.184–1.185 over arbitrary commutative rings.

The one-tactic probe tested `simp`, `rfl` and `infer_instance` separately on each of the two sorried statements in that scratch copy; all six attempts failed to close the goal. The file retained `sorry` after these probes. Object searches and the opened quotient/tensor library APIs found no single pinned lemma giving either iff for this root comparison. Thus neither retained theorem is padding. The previously padded determinant, invariant and kernel/cokernel signatures are absent. No boundary examples were added to the acceptance file.

| README headline | Acceptance status |
|---|---|
| Sharp injectivity/surjectivity of the affine root comparison | Both stated on the real comparison map, with n>0. |
| Relative regular finite-root geometry | Named unavailable in the module docstring: finite-root stack and morphism-property carriers. |
| Coherent infinite root stack, fpqc quotient and arbitrary base change | Named unavailable: coherent root pseudofunctor and represented quotient action. |
| Infinite affine coinvariants | Named unavailable: substantial coherent colimit coaction/grading construction. |
| Infinite DVR gerbe, fpqc Kummer classes and non-fppf torsor | Named unavailable: infinite gerbe and torsor-groupoid carriers. |
| Root Picard quotient and signed adelic equivalence | Named unavailable: root Picard stack, degree components and gluing functor. |
| Symmetric lisse lines and multiplication across collisions | Named unavailable: root symmetric powers and their adic lisse category. |
| Exterior-power cohomology | Named unavailable: stack cohomology and Frobenius on those objects. |
| High-degree Abel–Jacobi descent | Named unavailable: root Abel map and stack lisse descent. |
| Normalized character sheaf in all integer degrees | Named unavailable: graded root Picard stack and lisse Frobenius category. |
| Ramified norm complex and torsor obstructions | Named unavailable: root multiplicative sheaf, norm and torsor groupoids. |
| Quadratic Frobenius trace equals the idele character | Named unavailable: root Picard character sheaf and trace. |

No omitted headline was found that can be stated at these pins with only a few simple definitions. In particular the generic stack predicate is not a replacement for the missing geometric carriers. The file has one `import Mathlib`, one module docstring, the required namespace, real supporting definitions and two theorem signatures; it has no `set_option`, sorry'd data, free proposition placeholder or admitted example. The 89-line size is appropriate to what is currently statable.

### Additional computed conventions and boundary controls

| Statement/convention | Instances and values on both sides | Result/change |
|---|---|---|
| Lean rootChart | 𝔽₂[t]/t²: t²=0, t≠0. At n=0 the relation is 1=f; for ℤ,f=2 the ring is zero. | Real quotient retains nilpotents; positivity is not silently put into the definitions. |
| Lean rootChartCoaction | n=2: (h⊗t)²=h²⊗t²=1⊗f. At n=0 the polynomial relation is again 1=f. | Both quotient equations hold. |
| Lean rootChartComparison | n=2,f=2 over ℤ/4: t⊗t maps to 2h⊗1; 2t⊗t maps to 0. | Comparison uses its actual coaction. |
| Lean injectivity iff | n=1,f=0: true=true. n=2 over ℤ,f=2: true=true; over ℤ/4,f=2: false=false. | Both directions tested, no cancellation of a nilpotent. |
| Lean surjectivity iff | n=1,f=0: true=true. n=2 over ℤ,f=2: false=false; over 𝔽₅,f=3: true=true. | Unit and regularity criteria differ correctly. |
| Total exponent boundary | n=0,A=ℤ,f=2: comparison bijective=true; (n=1 or IsUnit 2)=false. | Strict positivity is necessary and is in both signatures. |
| Explicit finite-ring enumeration | (n,modulus,f)=(2,4,2),(2,8,4),(3,4,2),(2,4,0),(3,2,0),(2,5,3),(2,9,3),(1,4,0),(2,1,0). Computed kernel/cokernel sizes: 2/2,4/4,8/8,4/4,8/8,1/1,3/3,1/1,1/1; annihilator/principal-quotient predictions give exactly these values. | Nine exhaustive finite-model checks, including zero ring. |
| Tensor signs and rank zero | Over ℚ, antisymmetrization/projection on e₁∧e₂ gives 2e₁∧e₂; signed invariant dimensions at dim V=2 and d=0,1,2,3 are 1,2,1,0. At V=0,d=0 the dimension is 1. | No ordinary symmetric-power substitution. |
| Characteristic-two exclusion | On 𝔽₂ and V one-dimensional, the signed invariant square has dimension 1 but ∧²V has dimension 0. | Unit factorial is required for this identification; rational ℓ=2 coefficients still contain 1/2. |
| Nonabelian averaging | On ℚ[S₃], averaging 1 gives Σg/6 and applying it twice gives Σg/6. On ℚ[Q₈] both values are Σg/8. On the trivial group both are 1. | Noncommutativity does not spoil finite averaging; this does not assert averaging over arbitrary infinite groups. |
| Reduced versus full branch | In k[t]/t⁴, t³≠0 and t⁴=0. At growing n the nilpotence order is unbounded; the infinite nilradical has no fixed nilpotence exponent. | Finite nilpotent invariance is not applied as an infinite bounded thickening. |
| Scheme projective-space input | r=0: connected cover degree 1. r=1: g=1−m forces m=1. r≥2 requires the additional hyperplane theorem. | R03; no claim that the curve case proves all dimensions. |
| Weighted fibre versus affine fibre | W(2,1) has a degree-two branched projective cover; its inertia kills the sign generator. In characteristic p, z^p−z=x₁ gives a connected étale degree-p cover of 𝔸³−0. | The quotient simple-connectivity argument must not be replaced by affine simple connectivity. |
| Weighted degree and idele sign | A degree-two place with a=π⁻¹ has deg E(a)=−2; deg O(−E(a))=2. Under b=a⁻¹ the supplier gives O(E(b))=O(x), also degree 2. | Same sign checked in supplier and Layers 6/10. |
| Norm sign and degree | At t²=a, det multiplication by c+dt is c²−ad²; (c,d,a)=(1,1,2) gives −1, branch a=0 gives 1. On ℙ¹ double cover, norm degree of O(1) is 1; pullback degree is doubled. | Sign and the two degree operations differ correctly. |
| Norm obstruction | Over 𝔽₅ with branch {0,∞}, root global units number 8, norm image number 4. (1,1,−1) is outside the image and has order 2. | H¹ boundary is nonzero; naive exactness on Picard classes fails. |
| Negative degree/Frobenius | Scalars at x,y equal 2,3. At x−y both signed tensor and character give 2/3; at 0 both give 1. A cyclic closed-point tensor with one scalar 3 has trace 3, not 3 raised to the point degree. | All-degree normalization retained. |
| Universe/empty data | A lifted two-object diagram still has two lifted objects and the same identity arrows; no genuinely larger third object is created. Empty residue data admits unit 1; empty branch leaves ordinary Picard scalar inertia. | Essential-image and empty-family conventions retained. |
| Domain exclusions | A finite field has q≥2, so q=1 has no field instance. Ramified quadratic calculations exclude p=2; finite-root algebra still includes n=p=2. At a=ε on k[ε]/ε², geometric section value is 0, so the effective locus is empty. | Hypotheses distinguish the different layers; no good-prime restriction added to Layers 1–3. |

### Computed sample, headline and finding checks

The following rows supplement the boundary table above. Equality of algebra maps is tested on coefficients and distinguished roots; labelled groupoids retain their arrow labels. “Pass” means that the displayed instance agrees, not that a future theorem has been proved. Ownership defects remain even when their example is mathematically correct.



| Statement | Instances tried; values computed on both sides | Result / change |
|---|---|---|
| §1.61 changed arrow | n=2, zero section over ℤ/9, label 8; under ℤ/9→𝔽₃, Units.map has value 2 and the changed label is 2. Both satisfy 2²=1. | Pass, retaining the nonidentity stabilizer. |
| §1.122 coherent pullback | ℤ→ℤ/4→𝔽₂, trivial root with n=2,u=−1,y=1,f=−1. Direct and iterated pairs are (1,1); both section equations are 1·1²=1. κ at n=0 sends 1 to 1 along both routes. | Pass, target line transported with root line. |
| §1.123 framed/coordinate equivalence | Over 𝔽₅, n=2, (u,y)=(1,2), label w=3 gives (u′,y′)=(4,1). Section: 3·2=1; unit: 4·3²=1; root: 1·2²=4·1²=4. Inverse label is 2. | Pass both arrow equations and inverse. |
| §1.136 normalization square | B=ℤ/4,u=3,n=2,C=𝔽₂. C⊗B[T]/(T²−3)=𝔽₂[T]/(T²−1)=D_C; both maps give 3↦1,T↦T. At n=0,u=1 both are C[T]. | Pass, including nonflat change. |
| §1.157 Cartesian scheme map | Same rings: the pushout has basis 1,T of length 2 over 𝔽₂, exactly the changed normalization algebra. Projections give coefficient 1 and root T on both sides. | Pass after Spec, with arrows reversed. |
| §1.231 three-step normalization | Extend ℤ→ℤ/4→𝔽₂ by 𝔽₂→𝔽₄. Iterated/direct comparisons both send 3 to 1 and T to T; forward then inverse fixes each generator. | Pass on all structure projections. |
| §2.14 relative diagonal | n=1 over B𝔾_m: relative inertia=1, absolute inertia=𝔾_m. Over 𝔽₂, n=2,f=0: relative inertia μ₂ has rank 2 and nonzero nilpotent in its coordinate ring. | Pass: finite relative diagonal, not finite absolute inertia or étaleness. |
| §3.14 Kummer coordinates | ℚ: [2]₄↦[2]₂≠1; [4]₂=1. 𝔽_p(t): t is not a pth power, while μ_p(k) has 1 point. ℝ: compatible class families number 2, infinite-band real points number 1. | Pass; classes and point groups differ. B24 remains uncertified. |
| §3.87 divisibility representatives | 1+v₂+v₃=κ₆(1+t₆³+t₆²); both transition exponents are 6/2=3 and 6/3=2. | True, but pinned duplicate: R04. |
| §3.200 scaling composition | Over ℂ at f=1 use σ_d=τ_d=exp(2πi/d). At d=6, successive and product scaling send t₆ to ζ₆²t₆; both fix 3. Identity scaling gives t₆. | Pass; zero action excluded. |
| §3.235 unity coefficient composition | ℤ→ℤ/4→𝔽₂: coefficient 7 maps 7↦3↦1, equal to direct 1; at each positive n both maps send h_n to h_n and h_n⁻¹ to h_n⁻¹. | Pass for nonflat changes. |
| §3.313 divisibility coefficient composition | Same chain, f=2: coefficient 7↦1, v₂↦v₂, v₆³↦v₆³=v₂ on both routes. Target parameter is 0 in both. | Pass, semilinear coefficient structure retained. |
| §5.14 frame differential | Z=𝔸², (f₁,f₂)=(x,y) at 0, λ₁=λ₂=1: rank dF=2=rank(dx,dy). For (x,x), ranks are 1 and 1. For f₁=1 the frame derivative is 1, giving rank 1. | Pass, including nonvanishing coordinates. |
| §6.7 idele gluing | At a place of degree 2, a=π⁻¹ gives lattice π⁻¹O and line O(x), degree +2. E(a)=−x, so O(−E(a))=O(x), also +2. Supplier b=a⁻¹ has E(b)=x. | Pass; opposite frame ratio would give −2. |
| §8.6 projective cover | (a,ρ)=(1,1): chart x↦x² has rank 2 and ramification index 2 at 0; (2,1): basis 1,x₁,x₂,x₁x₂ has rank 4=2². In characteristic 2 the derivative is 0, outside the odd-characteristic theorem. | Pass with nonempty weight-one block. |
| Relative regular root geometry, §2.17 | Over 𝔽_p, n=p and f=x, frame atlas eliminates x from z^p=qx: 𝔽_p[z,q,q⁻¹], regular dimension 2. At x=0 inertia μ_p is nonétale. | Regularity passes; DM is separately qualified. |
| Infinite quotient/base change, §§3.398/3.424 | At f=0, n=2→4, t₂ maps to t₄²≠0 with square 0. Under ℤ/4→𝔽₂, both base-change maps fix t_n and send 3 to 1. A split zero-section object retains each compatible μ_n label. | Pass; orbit sets or reduced charts would lose data. |
| Infinite coinvariants, §§3.391/3.401 | Over 𝔽₂,f=0, η(v₂)=e_[1/2]⊗v₂≠e_0⊗v₂ since v₂≠0. For coefficient 1, both expressions are e_0⊗1. | Pass; geometric-point invariants would miss the first inequality. |
| Infinite DVR reduced gerbe, §3.409 | At special parameter 0 over a field, t_n^n=0 while t_n≠0 for n>1; chart reduction kills every t_n and leaves k. At n=2 automorphism group is μ₂, rather than the terminal group. | Reduced residual description passes; full fibre is retained separately. |
| Non-fppf torsor, §§3.121/3.144 | Xⁿ−2 is Eisenstein at 2 and has degree n. A finite extension of degree d cannot contain its root for n>d. Closed residue examples have degrees 1,2; generic κ((0)) has infinite degree. | Theorems use closed points correctly; repair Example by R08. |
| Root Picard quotient, §§4.2/4.9 | Over an algebraically closed field, one branch point: root scalar c=u², kernel u²=1 has size 2. With empty R, scalar automorphisms of L remain 𝔾_m. | Pass; empty branch must not create Bμ₂ or erase 𝔾_m. |
| Signed adelic equivalence, §§6.10–6.12 | At one rational branch over 𝔽₅, allowed constant scalars are {1,4}; each has 2 root labels, so stabilizer size 4. With R empty stabilizer size is 4=card(𝔽₅×). Right quotient alone has sizes 2 and 1. | Pass; the two groupoids are not identified by dropping left arrows. |
| Symmetric line across collisions, §§7.7/7.16 | Two equal branch signs give character (−1)(−1)=1 on kernel ker(μ₂²→μ₂) of size 2; invariant line dimension 1. Mixed signs give −1 and dimension 0, outside identical-line input. | Desired calculation passes; missing restriction input R01. |
| §7.17 middle extension | d=1: L[1] has its line in degree −1. d=2: identical sign tensor has invariant dimension 1 and positive rational kernel cohomology 0. Neither value defines j_!* or the perverse heart. | R01: supply actual perverse operations and pushforward comparison. |
| §7.22 multiplication extension | On distinct degree-one points, scalars 2 and 3 tensor to 6 on both sides. On normal connected products dense restriction determines this scalar; an m-cycle nodal cover restricts to m disconnected copies, giving extra morphisms. | Retain normality and import exact restriction theorem, R01. |
| §7.26 coefficient equivalence | ℤ₃ lattice, ×3: rational map invertible, reduction zero and not invertible. ×2 is invertible both before reduction and on 𝔽₃. | Fail at localization; R02 separates integral reduction. |
| §7.27 proper degree-zero base change | Rational sign on Bμ₂: H⁰=0; trivial line H⁰=E. Integral 2-adic sign: invariants 0, but mod 2 invariants 𝔽₂ of dimension 1. | Pass with its explicit reduction condition; does not repair R02's unconditional clause. |
| §7.28 coarse/nilpotent comparison | For [Spec k[t]/t² /μ₂], t≠0,t²=0; reduced chart has t=0. Rational constant/sign pushforwards have dimensions 1/0 on both. H¹(C₂,𝔽₂) has dimension 1. | Pass, rational and nilpotent qualifications essential. |
| Exterior cohomology, §7.23 | dim H¹=2: d=0,1,2,3 give binomial dimensions 1,2,1,0 in degrees 0,1,2,3. At d=2 the tensor invariant is e₁⊗e₂−e₂⊗e₁. | Pass; ordinary symmetric dimension would be 3. |
| High-degree Abel descent, §8.13 | (g,ρ,d)=(0,1,2): ranks (n,a)=(3,2), evaluation rank 1 and kernel rank 2. (1,1,2): (2,1). At L(−R)=ω, H¹ dimension 1, so the low-degree boundary fails. | Numerical bound passes; geometric route still needs R03. |
| Layer 8 projective-space input | r=0: cover degree 1. r=1: genus equation g=1−m excludes m=2 since it gives −1. r=2: hyperplane restriction would reduce to that same degree. | R03 supplies the missing r≥2 input; R07 corrects its locator. |
| §8.10 weighted quotient | W(2,1): projective cover degree 2; nontrivial intermediate quadratic cover has valuation 1 at z=0 and ramification index 2. Empty-R case is ℙ^(n−1) with weight 1 and trivial inertia. | Fibre calculation passes; misattributed projective theorem remains R03. |
| All-degree normalized character, §9.17 | α_x=2,α_y=3: at D=x−y both signed line and character are 2/3; at −D both are 3/2; at 0 both are 1. Adding D and −D gives product 1. | Pass, including negative degrees and unit. |
| Ramified norm obstruction, §§10.28/10.29 | Squaring cover of ℙ¹: σ*O(1)≅O(1), but pullback degrees are 2ℤ, excluding 1. Over 𝔽₅ with two branch points, root units number 8 and norm image 4. | Pass: a torsor obstruction survives invariance. |
| Quadratic trace, §10.24 | Split degree-two fibre: Frobenius fixes e₁−e₂, trace +1. Inert fibre: it sends e₁−e₂ to its negative, trace −1. Each matches the quadratic Artin value; inversion preserves ±1. | Pass; nonquadratic convention still fixed by §6.7. |
| §3.102 factorial representatives | At factorial level d₂=6, 1+u₁+u₂ equals ι₂(1+t₆³+t₆), while u₁=t₆³. Both sides are the same root polynomial. | R04: existing representative theorem. |
| §1.5 pasting Checks | ℤ→ℤ/4→𝔽₂ sends 3→1 and T→T along both paths; before final reduction, T≠−T in (ℤ/4)[T]/(T²−3). At n=0,u=1 both are polynomial algebras. | R05 replaces generic restatements with these values. |
| §1.45 triple-pasting Checks | Add 𝔽₂→𝔽₄; both collapse orders send (3,T) to (1,T); inverses return the same generators. At n=0 the root remains an unconstrained polynomial variable. | R05: record concrete instances. |
| §3.24 scalar-change Checks | Complex conjugation: ζ₆↦ζ₆⁻¹; twice gives ζ₆; 1↦1. The map is not inversion on coefficients in arbitrary rings, but the specified ring homomorphism on this instance. | R05: distinguish coordinate transport from an arbitrary scalar map. |
| §3.126 cocone Checks | At f=1, root family 1 induces t_n↦1 and 1^n=1; at f=0 over 𝔽₂, t₂↦t₄²≠0; over the zero ring every element is 0=1. | R05: compute legs rather than repeat IsColimit. |
| §3.151 scaling Checks | Over ℂ,f=1, ζ₂=−1,ζ₆=exp(πi/3): t₂↦−t₂, t₆↦ζ₆t₆; composition gives ζ₆²t₆; coefficient 3 remains 3. | R05 excludes the trivial action. |
| §3.219 universal scheme map Checks | Cone from the coherent unit family gives t_n↦1 on rings; under n=2→4 at f=0 both composites give t₄²; empty source has exactly one map. | R05: retain scheme structure and specify actual cones. |
| §§1.240/1.242 stale aliases | O(1) on ℙ¹ has local frames but no global frame; lifted (u,y)=(3,1) over ℤ/4 satisfies 3·1²=3 before and after universe transport. | Mathematics passes; R06 replaces aliases by actual contracts. |
| §3.383 progress prose | At d=6 the Hopf generator has Δ(h₆)=h₆⊗h₆, ε(h₆)=1 and S(h₆)=h₆⁵; multiplying h₆⁵h₆ gives 1. | Retain these named mathematical inputs; remove progress narrative, R06. |
| §4.6 dangling example | For a nontrivial order-two line M on an elliptic base, M²≅O but its frame torsor has 0 global sections; local frame torsors are nonempty. | R06 points to the actual §4.4 example. |
| Layer 3 residue-field Example | A=ℚ[T]: κ((T))=ℚ, degree 1; κ((T²−2))=ℚ(√2), degree 2; κ((0))=ℚ(T), degree ∞. | Fail as written; R08 restricts to closed points. |

The shape audit also read AlgebraicVectorBundles, AlgebraicCurves and JacobianChallenge on main. The package has the required scope, conventions, supplier, layer, Examples, Dependencies, downstream and reference headings. The unresolved Check/style exceptions are R05–R07. `metadata.toml` parses as topic `math.NT`; the source manifest parses as 37 entries (36 certified, one settled uncertified). No source was fetched or manifest entry changed. The source sample did not reveal copied prose or an algorithm target.

## Not verifiable

- **B24:** its §3/p.135 locators, including the seeded §3.14 and the later reduced-gerbe applications, remain settled **uncertified**. The legal text was not available. No new request or renamed manifest key was made. The finite Kummer calculations and the package's independent arbitrary-characteristic coordinate arguments were checked separately; they do not certify the unread source.
- **Two indexed board heads:** the README requests for `packages/SchemeAndStackFoundationsPartII/README.md` at accb0a0 and `packages/VStackSheavesAndLisseCategoriesPartII/README.md` at 0987ba7 returned HTTP 404. Their existence is recorded in the board index, but ownership against their actual package text could not be checked. Local design material is not substituted for those package heads.
- **Source scope:** where the source table identifies an elementary coordinate deduction, the cited source contains the parent construction rather than a separately numbered statement of that exact adapter. The table records that distinction explicitly. B24 is the only unavailable text among the seeded sources; there was no need to fetch or alter the existing manifest.

The report does not certify new Lean proofs: the acceptance file contains its two honest `sorry`s. Numerical and coordinate tests establish the displayed values and expose the listed counterexamples; they are not substitutes for the missing library developments.

## Source issues

- **Misprint** in AGV08 at Appendix B.2, item (3), printed p.53 (AGV08 line 2439): the source says the section is raised to an unrelated exponent m; it should be raised to the defining root exponent d; affects nothing.
- **Error** in AGV08 at Appendix B.2, printed p.54 (AGV08 line 2473): the source says the finite root chart times G_m is the smooth frame chart; it should be the contracted product by the antidiagonal μ_d action; affects the proof.
- **Misprint** in YZ19 at proof of Lemma A.5, printed p.518 (YZ19 line 7281): the source says the idele coefficient uses the local frame after the inverse generic frame; it should use the generic frame after the inverse local frame to match inverse uniformizer with O(x); affects nothing.
- **Misprint** in YZ19 at proof of Lemma A.5, printed p.518 (YZ19 line 7279): the source says the extra root data uses the line-frame symbol τ_R; it should use the root-frame symbol t_R; affects nothing.
- **Gap** in YZ19 at A.3.3, display (A.11), printed p.525 (YZ19 line 7870): the source says the sheaf sequence produces an exact four-term sequence of Picard stacks without specifying its obstruction meaning; it should state based torsor fibres and connecting obstructions, avoiding naive exactness on isomorphism classes; affects a stated result.

The AGV product error is witnessed over ℂ with f=1,d=2: its proposed product has two connected components, while the frame chart is G_m and has one. The YZ sign is witnessed by the lattice π⁻¹O and degree +1. The Picard obstruction is witnessed by O(1) for the squaring cover of ℙ¹: degree 1 is not a pullback degree, while the involution fixes its class. No published correction was independently located.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "15344e547e817d749016f4dfdfe1afbde164e096", "job": "REV-PKG-FunctionFieldArithmeticPartII~2", "model": "gpt-6-astra", "worker": "chris-10"} -->
