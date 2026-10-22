<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/124#issuecomment-6352482078 -->
Red team round 2 pass a (codex) of a42417a

Verdict: needs_changes

1. **F01** (P3) Acceptance file expanded into API and Check padding

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:37`: “Checks that require new analytic results are named theorem targets in `Suggested.lean`”; `packages/ArithmeticDirichletSeriesPartII/Suggested.lean:54`, `:246`, `:339`, `:404`, `:428`, `:446`.

   **Claim:** Projections, API lemmas, named Check specializations and small examples belong in the acceptance file.

   **Witness:** The bodies already exhibit `h.2`, `h.1`, `hz.2.symm.trans hw.2`, `simp`, and `exact monotoneUnsmoothing ...`. The model limit at line 446 is eventually `1 = 1`; bandwidth-two mass is the mass theorem specialized to two.

   **Exact repair text:** “Delete the padded declarations from `Suggested.lean`; keep their mathematical statements as prose API bullets or Checks in the README. Do not replace them with proved versions.” Delete every named declaration containing `_test_`, all five anonymous examples, `HasLaplace.integral_eq`, `HasLaplace.integrable`, `HasLaplace.unique`, `HasLaplace.congr_ae`, `HasLaplace.add`, `HasLaplace.const_smul`, `HasLaplace.comp_mul_left`, and `squaredSinc_nonneg`, `squaredSinc_even`, `squaredSinc_continuous`. The other routine API declarations are also catalogued below for removal from the acceptance file. Retain the genuine headline signatures and the definitions/instance needed to state them. Replace README lines 37–40 with “The README states the API and Checks. Suggested.lean states the headline acceptance theorems on the pinned carriers.” Render removed API/Check identifiers as prose rather than promises of declarations in this file. Change the module heading to “ArithmeticDirichletSeriesPartII: target signatures” and its opening to “The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned APIs. All headline theorems below are statable at these pins.”

   **Repair test:** At `k = 0, a = 1, t = 1`, the deleted model check has `e/e = 1`; at bandwidth two the deleted mass check has `1 = 1`. Their README Checks survive unchanged, while the general Delange and kernel-mass theorems still state the mathematical acceptance criteria. This is a new defect introduced by the r1a.F01/F04 repair strategy under the binding acceptance-test rules of this round.

2. **F02** (P2) The raw remainder need not be analytic at the pole

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:593`: “For `k = 0`, `R` is analytic at `a`.”

   **Claim:** Subtracting the principal term makes the given total function analytic at the boundary point.

   **Witness:** Take `a = A = 1`, `k = 0`, and `F = Function.update (fun s ↦ 1/(s−1)) 1 37`. The package's own boundary Check holds, but `R(1)=37` and `R(1+ε)=0` for `ε>0`.

   **Exact repair text:** “For `k = 0`, the restriction of `R` to the open half-plane has an analytic continuation across `a`; no analyticity of the given total function `R` at `a` is asserted.” Add the README negative-control Check: “Updating the simple model to 37 at its pole leaves PoleBoundary unchanged; its raw remainder is discontinuous at the pole, while its continuation is zero.”

   **Repair test:** For the displayed update, the continuation has value and right-hand limit zero, whereas the raw remainder has value 37 and right-hand limit zero. The repaired sentence uses only the former, as the proof requires.

3. **F03** (P2) Wood's particular series also imposes a real-place condition

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:878`: “series `F_r` … counts homomorphisms into `C₂^(r+1)` with the prescribed inertia restriction relative to `C₂^r × {1}`”. See also lines 25–26 and 979–983.

   **Claim:** The stated inertia-intersection restriction identifies the homomorphisms counted by Wood's `F_r`.

   **Witness:** wood2019 line 1652–1653 additionally requires the product of local images of −1 to be the identity. For `r=1`, the character of ℚ(i) embedded in `{0}×C₂` passes the intersection test but fails this condition.

   **Exact repair text:** “For `r ≥ 1`, Wood's `F_r` counts continuous homomorphisms from the absolute Galois group of ℚ to `C₂^(r+1)` whose finite-prime inertia images meet `C₂^r × {1}` trivially and whose complex conjugation is trivial. The coefficient index is the absolute discriminant of the quadratic character obtained by projection to the last factor (with the trivial homomorphism treated separately). Its pole order at one is `2^r`.” Use that convention in the motivation and HP.4 example, and state that variants allowing nontrivial complex conjugation are separate applications with their own series. Add the README Check: “The homomorphism defined by ℚ(i) into the last C₂ factor satisfies the finite-inertia intersection condition, but is excluded from this F_r because complex conjugation has nontrivial image.”

   **Repair test:** This homomorphism has image `{0}×C₂`; intersection with `C₂×{0}` is `{0}`, while complex conjugation maps to `(0,1)`, not `(0,0)`. The repaired description rejects it, as the source does. The repaired rank-two example still has target rank three and pole order four. This does not re-raise the settled consumer-placement finding.

4. **F04** (P3) The Fejér ownership attribution has no resolvable roadmap locator

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:104`: “The finite Fejér kernels of SieveMethodsAndPrimePatterns live on a circle”.

   **Claim:** A named roadmap already owns these kernels, without a section or target locator.

   **Witness:** `roadmaps show SieveMethodsAndPrimePatterns` reports no matching roadmap on main or in the open-head index. Searches of the board packages and main active/completed folders also return no such folder; the merge order only supplies a name.

   **Exact repair text:** Replace the unsupported attribution and final sentence by “The periodic Fejér kernel is a function on a circle, whereas the squared-sinc kernel developed here is a function on ℝ.” Add “Part B — Completely monotone (and Bernstein) functions” to the preceding OneParameterSemigroups citation. Do not add a supplier edge or gap for this comparison: the proof does not consume a sieve theorem.

   **Repair test:** The circle kernel has a periodic domain; `squaredSinc 1 0 = 1/π` and `squaredSinc 1 (2π) = 0`, so the latter is not 2π-periodic. The valid domain distinction survives without asserting an unavailable owner. The merge-order entry alone does not certify that roadmap's contents.

5. **F05** (P3) The local-pole Check does not discriminate lower-pole perturbations

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:974`: “A perturbation known only to have a local pole is not covered: the dyadic series … has … no counting asymptotic.”

   **Claim:** This Check repeats that an explicit hypothesis is absent; failure of a lower-scale counting limit does not test negligibility at the higher scale.

   **Witness:** For dyadic `b`, `S_b(X) ≤ 2X` for `X ≥ 1`. With `a=1`, `l=0`, `k=1`, `c=0`, `d=b`, the purported negative control still gives `S_d(X)/(X log X) → 0`.

   **Exact repair text:** Replace this Check by “For `a=1`, `k=1`, `l=0`, let `c(n)=d₂(n)`, `d(n)=d₂(n)+(−1)^n` on positive integers, and `b(n)=1`. The coefficientwise error has absolute value one, the majorant has ζ as its series and a simple pole, and both normalized sums tend to one; the signed summatory error lies in `{0,−1}`.” If retaining the dyadic observation outside Checks, say only that it fails the sufficient hypotheses of the stated theorem; do not use it to establish necessity for perturbation negligibility.

   **Repair test:** At cutoffs `N=1,2,3,4`, the new signed summatory errors are `−1,0,−1,0`. Dividing by `X log X` tends to zero. The old dyadic error also tends to zero at this scale despite having no limit after division by X, so it cannot serve this discriminating role.

## Round-one repair verification

All locations in this table are in `packages/ArithmeticDirichletSeriesPartII/` unless another repository-relative path is written. The earlier reports are claims checked against this head, not instructions.

| Earlier finding | Status; repaired passage at this head | Independently checked witness and remaining issue |
| --- | --- | --- |
| r1a.F01: admitted examples | **Partly repaired.** `Suggested.lean:49`: “example … := by”; line 51: “simp [HasLaplace]”. | All five examples now have proofs; zero admitted examples. Promoting the others into named Check theorems introduces S01. The exact old demand for proved examples is superseded by this round's no-padding rule. |
| r1a.F02: invalid import and pins | **Repaired.** `Suggested.lean:2`: “import TauCeti.Order.Northcott.Basic”; `README.md:133`, `:172`: “pinned 6b7abb3c”, “pinned a91d3aaf”. | Both checked-out library HEADs equal `lake-manifest.json`; `TauCeti/Order/Northcott/Basic.lean:102` defines the imported summatory. |
| r1a.F03: Wood rank shift | **Repaired (rank correction).** `README.md:1029`: “count into `C₂³`, with inertia intersecting `C₂² × {1}` trivially (`r = 2`)”. | wood2019 line 1586 and line 1692: base rank two, target rank three, pole order four, exponent three. The omitted real-place condition in the description of the particular series is separately audited below. |
| r1a.F04: missing Check mirrors | **Partly repaired.** `README.md:39`: “results are named theorem targets in `Suggested.lean`”. | The cited missing mathematical Checks have statements or proved examples; the removed growth-policy bullet is absent. Their promotion and the additional API catalogue violate the present acceptance-test contract (S01); no demand to add still more mirrors is re-raised. |
| r1a.F05: missing manifest and GMR locator | **Repaired.** `sources.toml:1` records schema `tauceti-roadmap-sources/v1`; `README.md:1107`: “§4.1, pp. 790–791, equation (4.4), and §4.3, pp. 796–797”. | Four source entries and four supplied legal extractions; gmr2019 line 1944 gives the resolvent identity, line 2202 the boundary continuation, line 2205 the separate uniform conclusion. |
| r1a.F06: process text, parent links, catalogue | **Partly repaired.** `README.md:188`: “From [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) (completed)”. | All three parent links use the completed folder; no pull-request number remains in README/docstrings; the trailing omitted-name catalogue is gone. Replacing the catalogue by actual API declarations introduces S01. |
| r1a.F07: zero action | **Repaired.** `README.md:279`: “`[SMulZeroClass ℂ E]`”. | `Suggested.lean:49` carries the same instance explicitly. For the old action `z • x = 1` on ℝ, the zero integrand would equal one; this action does not satisfy the added instance. With the instance, integrand and integral both equal zero. |
| r1a.F08: arbitrary Stieltjes comparison | **Repaired.** `README.md:243`: “For the nonnegative coefficient counting functions of HP.4.1, termwise integration gives the ordinary Laplace transform `F(s)/s`”. | HP.4.1 includes convergence at the chosen `Re s > 0`. The bounded oscillatory counterexample `sin(1/t²)` is not such a counting function. Unit mass at one gives `1/s`, and at two gives `2^(−s)/s`. |
| r1b.F01: active-parent heading | **Repaired.** `README.md:188`: “(completed)”. | `Completed/ArithmeticDirichletSeries/README.md:227`, `:337`, `:353` contain the cited summatory and Wiener–Ikehara sections. |
| r1b.F02: nonexistent ST.3 owner | **Repaired by removing the claim; settled external placement.** `README.md:1084`: “These are conditional applications of the generic theorems here.” | Neither ST.3 nor a supplier edge to ArithmeticStatisticsPartV remains. The repair report's “not actionable in this package” reason is valid: an earlier arithmetic application cannot be declared a later consumer here. The analytic theorem carries the needed coefficient/boundary hypotheses; no missing supplier gap is inferred. Not re-raised. |
| r1b.F03: time-bound wording | **Repaired.** `README.md:85`: “Tau Ceti proves them as …”. | “Current” is removed; each listed Wiener–Ikehara declaration is checked at the actual pin below. |

## Verified sound

Read all 1112 README lines and all 634 Lean lines. The file has **82 explicit declarations: 77 named declarations and five anonymous examples**. Compared all 77 supplied elaborated signatures with the README and explicit binder lists; no dropped binder was found. The only section variables are those of HasLaplace at line 35, ending at line 45; all later theorem hypotheses are explicit. No new Lean command was run. The mathematical tables record inspection and calculation, not proof certification.

### Every Lean declaration, including instances and anonymous examples

Locations below mean `packages/ArithmeticDirichletSeriesPartII/Suggested.lean`. N denotes ℕ. Standard ℝ/ℂ/ℕ instances are fixed except where a generic E and its instances are explicitly listed. All quantified constants/functions in each context are the explicit binders in that declaration. S01 means delete that declaration from Suggested.lean, keeping its mathematical statement in README prose.

| Declaration and line | Section, variables and instances | Instances; computed values on the two sides | Result/change |
| --- | --- | --- | --- |
| `northcott_natId` (instance, 28) | HP.4; N→N; native Northcott | b=0,1,2: sublevels {0},{0,1},{0,1,2}, cardinalities 1,2,3. Constant-zero height instead has infinite sublevel at 0. | Keep needed instance. |
| `HasLaplace` (def, 41) | HP.0; E:Type u, normed additive group, real normed space, complex SMul; f,s,z,μ | E=ℂ: μ=0 gives integral 0 and exactly z=0; f=1,s=2 gives 1/2; f=1,s=0 has infinite norm integral but total integral 0, hence predicate false. E=0 gives 0=0. Non-zero-preserving action z•x=1 rejects the zero Check. | Keep definition; r1a.F07 fixed. |
| Anonymous example at 49 | HP.0; E:Type u, normed additive group, real normed space, SMulZeroClass ℂ E; s,μ | μ=0, Lebesgue half-line, or Dirac 0: integrand 0 and integral 0 in each case; z•x=1 fails SMulZeroClass since z•0=1≠0. | S01: delete example. |
| `HasLaplace.integral_eq` (theorem, 54) | HP.0; generic E as HasLaplace; h:HasLaplace f s z μ | f=1,s=2,z=1/2 gives second conjunct 1/2=1/2; μ=0 gives 0=0. Body h.2 is the conclusion projection. | S01: delete API projection. |
| `HasLaplace.integrable` (theorem, 59) | HP.0; generic E as HasLaplace; h:HasLaplace f s z μ | f=1,s=2: norm integral 1/2<∞; f=1,s=0: norm integral ∞, hypothesis false. Body h.1 is the first conjunct. | S01: delete API projection. |
| `HasLaplace.unique` (theorem, 64) | HP.0; generic E as HasLaplace; hz,hw at same f,s,μ | f=1,s=2 forces z=w=1/2; z=0,w=1 cannot both satisfy integral value. Body is equality transitivity. | S01: delete API lemma. |
| `HasLaplace.congr_ae` (theorem, 69) | HP.0; generic E as HasLaplace; hf and AE equality for same μ | Change f=1 to g(0)=37 under half-line volume: both integrals 1/2 at s=2. With μ=δ₀, values 1 and37 differ, so AE equality correctly fails. | S01: delete API lemma. |
| `HasLaplace.add` (theorem, 75) | HP.0; generic E, real normed space, DistribSMul ℂ E; hf,hg | E=ℂ, f=1,g=2,s=2: transforms 1/2,1, sum 3/2 equals transform of3; μ=0 yields0+0=0. | S01: delete API lemma. |
| `HasLaplace.const_smul` (theorem, 82) | HP.0; generic E with real/complex NormedSpace and IsScalarTower ℝ ℂ E | f=1,s=2: scalars0,1,i give0,1/2,i/2 on both sides; no completeness used to infer existence beyond explicit HasLaplace. | S01: delete API lemma. |
| `HasLaplace.comp_mul_left` (theorem, 88) | HP.0; same compatible normed scalar actions; c>0, hf at s/c | f(t)=t,s=2,c=2: input transform at1 is1; c⁻¹ input=1/2; transform of2t at2 is1/2. At c=1 both sides1/4; c=0 excluded. | S01: delete API lemma. |
| Anonymous example at 95 | HP.0; s:ℂ, Re s>0 | f=1: s=1,2,1+i give1,1/2,(1−i)/2 on both sides; s=0 excluded. Direct pinned exponential-integral lemma. | S01: delete example. |
| `HasLaplace_test_quadratic` (theorem, 101) | HP.0; s:ℂ, Re s>0 | f=t²: s=1,2 give2 and1/4; wrong Stieltjes formula gives2 and1/2. At1+i value−(1+i)/2=2/(1+i)³. | S01: delete Check theorem. |
| `HasLaplace_test_nonintegrable` (theorem, 107) | HP.0; no binders, standard ℂ | At s=0 constant-one norm integral is∞, total integral is0; HasLaplace is false despite value0=0. | S01: delete Check theorem. |
| `PoleBoundary` (structure, 116) | HP.0; F:ℂ→ℂ, a,A:ℝ, k:N; three Prop fields | Model A=1 at a=−1,0,2 and k=0,1 gives F(a+1)=1, F(a+2)=1/2 or1/4. Zero F allows A=0 at every k; A=1 fails. Boundary update to37 leaves all agreements true; dyadic away germ fails at1+2πi/log2. | Keep genuine predicate; S02 for raw-remainder prose. |
| `PoleBoundary.congr` (theorem, 128) | HP.0; F,G,a,A,k; boundary h and equality for all Re s>a | F=1/(s−1), G(1)=37 and G=F elsewhere: equality on open half-plane and both PoleBoundary predicates true; F(1)=0≠37 is allowed. | S01: delete API lemma. |
| `PoleBoundary.leading_unique` (theorem, 134) | HP.0; F,a,k,A,B; both boundary hypotheses | F=1/(s−1) forces A=B=1; requested B=2 would give1=2 and cannot satisfy pole field. Zero F forces A=B=0. | S01: delete API lemma. |
| `PoleBoundary.order_unique` (theorem, 139) | HP.0; F,a,k,l,A,B; both boundary predicates and A,B≠0 | F=1/(s−1) admits k=0,A=1 and k=1,B=0; B≠0 excludes this unequal-order pair. Nonzero pair has k=l=0. Zero F fails both nonzero hypotheses. | S01: delete API lemma. |
| `PoleBoundary.div_argument` (theorem, 145) | HP.0; F,a,A,k, a>0, boundary h | F=1/(s−2)² gives numerator A/a=1/2 at2 after division bys. At a=0, F=1/s becomes1/s², order2 instead of1; hypothesis excludes it. | S01: delete API lemma. |
| `PoleBoundary.rescale` (theorem, 151) | HP.0; F,a,A,k, a>0, boundary h | a=2,A=1,k=0,1,3: F(2s)=1/[2^(k+1)(s−1)^(k+1)], coefficients1/2,1/4,1/16; a=0 excluded. | S01: delete API lemma. |
| `PoleBoundary.mul_regular` (theorem, 157) | HP.0; F,H,a,A,C,k; H analytic on closed half-plane, H(a)=C | F=1/(s−1)²; H=0,1,s−1 gives requested coefficients0,1,0 and actual orders0,2,1. A zero leading value correctly permits lower order. | S01: delete API lemma. |
| `PoleBoundary.mul` (theorem, 163) | HP.0; F,G,a,A,B,k,l; both boundary predicates | Two simple poles with A=2,B=3 multiply to6/(s−a)²: index0+0+1=1, coefficient6. Simple times double gives index2/order3. Zero factor gives coefficient0. | S01: delete API lemma. |
| `PoleBoundary_test_model` (theorem, 170) | HP.0; all a,A:ℝ,k:N | A=0 makes zero function and numerator0; A=−1,k=2,a=0 gives F(1)=−1,F(2)=−1/8, analytic away from0, coefficient−1. | S01: delete Check theorem. |
| `PoleBoundary_test_boundary_value` (theorem, 175) | HP.0; no binders | F(1)=37,F(2)=1: the open-half-plane numerator is1 and the boundary predicate true; raw principal subtraction has R(1)=37 versus right limit0. | S01: delete Check theorem; S02 prose. |
| `PoleBoundary_test_wrong_leading` (theorem, 180) | HP.0; no binders | Along s=1+ε, (s−1)F(s)=1, whose limit1 is not claimed coefficient2; negated predicate true. | S01: delete Check theorem. |
| `PoleBoundary_test_dyadic` (theorem, 186) | HP.0; no binders | At s₀=1+2πi/log2, denominator0. Along s₀+ε, F=1/(1−2^(−ε))→∞, so no analytic away germ; local coefficient1/log2 remains correct. | S01: delete Check theorem. |
| `PoleBoundary_test_zero_not_exact` (theorem, 191) | HP.0; a,A:ℝ,k:N,A≠0 | F=0 gives normalized numerator0 at every point of a right cap, hence g(a)=0; A=1 or−1 impossible, whereas excluded A=0 works for k=0,2. | S01: delete Check theorem. |
| `squaredSinc` (def, 200) | HP.1; ell,v:ℝ | ell=−1,0,1,2 at v=0 gives−1/π,0,1/π,2/π; ell=1 at v=π gives0, at v=π/2 gives4/π³. Negative/zero bandwidth are not probability densities. | Keep definition. |
| Anonymous example at 204 | HP.1; ell:ℝ | ell=−1,0,2 gives origin values−1/π,0,2/π, exactly ell/π. One simp calculation. | S01: delete example. |
| Anonymous example at 208 | HP.1; ell>0 | ell=1,2 gives K₁(π)=K₂(π/2)=0. Half-frequency wrong model gives4/π³ and8/π³ respectively, both nonzero. | S01: delete example. |
| `squaredSinc_nonneg` (theorem, 212) | HP.1; ell>0,v:ℝ | ell=1,v=0,π gives1/π≥0 and0≥0. ell=−1,v=0 gives−1/π<0 and is excluded. One mul_nonneg/sq_nonneg proof. | S01: delete API lemma. |
| `squaredSinc_even` (theorem, 216) | HP.1; ell,v:ℝ | ell=1,v=π/2: both±v give4/π³; ell=−1 gives−4/π³ on both sides. Real.sinc_neg proves evenness by simp. | S01: delete API lemma. |
| `squaredSinc_continuous` (theorem, 220) | HP.1; ell:ℝ | ell=0 is constant0; ell=2 limit v→0 is2/π=K₂(0). Body unfolds definition and calls fun_prop. | S01: delete API lemma. |
| `squaredSinc_integrable` (theorem, 225) | HP.1; ell>0 | ell=1,2: integral of absolute kernel=1 in each case; outer bound1/(π ell v²) has finite tail2/(π ell R). At ell=0 integrability also true, though excluded. | S01: delete routine API statement. |
| `squaredSinc_mass` (theorem, 229) | HP.1; ell>0 | ell=1,2: substitution w=ell v gives(ell/π)(π/ell)=1. ell=0 gives0≠1 and ell=−1 gives−1≠1; both excluded. | Keep kernel milestone. |
| `squaredSinc_fourier` (theorem, 234) | HP.1; ell>0,v:ℝ | v=0: triangle area2ell times1/(2π)=ell/π; v=π/ell: (1−cos2π)/(ell v²)=0, matching kernel0. v=π/(2ell): RHS4ell/π³ equals LHS. | Keep Fourier milestone. |
| `squaredSinc_tail` (theorem, 241) | HP.1; h>0, ell→∞ | For ell>0 tail≤2/(π ell h); h=1,2 give2/(π ell),1/(π ell), both→0. If h=0 the tail is whole mass1, so hypothesis matters. | S01: delete routine API statement. |
| `squaredSinc_test_mass_two` (theorem, 246) | HP.1; no binders | ell=2: mass(2/π)(π/2)=1; direct specialization squaredSinc_mass. | S01: delete Check theorem. |
| `delangeWeight` (def, 252) | HP.1; k:N,t:ℝ | k=0 at t=−1,0,1 gives1−e,0,1−e⁻¹. At t=1, k=1,2 gives1−2/e and1−5/(2e). Wrong missing-factorial model doubles the latter. | Keep definition. |
| Anonymous example at 256 | HP.1; k:N | k=0,1,2,3 at t=0 gives0 times a finite integral=0; natural0⁰=1 does not change external zero. | S01: delete example. |
| `delangeWeight_continuous` (theorem, 260) | HP.1; k:N | k=0 limit at0 is0; general w_k(t)=t/(k!(k+1))+O(t²), so limit0 from both sides. k=1 slope1/2, k=2 slope1/6. | S01: delete routine API statement. |
| `delangeWeight_nonneg` (theorem, 264) | HP.1; k:N,t≥0 | k=0,1 at t=0 give0; at t=1 give1−1/e>0 and1−2/e>0. At t=−1, w₀=1−e<0, correctly excluded. | S01: delete routine API statement. |
| `delangeWeight_pos` (theorem, 268) | HP.1; k:N,t>0 | At t=1, k=0,1,2: 0.63212056,0.26424112,0.08030140>0. At t=0 all zero, excluded by strict positivity. | S01: delete routine API statement. |
| `delangeWeight_test_double` (theorem, 272) | HP.1; t:ℝ | At t=−1,0,1, t w₁(t) equals1,0,1−2/e on both sides; w₁(−1)=−1. Totalized origin does not divide by zero. | S01: delete Check theorem. |
| `delangeWeight_test_simple` (theorem, 277) | HP.1; t:ℝ | At t=−1,0,1 both sides1−e,0,1−1/e. | S01: delete Check theorem. |
| `delangeWeight_test_triple` (theorem, 282) | HP.1; t:ℝ | At t=−1,0,1 both sides1−e/2,0,1−5/(2e). Missing1/2! gives twice these nonzero values. | S01: delete Check theorem. |
| `delangeWeight_normalization` (theorem, 286) | HP.1; k:N | k=0,1,2,3: w_k(t)t^k=1−e^(−t)Σ_{j=0}^k t^j/j!→1 in each case; at t=0 value0 for every k. | Keep normalization milestone; native Gamma comparison recorded. |
| `delangeWeight_shift` (theorem, 291) | HP.1; k:N,h:ℝ | h=0 gives quotient1 for t>0; h=1,−1 at k=0 gives(1−e^(−t∓1))/(1−e^(−t))→1. k=2 has additional t²/(t±1)²→1. | Keep shift milestone. |
| `delangeWeight_shift_uniform` (theorem, 296) | HP.1; k:N,H>0; ε>0 then eventually t then every \|h\|≤H | H=1,k=1,t>2: t/(t+h) lies between t/(t+1) and t/(t−1), both→1; normalized Gamma factors uniformly between values at t−1,t+1, both→1. H=0 would be exactly1. | S01: delete routine API statement. |
| `delangeWeight_bound` (theorem, 302) | HP.1; k:N,t≥0 | t=0 gives0≤1; k=0,1,2,t=1 gives1−1/e,1−2/e,1−5/(2e), each≤1; t→∞ increases normalized values to1. | S01: delete routine API statement. |
| `integerGammaLaplace` (theorem, 309) | HP.2; k:N,a:ℝ,s:ℂ,a<Re s | For a=−1,0,2 and s=a+2, k=0,1,2,3 gives1/2,1/4,1/4,3/8, exactly k!/2^(k+1). At s=a+1+i,k=1 gives−i/2. At s=a nonintegrable t^k is excluded. | Keep headline. |
| `integerGammaLaplace_test_zero` (theorem, 315) | HP.2; a:ℝ,s:ℂ,a<Re s | At s=a+1,a+2 transform is1,1/2; specialization k=0 of integerGammaLaplace. | S01: delete Check theorem. |
| `integerGammaLaplace_test_one` (theorem, 320) | HP.2; a:ℝ,s:ℂ,a<Re s | At s=a+1,a+2 transform is1,1/4; specialization k=1 of integerGammaLaplace. | S01: delete Check theorem. |
| `regularizedBoundaryL1` (theorem, 328) | HP.2; F,a,A,k; boundary h; ε→0+ and every L>0 | Exact model gives R=H=b=0 and L¹-error0 for all ε,L. k=0 analytic extension R=s gives H=−1=b, error0. k=1,R=1/(s−a) gives logarithmic b with ∫₀^δ\|log y\|dy=δ(1−logδ)<∞. | Keep headline; S02 changes only prose about raw R. |
| `regularizedBoundary_test_model` (theorem, 339) | HP.2; a,A:ℝ,k:N; all s:ℂ | F minus itself is0 even at the pole (0/0=0); derivative0, integrand0, integral0. Existing proof is simp. | S01: delete Check theorem. |
| `regularizedBoundary_test_log` (theorem, 347) | HP.2; y:ℝ,y≠0,c:ℂ | c=1,y=1: both sides(log2)/2−1/2+i(1/2−π/4); y=−1 is its conjugate. c=0 gives0=0. At y=0 integral diverges; excluded. | S01: delete Check theorem. |
| `delangeSmoothedLimit` (theorem, 356) | HP.2; α,F,a,A,k; a>0, monotone/nonnegative α, transforms and boundary; ell>0 | α=0,A=0 gives convolution0 and limit0; α=e^(at)t^k,A=k! gives limit1 at ell=1,2. At k=1,α=e^(at),A=0 (lower order) gives normalized weight J=w₁→0 and limit0. | Keep headline; no growth hypothesis hidden. |
| `delangeSmoothedLimit_test_model` (theorem, 368) | HP.2; k:N,a>0,ell>0 | After cancellation integrand is w_k(t)t^k K_ell(t−T); k=0,1,3 and ell=1,2 give limit1×mass1=1. Integrable bounded factor≤1. | S01: delete Check theorem. |
| `monotoneUnsmoothing` (theorem, 379) | HP.3; α,a,C,k; a>0,C≥0, monotone/nonnegative α; all bandwidths integrable and limit C | α=0,C=0 gives ratio0. α=2e^(at)t^k,C=2 gives eventual ratio2 and convolution limit2. Single-bandwidth model 1+0.1cos3t at a=ell=1 gives smoothed1 but limsup1.1,liminf0.9, excluded by all-bandwidth quantifier. | Keep headline. |
| `monotoneUnsmoothing_test_one_bandwidth` (theorem, 393) | HP.3; a,C,ell>0,k:N; existential α | a=C=ell=1,ε=0.1<1/4: eventually J=1+0.1cos3t, monotonicity margin≥1−1/3−o(1)>0; Fourier triangle at3 is0, smoothed limit1; normalized limsup1.1,liminf0.9. k=0,2 give same limits. | S01: delete Check theorem (keep README counterexample). |
| `monotoneUnsmoothing_test_zero` (theorem, 404) | HP.3; same α hypotheses; smooth limits zero at all ell | α=0: every integral0, ratio0; α=1,k=0,a=1 gives ratio e^(−t)→0. Body applies monotoneUnsmoothing with C=0. | S01: delete Check theorem. |
| `delangeLaplace` (theorem, 418) | HP.3; α,F,a,A,k; a,A>0, monotone/nonnegative α, transform, boundary | α=2e^(at)t^k yields A=2k!: for k=0,1,2,3, ratio2 and A/k!=2. α=0 cannot satisfy A>0. Changing α(0) from1 to0 for e^t leaves integral and limit1 unchanged. | Keep headline. |
| `delangeLaplace_test_simple` (theorem, 428) | HP.3; main hypotheses at k=0 | α=2e^t gives ratio2 and A=2; body simpa using general theorem. | S01: delete Check theorem. |
| `delangeLaplace_test_double` (theorem, 437) | HP.3; main hypotheses at k=1 | α=2te^t gives ratio2 and A=2; body simpa using general theorem. | S01: delete Check theorem. |
| `delangeLaplace_test_model` (theorem, 446) | HP.3; k:N,a:ℝ; no theorem objects beyond raw model | For t>0 denominator e^(at)t^k≠0 and quotient1; a=−1,0,2,k=0,1,3 all yield1. For k>0 at t=0 totalized quotient0, irrelevant to atTop. | S01: delete Check theorem. |
| `logSummatory_hasLaplace` (theorem, 456) | HP.4; c:N→ℝ,F,s; c≥0,Re s>0,LSeriesHasSum at s | c=δ₁: α=1, F=1, transform1/s; c=δ₂,s=2: F=1/4, transform1/8. c₀=37 contributes0. Zero c gives integral0, α(0)=0; positive cutoffs t=0,log2 give c₁,c₁+c₂. | Keep headline. |
| `logSummatory_test_initial` (theorem, 466) | HP.4; arbitrary c:N→ℝ | c₀=99,c₁=3,c₂=−5: cutoff exp0=1 includes zero-suppressed0 and3, result3=c₁; c₀ alone gives0. | S01: delete Check theorem. |
| `logSummatory_test_unit_mass` (theorem, 472) | HP.4; s:ℂ,Re s>0 | δ₁ at t=0,1 has count1; at s=1,2 transform1,1/2. Wrong Stieltjes choice gives1 at s=2 instead of1/2. | S01: delete Check theorem. |
| `logSummatory_test_endpoint` (theorem, 480) | HP.4; arbitrary c:N→ℝ | c₀=99,c₁=3,c₂=−5: exp(log2)=2, sum0+3−5=−2=c₁+c₂; exclusive cutoff would3. | S01: delete Check theorem. |
| `delangeDirichlet` (theorem, 488) | HP.4; c≥0,A>0,k:N,F; all Re s>1 sums and boundary | c=1,d₂,d₄ give k=0,1,3 and limits1,1,1/6=A/k!. Zero c cannot have A>0. At X=0,1 higher-log denominator vanishes but eventual positivity for X>1 controls limit. | Keep headline. |
| `counting_test_ones` (theorem, 498) | HP.4; no binders | c=1: cutoff1,2,2.5 gives sums1,2,2 and ratios1,1,0.8; floorX/X→1. ζ(s) at real2 isπ²/6; normalized boundary coefficient1. | S01: delete Check theorem. |
| `delangeDirichlet_positiveAbscissa` (theorem, 507) | HP.4; c≥0,a,A>0,k:N,F; all Re s>a sums and boundary | a=2,c(n)=n,k=0: S(N)=N(N+1)/2, ratio→1/2=A/a. a=1,d₄ gives1/6. a=0,c=1/n has S~logX→∞ versus predicted totalized coefficient1/0=0; excluded. | Keep headline. |
| `counting_test_abscissa_two` (theorem, 518) | HP.4; no binders | N=1,2,3: S=1,3,6, S/N²=1,3/4,2/3; formula(1+1/N)/2→1/2. | S01: delete Check theorem. |
| `counting_test_abscissa_zero` (theorem, 523) | HP.4; no binders | c₀=0 by inverse-zero; c₁=1,c₂=1/2. F=ζ(s+1) has simple coefficient1; F/s double coefficient1; S(1)=1,S(2)=3/2 and S(X)/logX→1, S→∞. | S01: delete Check theorem. |
| `finiteChange_asymptotic` (theorem, 535) | HP.4; c,d:N→ℝ,a>0,C:ℝ,k:N; cofinite agreement and c limit | No modification or c₀-only modification gives difference0; adding7 at1 gives difference7 for X≥1; −3 at2 gives−3 for X≥2. Each divided by X^a log^kX→0, including C=0 and signed c. | Keep headline. |
| `lowerPole_perturbation` (theorem, 547) | HP.4; c,d,b,G,a,B,C,k,l; a,B>0,l<k,b≥0,error bound, majorant series+boundary,c limit | a=1,l=0,k=1,b=1,d=c+(−1)^n gives \|error\|=1, summatory error0 or−1, normalized error→0. Equal l=k=0,c=b=1,d=2 changes1→2 and is excluded. k=0 admits no l<k. | Keep headline; S05 fixes the accompanying Check. |
| `lowerPole_test_equal_order` (theorem, 561) | HP.4; no binders | At every positive n,\|2−1\|=1≤1; counts floorX and2floorX give limits1 and2, unequal. Zero term suppressed both times. | S01: delete Check theorem. |
| `zetaSquare_counting` (theorem, 573) | HP.5; no binders | d₂(0,1,2,4)=0,1,2,3. Local factorΣ(j+1)z^j=(1−z)⁻², ζ² leading coefficient1/order2, count constant1/1!=1. | Keep headline. |
| `counting_test_divisor_fourfold` (theorem, 585) | HP.5; no binders | d₄(0,1,2,4)=0,1,4,10; convolution at4 gives3+4+3=10. ζ⁴ numerator1/order4, main coefficient1/3!=1/6 versus wrong1/3,1/2,1/24. | S01: delete Check theorem. |
| `counting_test_insert_one` (theorem, 597) | HP.5; no binders | At X=1,2,4 sums d₂ are1,3,8, altered8,10,15; difference7 at every X≥1, normalized correction7/(X logX)→0 and limit remains1. | S01: delete Check theorem. |
| `dyadicLocalPoleCounterexample` (theorem, 606) | HP.5; let c=dyadic indicator times n, F=geometric quotient | c(0,1,2,3,4)=0,1,2,0,4; at s=2 seriesΣ2^(−j)=2=F(2). Residue1/log2≈1.442695; at j=0,1,2,3 first ratios1,3/2,7/4,15/8→2, second1,7/6,5/4,31/24→4/3. Additional pole1+2πi/log2 violates away. | Keep headline. |
| `dyadic_test_values` (theorem, 624) | HP.5; j:N and dyadic c | j=0,1,2,3: S(2^j)=1,3,7,15 equals2^(j+1)−1; S(3·2^j)=3,7,15,31 equals2^(j+2)−1. | S01: delete Check theorem. |
| `dyadic_test_residue` (theorem, 631) | HP.5; no binders | 1/log2≈1.442695 lies between4/3≈1.333333 and2; equivalently1/2<log2<3/4, a scalar inequality with no roadmap object. | S01: delete Check theorem. |

### Every bold README target

All locations in this table mean `packages/ArithmeticDirichletSeriesPartII/README.md`. Each target's accompanying API appears in the declaration table, including the seven transform APIs, seven boundary APIs, seven kernel APIs and seven weight APIs.

| Target; line | Instances and computed comparisons | Result/change |
| --- | --- | --- |
| HP.0.1 HasLaplace; 231 | ℂ, f=1, s=2: integral=1/2, asserted value=1/2. μ=0: integral=0, only z=0 accepted. f=1,s=0: norm integral∞, total value0; predicate rejects. Wrong action z•0=1 is rejected by the repaired zero Check. | Definition and scalar layers agree; S01 removes padding. |
| HP.0.2 PoleBoundary; 294 | F=A/(s−a)^(k+1), a=−1,0,2: normalized numerator A; A=0 permits lower order. Two simple poles with coefficients2,3 produce order2/coefficient6. Boundary update F(1)=37 preserves predicate. | Fields and arithmetic of orders sound; S02 corrects raw-remainder prose. |
| HP.1.1 squaredSinc; 390 | λ=1,2: origin1/π,2/π; first zerosπ,π/2; whole-line masses1,1. Triangle area2λ gives originλ/π; at v=π/(2λ) both sides4λ/π³. λ=0 has mass0, λ=−1 mass−1. | Positivity hypotheses and factors correct. |
| HP.1.2 delangeWeight; 456 | k=0,1,2 at t=1: 1−1/e,1−2/e,1−5/(2e); at t=0 all0; at t=−1 weights1−e,−1,1−e/2. For k=0,1,2,3 normalized product tends1, not k!. | Total definition and all four Checks agree. |
| HP.2.1 integerGammaLaplace; 538 | s=a+2, a=−1,0,2: for k=0,1,2,3 integrals1/2,1/4,1/4,3/8, equal k!/2^(k+1). At s=a the integrand is t^k with divergent norm integral, excluded. | Generality and factorial correct. |
| HP.2.2 regularizedBoundaryL1; 570 | Exact model: H=b=0, L¹-error0. k=0 and continuation R(s)=s: H=b=−1, error0. k=1,c=1,y=1: b=(log2−1)/2+i(1/2−π/4); local log norm integralδ(1−logδ)<∞. | Headline sound; S02. |
| HP.2.3 delangeSmoothedLimit; 632 | Zero α gives A=0 and limit0. α=e^(at)t^k gives A=k! and limit1 for k=0,1,3, λ=1,2. At k=1 lower model α=e^(at) gives A=0,J=w₁→0. | Positive Fatou argument supplies undamped integrability; no growth assumed. |
| HP.3.1 monotoneUnsmoothing; 718 | α=0 gives C=0 and ratio0; α=2e^(at)t^k gives C=2 and ratio2. For a=C=λ=1, ε=0.1, one-bandwidth example has smooth limit1 and ratio limits0.9,1.1. | All-bandwidth quantifier is essential; compact bound derived before tail estimate. |
| HP.3.2 delangeLaplace; 766 | α=2e^(at)t^k has A=2k!, ratio2=A/k! for k=0,1,2,3. α(0)=0 or1 for α(t)=e^t,t>0 gives identical transform and limit1. | Headline matches source and Lean. |
| HP.4.1 logSummatory_hasLaplace; 818 | c=δ₁,s=2: F=1, ordinary transform1/2. c=δ₂,s=2: F=1/4, transform1/8. c₀=99,c₁=3,c₂=5 gives α(0)=3, α(log2)=8. At s=0,δ₁ series=1 but transform not integrable. | Inclusive/zero-suppressed carrier and 1/s correct. |
| HP.4.2 delangeDirichlet; 861 | c=1,d₂,d₄: pole indices0,1,3; normalized limits1,1,1/6. Raw c₀ disappears. Wood's r=2 target has rank3 and pole order4. | Headline sound; S03 corrects the particular arithmetic example's conditions. |
| HP.4.3 delangeDirichlet_positiveAbscissa; 891 | c(n)=n,a=2,k=0: S(N)/N²=(1+1/N)/2→1/2=A/a. a=1 recovers A/k!. At a=0,c=1/n, S~logX→∞ and F/s gains order2, so excluded. | Generality and constant correct; no division by a=0 permitted. |
| HP.4.4 finiteChange_asymptotic; 929 | Empty change set or index0 only: difference0. Add7 at1: difference7 for X≥1. Add−3 at2: difference−3 for X≥2. Both normalized differences→0 for every a>0,k≥0. | Signed and zero-limit cases sound. |
| HP.4.5 lowerPole_perturbation; 951 | b=1,l=0,k=1: b-scale ratio (floorX/X)/logX→0. Signed error(−1)^n sums0 or−1. Equal l=k=0,c=b=1,d=2 yields limits1 and2, rejected. Dyadic b still gives error≤2/logX→0 at k=1. | Headline sound; S05 corrects a nondiscriminating Check. |
| HP.5.1 zetaSquare_counting; 996 | d₂(0,1,2,4)=0,1,2,3; convolution factors(1−p^(−s))⁻², leading numerator1, order2, count constant1. d₄(4)=3+4+3=10, order4 coefficient1/6. | Arithmetic function and factorial conventions sound. |
| HP.5.2 dyadicLocalPoleCounterexample; 1034 | S(1,2,3,4,6,8,12)=1,3,3,7,7,15,15. At s=2, F=2=Σ2^(−j). Derivative of denominator at1 is+log2. Ratio subsequences→2 and4/3, differing from1/log2≈1.442695. | All asserted clauses sound, including failure of away. |

The **45 README Check bullets** were evaluated, including duplicate occurrences. The four definitions have respectively **4, 5, 3 and 4 Checks** (HasLaplace, PoleBoundary, squaredSinc, delangeWeight). Their computed values occur in the tables above. The unnamed bullets have these explicit values: README 566 gives 2/s³; 855 gives series value1 but norm integral∞ at s=0; 887 gives divisor limit1; 918 gives A/(1·k!)=A/k!; 919 gives A/(a·0!)=A/a=κ/σ; 974 is S05. README 762 states the C=0 specialization rather than a separate discriminating model; its valid concrete instance α=1 gives e^(−at)/t^k→0. Definition-Check counts are met without adding Lean mirrors.

### Convention and adversarial coverage

| Convention or wrong model | Computed witness | Outcome |
| --- | --- | --- |
| Ordinary versus Stieltjes; endpoints | δ₁ at s=2 gives ordinary1/2 versus Stieltjes1; δ₂ gives1/8 versus1/4. c₀=99,c₁=3,c₂=−5 gives S(1)=3,S(2)=−2. | The declared convention and bridge agree. |
| Complex Fourier sign and scaling | At v=π/(2λ), triangle integral8λ/π² times1/(2π)=4λ/π³; odd imaginary part integrates0. Reversing y changes neither symmetric triangle integral. | Factor1/(2π), support2λ, and damped identity's +iyT sign agree. |
| Pole multiplication and dilation | Two simple poles2/z and3/z give6/z², index1. F(2s) for order4 contributes1/16. In counting, division by s at a=2 contributes1/2. | Successor offsets and 1/a correct. |
| Natural powers and junk values | At k=0,t=0, t^k=1 but w_k(0)=0. At k>0,X=1 the log-power denominator is0 and Lean division gives0; only X>1 is used in limits. n=0 term is exactly0. | No false headline arises from a totalized endpoint. In README 960, interpret l−k as an integer exponent; an implementation should use 1/(log X)^(k−l), since natural l−k=0. |
| Zero data, zero measure, signs | Zero α,F,A gives convolution0; A>0 main theorems exclude it. Zero measure forces transform value0. Negative A is allowed only in analytic model/boundary statements. Negative bandwidth has negative mass, excluded where needed. | No conclusion hidden in a vacuous data field. |
| Incomplete or trivial coefficient object | Only the generic HasLaplace API varies E; E=0 gives transform0. All Tauberian statements use native ℝ and ℂ. The Bochner predicate explicitly includes AEStronglyMeasurable and finite norm integral through Integrable. | No arbitrary topology, separation, finite-dimensionality or completeness assumption disappears. |
| Other requested defect classes | Finite groups, S₃/Q₈, characteristic2/3, DVRs, inseparable extensions, nonreduced schemes and universes of geometric carriers are not binders of these statements; substituting them for fixed ℝ/ℂ is ill-typed. The actual rank boundary in the motivation is r≥1; r=2 gives C₂³/order4. | These classes do not supply admissible counterexamples here. The finite-cutoff empty case X<1 gives S=0. |

### Headline coverage and proof direction

The twelve bold theorem targets are integerGammaLaplace, regularizedBoundaryL1, delangeSmoothedLimit, monotoneUnsmoothing, delangeLaplace, logSummatory_hasLaplace, delangeDirichlet, delangeDirichlet_positiveAbscissa, finiteChange_asymptotic, lowerPole_perturbation, zetaSquare_counting and dyadicLocalPoleCounterexample. Each is stated on pinned carriers with the genuine simple definitions it needs. The kernel mass/Fourier and weight normalization/shift milestones are also statable and present. **No statable headline is missing; no headline needs a nonexistent carrier or a weakened stand-in.** The module docstring should say this after S01's cleanup. The four named predicates/functions and the Northcott instance are sufficient; no sorry'd data is used.

The core proof graph is acyclic: HP.0/HP.1 → HP.2 → HP.3 → HP.4; HP.5.1 consumes HP.4 and HP.5.2 consumes HP.0. The finite-change proof uses the pinned eventually-constant difference, and the lower-pole proof uses the previously stated positive-abscissa theorem. Fatou is used on the nonnegative α part, not the signed remainder; the model part is bounded separately. Unsmoothing first derives a global bound for J, then estimates the discarded tails. The prescribed checker on the unchanged README returned exit zero:

```text
depcheck: 14 roadmaps, 101 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The supplied order places this roadmap at line 189; no ownership move is required. There are no declared supplier gaps. Mathematical background in a source is not silently treated as a roadmap supplier.

### Source-locator verification

Checked **18 citation groups across all four cited works**: the 16 target source paragraphs, Osele's predicate-shape citation, and the GMR consumer citation. The table gives the source extraction locators actually read; repeated bibliography/motivation citations use the same passages. No additional work had to be fetched. The correction to the scope of Wood's F_r is S03; it is not a missing-text problem. No source passage has been copied into this report.

| Citation group | Evidence read | Result |
| --- | --- | --- |
| HP.0.1 ordinary transform | delange1954 line 24, line 28, line 333; p.213 and §3.3.1 pp.221–222 | Nonnegative, nondecreasing α; ordinary integral, positive a; the generic predicate is explicitly a local extension of this notation. |
| Osele predicate shape | osele-laplace line 72, line 115, line 121, line 125, line 147, line 192 | Raw source lines121–123 correspond to extraction125–127; weak SMul belongs to the definition, zero preservation to the zero theorem, DistribSMul to additivity. |
| HP.0.2 boundary condition | delange1954 line 818, line 821, line 824, line 871; §5.2.1 pp.235–238 | Holomorphic germs off a, leading term with nonzero numerator; integer power absorbs the regular summand, and positivity forces the real leading coefficient positive. |
| HP.1.1 kernel | delange1954 line 435, line 457, line 489, line 510; §§3.3.3–3.3.5 pp.224–226 | Triangle smoothing and unnormalized massπ; the package divides the resulting kernel byπ. Direct triangle-area computation verifies the package's frequency and factors. |
| HP.1.2 weight | delange1954 line 278, line 285, line 673, line 875; §§3.1–3.2, Lemma3, §5.2.1 p.237 | v, shift asymptotics and the pure-power choice of γ. The source's l<1 belongs to the logarithmic generalization; the stated pure-power substitution supports cutoff1. |
| HP.2.1 Gamma model | delange1954 line 712, line 719, line 721; Lemma4 p.233 | The full half-line Gamma identity is inside the proof, not Lemma4's truncated-integral statement. It has Re exponent>−1 and Re rate>0; integer k≥0 satisfies these. |
| HP.2.2 regularization | delange1954 line 329, line 355, line 386, line 428, line 570, line 585, line 887 | Differentiated regularization, integrable boundary control and the size of the remainder. The package supplies its stronger L¹ argument under holomorphic germs; it does not misquote L¹ as Delange's verbatim theorem. |
| HP.2.3 smoothed limit | delange1954 line 441, line 460, line 496, line 501, line 507 | Damped identity, positivity to remove damping, Fourier decay, bounded model. Constants agree after normalization. |
| HP.3.1 unsmoothing | delange1954 line 520, line 531, line 535, line 537, line 565 | Upper bound first, then derived boundedness and lower bound; bandwidth limit precedes shrinking the window. |
| HP.3.2 Delange | delange1954 line 818–832 and line 24–28 | Theorem III at integer ω=k+1 gives A/Γ(k+1)=A/k! with the stated monotonicity and a>0. |
| HP.4.1 bridge | delange1954 line 24, line 42; wood2019 line 1636, line 1652 | The sources motivate the transform/counting convention; the README explicitly derives its bridge independently. At δ₁ the factor is1/s. |
| HP.4.2 counting / Wood | delange1954 line 818–832; wood2019 line 1586, line 1638, line 1652, line 1692–1695 | Integer-order counting follows. Wood rank repaired; the real-place condition in the particular F_r was omitted (S03). |
| HP.4.3 positive a | delange1954 line 24–28, line 818–832 | Source allows arbitrary positive a; the counting bridge contributes1/a. |
| HP.4.4 finite change | delange1954 line 42–44; wood2019 line 1695–1697 | Constant-shift invariance and treatment of the trivial homomorphism support the stated application; the signed finite-sum proof is supplied by the pin. |
| HP.4.5 lower pole | wood2019 line 1698–1700 | Smaller-group count has a smaller pole. The roadmap explicitly requires a coefficientwise arithmetic majorant rather than claiming Wood constructed that generic analytic API. |
| HP.5.1 ζ² | delange1954 line 818–832; pinned zeta/convolution declarations below | Integer exponent2 gives factorial1; the arithmetic identity is separately pinned. |
| HP.5.2 local pole only | delange1954 line 1046–1058; §5.3 p.242 | Local information gives order of magnitude. The dyadic example is expressly original, and its two limits were recomputed. |
| GMR consumer | gmr2019 line 1908, line 1944, line 2188, line 2195, line 2202, line 2205 | Laplace-resolvent identity, pole decomposition and continuation elsewhere on the boundary; uniformity is separate. The source does not itself use this later roadmap. |

### Pinned supplier evidence and ownership

Verified the actual checkout commits against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main content is `a07e2024f391f3022520c3f8ad194912b3eab614`. Locations below are repository-relative within the named pinned library.

| Pinned names / object | File and line | Hypotheses / consequence checked |
| --- | --- | --- |
| LSeries.term; LSeries; LSeriesHasSum | `Mathlib/NumberTheory/LSeries/Basic.lean:74`, `:164`, `:217` | Term is the if-expression zero at n=0 and f(n)/n^s otherwise; HasSum is an unordered sum in ℂ and hence absolute. No convergence is inferred from the totalized value alone. |
| AnalyticAt; AnalyticOnNhd | `Mathlib/Analysis/Analytic/Basic.lean:110`, `:120` | AnalyticAt means a convergent local power series; AnalyticOnNhd quantifies it at every point of the set. It does not allow an arbitrary changed value at a point of that set (S02). |
| AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq | `Mathlib/Analysis/Analytic/Uniqueness.lean:223` | Both functions analytic on the same preconnected set and equal on a neighborhood of an interior point. The smaller disc and nonempty right cap supply these hypotheses. |
| Integrable | `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58` | Conjunction of AE strong measurability and finite norm integral. It does not silently assert any regularity of the original function at a null endpoint. |
| integral_integral_swap | `Mathlib/MeasureTheory/Integral/Prod.lean:478` | Product-integrability with SFinite measures; the restricted Lebesgue measures used here are σ-finite and satisfy the instances. |
| integral_tsum; tendsto_integral_filter_of_dominated_convergence | `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:88`, `:67` | Countable series and finite sum of norm integrals; for convergence a countably generated filter, AE measurability, integrable bound and AE pointwise limit. |
| lintegral_liminf_le' | `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:216` | ENNReal-valued AE measurable functions and countably generated filter; use nonnegative α integrands, then finite liminf. |
| hasDerivAt_integral_of_dominated_loc_of_deriv_le | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:286` | Local derivative bound, integrability and measurability; the exponential margin σ₀<σ₁<Re s gives the required bound on t times the integrand. |
| integral_comp_mul_left_Ioi | `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1208` | b>0, Jacobian b⁻¹ and transformed endpoint b·a; at a=0 it gives the stated dilation. |
| integrableOn_exp_mul_complex_Ioi; integral_exp_mul_complex_Ioi | `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean:63`, `:87` | Re exponent<0; integral −exp(exponent·c)/exponent. At exponent−2,c=0 the value is1/2. |
| Real.GammaIntegral_convergent; Real.Gamma_nat_eq_factorial; Real.integral_rpow_mul_exp_neg_mul_Ioi | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:66`, `:422`, `:465` | Positive shape/rate; Γ(k+1)=k!. The complex-shape variant at line372 still has a real rate, so it is not the package's arbitrary-complex-rate Gamma theorem. |
| Real.sinc; Real.sinc_neg; Real.abs_sinc_le_one; Real.continuous_sinc | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean:37`, `:51`, `:56`, `:85` | sinc0=1; even and continuous, absolute value≤1. These immediately prove the padded kernel API but not its mass/Fourier pair. |
| Real.tendsto_integral_exp_smul_cocompact | `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:245` | Finite-dimensional Hausdorff real vector space, additive Haar measure; ℝ satisfies them. Frequency variable is a continuous real dual functional. No omitted integrability hypothesis in the declaration; the application nevertheless uses an L¹ function. |
| Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt | `Mathlib/Analysis/Complex/RemovableSingularity.lean:35` | Requires continuity of the repaired numerator at its center and punctured differentiability; the residue limit supplies continuity after setting the value to1. |
| riemannZeta; analyticOn_riemannZeta; zeta_eq_tsum_one_div_nat_cpow; riemannZeta_residue_one | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:120`, `:145`, `:206`, `:241` | Analytic away from1; series formula only for Re s>1; punctured residue limit1. |
| Complex.summable_one_div_nat_cpow | `Mathlib/Analysis/PSeriesComplex.lean:25` | Summability iff Re exponent>1, exactly the region used in ζ examples. |
| LSeriesHasSum.convolution | `Mathlib/NumberTheory/LSeries/Convolution.lean:139` | Two convergent series at the same s; sum of the Dirichlet convolution is the product of sums. |
| ArithmeticFunction.pow_zero_eq_zeta; sigma_zero_apply; zeta_mul_pow_eq_sigma | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:127`, `:178`, `:195` | The arithmetic pow0 function is zeta, and its product with zeta is σ₀. This is distinct from the ring's zeroth multiplicative power. |
| hasSum_geometric_of_norm_lt_one | `Mathlib/Analysis/SpecificLimits/Normed.lean:473` | Norm of ratio<1; dyadic ratio norm is2^(1−Re s)<1. |
| Northcott | `Mathlib/Order/Northcott.lean:36` | Finite lower sublevels only. The instance body for identity ℕ supplies exactly that property using finite Iic, without an extra finite-type assumption. |
| TauCeti.normLE; summatory; mem_normLE_natCast; summatory_eq_summatory_natFloor | `TauCeti/Order/Northcott/Basic.lean:41`, `:102`, `:73`, `:138` | Native finite carrier consists of N(i)≤real cutoff, inclusive; natural-floor equality requires nonnegative cutoff. For negative cutoff the actual carrier is empty; no floor lemma is misused. |
| TauCeti.summatory_nonneg; summatory_mono; eventually_summatory_sub_eq | `TauCeti/Order/Northcott/Basic.lean:155`, `:164`, `:177` | Nonnegative weights for first two; the finite-change result permits any additive commutative group and gives the signed finite difference. |
| TauCeti.Contour.exists_laurent_data_of_meromorphicAt | `TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223` | Finite principal part plus analytic germ, only eventually on the punctured neighborhood. The proof must apply it to the continued quotient, as the README otherwise correctly specifies. |
| TauCeti.Contour.tendsto_integral_sin_mul_div_atTop; tendsto_integral_sinc_atTop | `TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:339`, `:357` | Positive frequency and improper half-line limitπ/2. No absolute integrability of sinc is claimed. |
| TauCeti.LSeries.wienerIkehara; wienerIkehara_zero | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`, `:334` | Continuous separately supplied boundary remainder and half-plane series. Simple-pole cases are already supplied; higher pole is the extension here. |
| TauCeti.LSeries.wienerIkehara_of_eventually_nonneg; wienerIkehara_nat; wienerIkehara_rpow | `TauCeti/NumberTheory/LSeries/WienerIkehara/Variants.lean:60`, `:120`, `:135` | Eventual nonnegativity, inclusive natural cutoffs and positive abscissa; the last constant is κ/σ, matching A/a at k=0. |

Object searches included generic one-sided function transforms, higher poles, real sinc/Fejér kernels, incomplete Gamma weights, summatory carriers and the mathematical hypotheses, not just this package's names. The pinned `TauCeti.regularizedGamma` in `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean:115` already gives normalized incomplete Gamma theory: `tendsto_regularizedGamma_atTop` at line350 and `regularizedGamma_le_one` at line357 supply the corresponding normalized facts after the substitution identity. This does not duplicate the total weight: for t≥0, `w_k(t)t^k=P(k+1,t)`, but at k=0,t=−1 the weight is1−e while the library's P is0. The local weight/shift development belongs here; generic incomplete Gamma theory remains imported.

The pinned Bochner Fejér construction uses a ball overlap ratio (`TauCeti/Analysis/Bochner/Fourier/Nonneg.lean:275`) and finite circle forms (`TauCeti/Analysis/Bochner/Herglotz.lean:75`); neither supplies the real squared-sinc mass/Fourier API. The pinned Wiener–Ikehara approximation uses Schwartz functions (`TauCeti/NumberTheory/LSeries/WienerIkehara/Approximation.lean:18`). Main's `TauCetiRoadmap/TauberianBoundaryConvergence/README.md:21` assumes bounded functions and has an endpoint integral-convergence conclusion, not the present higher-pole counting theorem. `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/README.md:125` defines a transform of one particular hyperbolic weight; `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3024` treats E-function/operator-transfer data. Neither owns the generic HasLaplace predicate in this package.

Cross-roadmap checks resolved the completed parent's three supplier contracts (Layers4.2,9,9.2), its scope exclusion for Layers0–8/10, and OneParameterSemigroups PartB. The sixth distinct attribution, SieveMethodsAndPrimePatterns, could not be resolved (S04). Parent links and API hypotheses were checked on main, not on the open progress/revision pull request. The completed parent's archived finite-change correction at `Completed/ArithmeticDirichletSeries/README.md:230` agrees with the eventually-constant difference used here.

Searched the README and Suggested.lean at **all 13 supplied sibling heads (26 files)**: ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. There are **zero direct supplier citations to these 13 siblings** in this package. EffectiveClassNumbers' two Wiener–Ikehara references (`TauCetiRoadmap/EffectiveClassNumbers/README.md:38`, `:87`) consume the pinned theorem and introduce no competing owner. No shared generic carrier or duplicate fully qualified declaration was found. Board-package/main searches and the required `roadmaps grep` index searches gave no competing owner for the new higher-pole development; other open-head search hits were not treated as authorized suppliers.

### Policy and verification limits

The branch is at the requested head. `git diff --stat origin/main...HEAD` contains six files, all under `packages/ArithmeticDirichletSeriesPartII/`: README.md, Suggested.lean, metadata.toml, the previous repair report, review.json and sources.toml. The report written by this pass is the only new checkout file. No package implementation, manifest, metadata, merge-order or sibling file was changed; no git write, Lean build, remote post or credential access occurred.

The acceptance file has one `import Mathlib` and the existing individually used Tau Ceti module, no set_option, no lemma declarations, no admitted data, no admitted examples, no True placeholder and no computational algorithm. All theorem hypotheses are tied to the transform, boundary or coefficients actually used in their conclusions. README and Lean function arguments, scalar towers, filter directions and summatory cutoffs agree. S01 identifies the 61 declarations to delete; the remaining 21 are the five required definition/instance declarations and sixteen headline or substantive milestone theorem signatures. No standalone API-identifier quota justifies retaining the padding.

Counts: **82 explicit declarations read, 16 bold targets read, 28 API statements read, 18 source-locator groups examined, 45 Check bullets tested, six distinct cross-roadmap attributions checked (five resolved, one S04), 13 sibling heads searched, zero direct supplier citations to those siblings**. No counterexample to a typed headline theorem was found; the mathematical prose/source corrections are S02–S03.

## Not verifiable

- No fresh Lean elaboration or one-tactic execution was run, as required by the read-only brief. All 77 supplied elaborated types were read and compared; the five anonymous examples were inspected directly. The one-tactic witnesses are source inspection (including existing one-line proof bodies), not a claimed new build.
- SieveMethodsAndPrimePatterns' contents cannot be certified from a merge-order name when no corresponding main/open-head/board folder resolves; S04 removes the unsupported attribution without inventing a supplier gap.
- Ownership against the 13 supplied sibling heads was checked. For other open roadmaps, only the permitted search index was consulted; no claims about the full contents of unprovided checkouts are certified.
- No missing legal source remains: all four cited works were available in the supplied cache. No needs-references request is necessary. The independent future proofs behind sorry are not certified by this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a42417a911403591d458dbbb9860c5c78bf0b429", "job": "RT-ArithmeticDirichletSeriesPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
