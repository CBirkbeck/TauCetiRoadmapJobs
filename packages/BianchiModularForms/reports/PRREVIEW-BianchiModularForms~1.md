# Review of BianchiModularForms (pull request #1719 at b5908b3)

**Verdict:** needs changes

## R01 (P1) — Ideal coefficients change when the class representative changes

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:579`, also 241 and 944. Claim: the raw middle-component Fourier coefficient is independent of the ideal representative under §1.5's conjugation.

**Witness:** Replace `𝔞=𝓞_K` by `2𝓞_K`. Natural transport gives `F'₂(x,y)=F₂(2x,2y)`, hence `c'₂𝔞(2α)=4c_𝔞(α)`. Both indices describe the same ideal; coefficients 1 and 4 differ.

**Repair:** Distinguish raw expansion coefficients from arithmetic ideal coefficients. With the stated geometric transport, use `c_𝔞(α)/N𝔞`, and prove its compatibility with the adelic normalization. Alternatively specify and justify a different normalized transport everywhere. Under the first repair the test gives `1/1=4/4=1`; the general-class Mellin sum uses `N𝔞^(s−1)`, not `N𝔞^s`. Reconcile §§4.4, 6.2 and 6.6 with this choice.

## R02 (P1) — The covolume formula applies a subgroup index in the wrong setting

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:348`. Claim: covolume is `[PSL₂(𝓞_K):image]·covolume(PSL₂(𝓞_K))`.

**Witness:** At unit level and principal component, the projective image of `GL₂(𝓞_K)` contains `PSL₂(𝓞_K)` with index 2. Its covolume is `V/2`; it is not a subgroup of the group indexing the displayed formula.

**Repair:** For commensurable images `G` and `P=PSL₂(𝓞_K)`, put `H=G∩P` and use `vol(G)=[P:H]/[G:H]·vol(P)`. This gives `V/2` at unit level, and `Catalan/6` for the Gaussian GL₂ quotient. In §0.4 likewise use commensurability to prove cusp finiteness, rather than asserting that every component is a finite-index subgroup of a conjugate of `GL₂(𝓞_K)`. The supplier's index theorem explicitly assumes inclusion.

## R03 (P1) — The proposed cusp coordinate is not constant on an orbit

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:374`. Claim: the divisor attached to `[c:d]` is `(c)+𝔫`.

**Witness:** For prime level `𝔭`, `[[1,1],[0,1]]∈Γ₀(𝔭)` sends `[0:1]` to `[1:1]`. The proposed divisor changes from `𝔭` to `𝓞_K` on this single orbit.

**Repair:** For primitive coordinates `[a:b]`, use the denominator ideal `(b)+𝔫=(δ)`, fix δ, and use the residue `a·(b/δ)` modulo `𝔤`, with the appropriate GL₂ or SL₂ unit quotient. Prove independence of primitive coordinates and explain how changing δ transports the parametrization. Both cusps in the witness then have divisor `𝓞_K`. Retain the computed 3-versus-4 cusp example, but add this orbit-invariance test: the count alone did not detect the wrong map.

## R04 (P1) — General cusp stabilizers do not have the asserted full unit group

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:364`. Claim: every stabilizer has the infinity stabilizer's shape, and `Γ_c∩N(K)` has rank 2.

**Witness:** Over `ℚ(i)`, level `π²`, `π=2+i`, conjugate the cusp `1/π` to infinity. The lower-left condition is `π(a−d)−π²b∈(π²)`, forcing `a=d` for units. Its rotation group is trivial.

**Repair:** State a rank-two translation lattice extended by the actual finite cusp-dependent unit-ratio subgroup, rather than all pairs of units. Use `Γ_c∩σ_cNσ_c⁻¹`, not a fixed `N`: at cusp 0 the latter intersection is trivial (rank 0). For the witness the rotation group has order 1, whereas at infinity it has order 4; §1.2 then correctly counts only the former.

## R05 (P1) — The fixed coefficient lattice is not preserved by component groups

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:505`, also 744. Claim: `E_k(𝓞_K)` built from `𝓞_K²` is a coefficient lattice for every component.

**Witness:** Set `𝔞=(2)`, `𝔫=𝓞_K`, `k=3`. The component contains `γ=[[1,1/2],[0,1]]`. Acting on `e₂⊗ē₂` produces an `e₁⊗ē₁` coefficient `1/4∉𝓞_K`.

**Repair:** Build the integral coefficient representation from the component lattice `L_𝔞=𝓞_K⊕𝔞` and its conjugate, or explicitly transport an integral model; specify the integral maps used by every Hecke correspondence. In the example `γ(2e₂)=e₁+2e₂`, so the transported tensor lattice is stable. The present §4.6 integrality proof cannot use the lattice written in §1.6.

## R06 (P2) — The integral-lattice theorem needs an arithmetic-group hypothesis

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:501`. Claim: for the unspecified `Γ` of §1.1, integral H¹ modulo torsion is a lattice in rational H¹.

**Witness:** Take the subgroup `Γ={[[1,q],[0,1]]:q∈ℚ}≤GL₂(K)`. Then `Hom(Γ,ℤ)=0` but `Hom(Γ,ℚ)=ℚ`. The proposed integral lattice has rank 0 in a one-dimensional rational space.

**Repair:** Explicitly restrict the arithmetic finiteness and base-change statements to the component groups, or their finite-index subgroups, with the finiteness inputs from §0.6. Keep the unrestricted definition of group cohomology. The counterexample is excluded by the finite-generation hypothesis; `Γ=ℤ` instead gives `ℤ⊗ℚ=ℚ`.

## R07 (P1) — The Petersson metric contradicts the chosen coframe

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:589`. Claim: all three pinned coframe vectors have norm 1.

**Witness:** Writing `x=u+iv`, the hyperbolic Hermitian norm gives `‖−dx/y‖²=‖d x̄/y‖²=2`, `‖dy/y‖²=1`. At inversion and `x=y=1`, §2.1 sends `e₂` to `(1/2,0,−1/2)`, of Euclidean squared norm `1/2`.

**Repair:** Use Gram matrix `diag(2,1,2)`, or rescale the coframe and conjugate every slash/Fourier matrix accordingly. With the Gram matrix, the witness has norm `2/4+2/4=1` on both sides. Recheck the adjoint formulas against this metric.

## R08 (P1) — Archimedean multiplicity one does not remove oldform multiplicity

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:628`. Claim: each cuspidal eigensystem occurs exactly once in H¹.

**Witness:** The roadmap's own §5.2 gives two independent degeneracy images of `121.1-a` at level `(11)(1+i)`. They have the same good-prime eigensystem. Its multiplicity is 2, not 1.

**Repair:** State the contribution as the finite-level invariant space tensored with the one-dimensional archimedean cohomology. Assert multiplicity one on the newspace at conductor level (§5.3), not on all H¹. This gives dimensions 1 at `(11)` and 2 at the raised level, agreeing with §5.2.

## R09 (P2) — The principal-prime coset formula omits the good-prime hypothesis

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:689`, also 666–670. Claim: every principal prime has the displayed `N𝔭+1` cosets.

**Witness:** Set `𝔫=𝔭=(2+i)`. Modulo `𝔭`, every element of `Γdiag(1,π)Γ` has nonzero upper-left entry; `diag(π,1)` has zero there. The purported sixth coset is absent.

**Repair:** Put `𝔭∤𝔫` on the six-coset theorem and retain a separate five-coset U theorem at this bad prime. Correct §4.2's right compact subgroup from `K₀(𝔭)` to `K₀(𝔫)` in the level-`𝔫` double coset, and distinguish the bad-prime correspondence. The same test then gives 6 cosets off the level and 5 on it.

## R10 (P1) — Nonprincipal Hecke operators cannot act on the single SL₂ component

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:781`, also 865. Claim: the same pair construction defines every `T_𝔭` on `H¹_cusp(Γ₀ˢᴸ(𝔫),E_k)`.

**Witness:** For `K=ℚ(√−23)`, a prime above 2 has nontrivial class `g` of order 3. An index-`𝔭` sublattice of `𝓞_K²` has Steinitz class `g`, not 1; no GL₂(K), hence no SL₂(K), map identifies them.

**Repair:** Define the appropriate total space of oriented/component lattices for SL₂-level and the operators between its components, with the GL₂ comparison on that total space. Keep a single-component theorem only for operators that preserve it. In the test the class movement is `1→g`, and three successive movements return to 1. Do not discard nonprincipal primes.

## R11 (P1) — The proposed general-class L-ratio has no well-defined period normalization

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1013` and 1025. Claim: independent primitive generators on different components acquire consistent signs from §1.5.

**Witness:** For class group C₂, §1.5's central maps preserve each component, since every ideal class squares to 1; its conjugations also stay within a class. Independent signs permit weighted sums `|1+1|=2` and `|1−1|=0`.

**Repair:** Construct the rational eigenline in the total Hecke module and intersect that single line with a specified global integral lattice. Choose one primitive generator, with only one simultaneous sign ambiguity, and one period; prove the relative-symbol pairing and its rationality on that lattice. Do not assert a nonzero eigenline on every component without proof. With a global line spanned by `(1,1)`, the allowed sums are ±2, both of absolute value 2. Supply the general-class theorem or its exact owned prerequisites, reconcile R01's weights, and move the relative-homology construction before its use here.

## R12 (P1) — Inert base change can reverse the local Atkin–Lehner sign

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1112`. Claim: `w_𝔭(F)=w_p(f)` for every unramified `𝔭|p∥N`.

**Witness:** Take `f=11a1⊗χ₋₄`, `p=11`, `K=ℚ(i)`. Its nonsplit multiplicative trace is −1, so `w₁₁(f)=+1`. Over the inert quadratic extension the trace is 1, so `w_(11)(F)=−1`.

**Repair:** Use the residue-degree formula `a_𝔭=a_p^f` at these multiplicative places, hence `w_𝔭=−(−w_p)^f`. Split primes preserve the sign; inert primes give −1. This yields −1 for both the split and nonsplit multiplicative rational twists after inert base change, consistent with their identical base change.

## R13 (P1) — Classical Fricke eigenvalues are not classical root numbers

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:987`. Claim: the two factors denoted ε are Tau Ceti's Fricke signs.

**Witness:** `TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean:148` has factor `Complex.I^k * f.frickeSign hχ`. At weight 2, `I²=−1`; a root number +1 therefore means Fricke sign −1.

**Repair:** Define the classical ε as the root number `−frickeSign` at weight 2. The product identity remains correct: `(−w_f)(−w_twist)=w_f w_twist`. In the stated rank-zero example both root numbers are +1 and both Fricke signs are −1, so the Bianchi root number is +1 either way. Correct the individual identifications and terminology.

## R14 (P2) — Base-change L-functions must include the ramified factors

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1105`. Claim: the full product identity is confined to `gcd(N,d_K)=1`.

**Witness:** Twist `11a1` by `χ₋₄`: its level is 176 and `gcd(176,4)=4`, but its base change to `ℚ(i)` is unchanged. The full product is still `L(11a1,s)L(11a1⊗χ₋₄,s)`.

**Repair:** State the complete all-place identity using local Weil–Deligne restriction and Artin induction, supplied by GL2AutomorphicRepresentationsAndTransfer R17.4.3. Coprimality belongs to the simple conductor formula, not the L-function identity. At 2 in this example the two rational factors are 1 and `(1+2T+2T²)⁻¹`, matching the good factor over the ramified quadratic field. Keep wild places in the theorem.

## R15 (P2) — The two weight conventions agree only at weight two

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:443`, and §3.4. Claim: the knowl's `ℂ^(k+1)` model is the analytic model of the same cohomological weight k.

**Witness:** With `E_k=Sym^(k−2)⊗conj Sym^(k−2)`, the minimal SU₂ type is `Sym^(2k−2)`, of dimension `2k−1`. At k=3 this is 5, whereas the claimed knowl dimension is 4.

**Repair:** Name both parameters and translate the analytic parameter as `2k−2`; distinguish coefficient-module dimension `(k−1)²` from minimal-type dimension `2k−1`. Resolve the dimension-table convention separately. The repaired dimensions are 3 at k=2, 5 at k=3 and 7 at k=4. ModularityAndLanglandsExtensions §4.41 explicitly uses this minimal-type indexing.

## R16 (P2) — General twists are promised in a carrier that excludes them

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1048`. Claim: every finite-order ψ gives a unique newform `F⊗ψ`, using §5.3's Newform.

**Witness:** The roadmap's order-three class character χ over `ℚ(√−23)` changes central character 1 to `χ²≠1`, and eigenvalue −2 to `−2χ(𝔭)`. Section 5.3's carrier requires central character 1.

**Repair:** State the general twist on the supplied automorphic carrier with central character recorded, and give a Bianchi Newform specialization for `ψ²=1`; or explicitly build the general-character Bianchi carrier. The later warning that the twist leaves the space does not type the earlier existence claim. In the test the general twist exists, but fails membership in the trivial-character carrier; quadratic twists pass.

## R17 (P1) — Group relators do not give the asserted modular-symbol relations

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1338`. Claim: every relator gives a zero sum of the successive translates of a fixed symbol.

**Witness:** Over `ℚ(i)`, `l=diag(−i,i)` satisfies `l²=1` projectively and fixes `m=(0:1)`. The rule gives `2m=0`. At prime level its boundary is `2([∞]−[0])≠0`.

**Repair:** Derive relations from oriented cell boundaries and the action on edges, with stabilizer signs; do not turn arbitrary group relators into this sum. Here l preserves the edge and gives `m−m=0`; a reverses it and gives the genuine two-term relation. Cremona's construction uses geometric face relations, and the counterexample distinguishes those from a presentation of the group.

## R18 (P1) — The modular-symbol pair is undefined and its dimension rule subtracts twice

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1331` and 1349. Claims: `H₁(Γ\H3,cusps;ℤ)` is a relative-homology group; its boundary kernel is dual to S₂ and then needs an Eisenstein subtraction.

**Witness:** Cusps are ideal boundary points, not points of `Γ\H3`: `∞∉H3`. Moreover, a perfect duality with a rank-r space gives dimension r, not `r−e` for a nonzero Eisenstein rank e.

**Repair:** Name the compactified pair and the precise quotient of cycles. One option is the cusp-adjoined space used by Cremona; another is a Borel–Serre construction with boundary cycles explicitly quotiented. State which space pairs perfectly with cusp forms, and subtract the boundary contribution exactly once. For r=1,e=1, distinguish the prequotient dimension 1 and quotient dimension 0; do not call both spaces the perfect dual of S₂. Supply this construction before §6.6.

## R19 (P1) — A CM Q-curve need not be a quadratic twist of its conjugate

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1289`. Claim: a curve geometrically isogenous to its conjugate has `F_E^τ=F_E⊗χ` for a quadratic character χ.

**Witness:** Over ℚ(i), take `E:y²=x³+2+i`. Its conjugate has the same j-invariant 0. At the prime above 13 with i=5, their point counts are 7 and 9, giving traces 7 and 5, not ±7.

**Repair:** State the quadratic-character argument for geometrically non-CM curves, where the geometric Hom module has rank one. Handle CM curves separately using the finite-order character on their CM extension and automorphic induction; the isogeny need not descend over a quadratic extension of K. In this example an isomorphism is obtained by `(x,y)↦(u²x,u³y)` with `u⁶=(2−i)/(2+i)`. Both curves have good reduction at 13. An unramified quadratic twist gives trace ±7; a ramified one cannot have the same unramified local representation as the conjugate. Thus this test remains a Q-curve while correctly failing the quadratic-twist conclusion. The CM field is ℚ(√−3), different from K, so §8.4 places it in the cuspidal case rather than excluding it.

## R20 (P2) — The level-one acceptance theorem discards most of the source theorem

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1364`; `TauCetiRoadmap/BianchiModularForms/Suggested.lean:370`. Claim: only the class-number-one cases of Vogtmann's classification are targets.

**Witness:** `vogtmann1985 line 29`, printed p.399, includes `ℚ(√−5)`: cuspidal H¹ vanishes although its class number is 2. The Lean hypothesis excludes it despite having all the required carriers.

**Repair:** State the full fourteen-field iff without the class-number-one hypothesis. In discriminants the set is `{−4,−8,−3,−20,−24,−7,−11,−15,−19,−23,−31,−39,−47,−71}`. The d=−20 test then returns vanishing; d=−43 remains nonvanishing. Keep the nine class-number-one cases as README Checks, not the scope of the headline.

## R21 (P1) — The supplier does not declare the API names claimed as inputs

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:131`, 582 and 627. Claim: §4.27 supplies `TauCeti.SymmetricPower.BianchiEigenform` and named maps such as `bianchiParabolicEquiv`.

**Witness:** ModularityAndLanglandsExtensions §§4.26–4.27 contain the mathematical carrier and comparison in prose. Its README and Suggested.lean contain none of `BianchiEigenform`, `bianchiParabolicEquiv`, `bianchiCuspToParabolic`, or `coeff_eq_eigenvalue`; neither pinned library declares them.

**Repair:** Cite the actual numbered mathematical contracts as planned suppliers and remove the nonexistent typed API assertions. If a specific additional interface is necessary, declare it precisely under an owned target or a matching declared supplier gap. This is not absence of the mathematics: resolving §4.26 succeeds; resolving the claimed declaration does not. No second construction of the supplier's comparison is needed.

## R22 (P1) — The recorded build gate fails on the module-system warning

**Location:** `TauCetiRoadmap/BianchiModularForms/Suggested.lean:1`. The recorded gate has `build=1 FAIL`: importing Mathlib without the module header produces a non-sorry warning.

**Witness:** Direct elaboration exits 0 with 16 sorry warnings. The targeted Lake build also exits 0, but emits the additional warning requesting `module`. This is the gate failure, not a Lean type error.

**Repair:** Add the required module header and rerun the targeted gate. A scratch copy with `module` prepended elaborated successfully, including all forty signature checks, with only the same sixteen sorry warnings. No repository file was changed in this review.

## R23 (P2) — Algorithm deliverables exceed the permitted roadmap scope

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1351`, also 672 and 1366. Claim: correctness of Cremona's algorithm and explicit operator-matrix lists are deliverables.

**Witness:** Section 9.2 explicitly makes the algorithm's computed output the target; §9.3 proposes running it as a checked computation. These are computational procedures, beyond the permitted mathematical background and small Checks.

**Repair:** Keep the finite-presentation, homology-pairing, Hecke-action, finiteness and vanishing theorems as mathematical targets, with proof routes and source locators. Remove the executable procedure/list-production obligations. The six-coset norm-5 example remains a small Check; it does not require an algorithm enumerating all K and primes.

## R24 (P3) — The seeded claims mostly have no claim-level source locators

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:372`, 451, 501, 800 and 1348. Claim: bibliography-wide references suffice for these exact assertions.

**Witness:** Section 0.5 has no source locator for its bijection; §1.6 names a knowl without a primary rationality/integrality theorem; §9.2 names an algorithm without a theorem/page. The sample table below records these separately.

**Repair:** Add exact primary theorem/section and printed-page locators at each theorem, retaining all hypotheses. For preprints cite the version actually read and its pagination. For unreadable legal sources retain an explicit uncertified locator; do not imply verification. For example, the full level-one list can cite Vogtmann p.399, while §0.5 first needs its incorrect map repaired.

## R25 (P3) — Definitions lack the required APIs, discriminating Checks and local dependencies

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:41`, 302 and 1556. Claim: the future-name catalogue and final dependency graph stand in for target-level specification.

**Witness:** There are 64 numbered subsections but only 21 explicit Checks blocks, no per-target `*Needs:*` lines, and no per-layer Examples/Dependencies endings. The opening explicitly permits own backticked names absent from Suggested.lean.

**Repair:** Use the required Summary, Conventions, Exact supplier contracts and How to read the build structure; give each definition its mathematical API and at least three discriminating Checks, and each target its actual dependencies. Keep own Lean names only for declarations retained in Suggested.lean. For §0.5, the orbit-invariance, GL₂/SL₂ unit distinction and prime-level examples supply three genuinely different tests. Move generic “already supplied” discussion into ownership/contracts.

## R26 (P3) — Suggested.lean contains API and Check padding

**Location:** `TauCetiRoadmap/BianchiModularForms/Suggested.lean:86`, 91, 232 and 357. The inclusion API, prime specialization, prime-cusp Check and exact-divisor boundary fact are not headline results.

**Witness:** `self_exactDivisor` already has the explicit witness 1 and two elementary identities. `card_cusps_prime` is exactly §0.5's two-cusp Check; `Gamma0_index_prime` specializes the general index theorem immediately below it.

**Repair:** Delete these declarations from Suggested.lean; keep the mathematics in the README. Also remove orphan definitions `levelBadPrimes`, `fieldBadPrimes` and `primeClass` unless a retained headline actually needs them. The general index and general cusp-finiteness statements retain the relevant acceptance coverage. The scratch rfl/simp/infer_instance probes left all sixteen admitted theorems open; these padding findings use the separate Check/API/boundary-case criteria, not a claim that those probes proved them.

## Verified sound

“Sound” below records particular calculations and resolved inputs, not certification of the statements contradicted above. I read all 64 numbered subsections and all 40 Lean declarations, checked the 15 seeded source targets, and compared the elaborated signatures. No previous review or settled repair finding was supplied.

The worktree stayed unchanged, the head matched b5908b3, and the outside-folder diff was empty. There are no sorry'd data definitions, set_option overrides, extra imports, or admitted examples in the target file. The worker's gate had zero counts for every rule except the module warning in R22.

### Adversarial calculations

Each row gives an actual calculation or a concrete carrier test. “Conditional data” means the arithmetic consequence was recomputed but the database datum itself was not independently certified. A successful example does not establish a general theorem.

| Target | Instance and values on the two sides | Result / change |
|---|---|---|
| 0.1 level and index | Unit level: index 1 = empty product 1. Gaussian norm-5 prime: index 6 = 5(1+1/5). Its square: 30 = 25(1+1/5). | Sound numerical checks. |
| 0.1 reduction warning | ℚ(√−2), mod 5: units have image of size 2; residue unit group has size 24. | GL₂ surjectivity would fail; the SL₂ route avoids it. |
| 0.2 component lattice | 𝔞=(2), γ=[[1,1/2],[0,1]]: γ(2e₂)=e₁+2e₂∈𝓞⊕2𝓞; γe₂∉𝓞². | Stabilizer convention works; R05 distinguishes coefficient lattices. |
| 0.2 representative change | diag(1,2) sends 𝓞² to 𝓞⊕2𝓞; upper-right entries change from 𝓞 to (1/2)𝓞. | Conjugation direction agrees with the definition. |
| 0.3 covolume | Principal unit level: [G:P]=2; vol(G)/vol(P)=1/2, not the displayed subgroup index. | R02. |
| 0.4 stabilizers | Gaussian level π², cusp 1/π: unit-ratio group size 1; at infinity size 4. At cusp 0, fixed upper-unipotent intersection has rank 0, conjugated one rank 2. | R04. |
| 0.5 cusp coordinate | [0:1]→[1:1] under a level-group element; proposed divisor π→1, corrected denominator divisor 1→1. | R03. |
| 0.5 cusp counts | Norm-5 prime square: GL₂ count 1+4/4+1=3; SL₂ count 1+4/2+1=4. Prime level: 1+1=2. | Counts consistent, parametrizing map is not. |
| 0.6 presentation | Gaussian relators in the abelianization give 2a=2l=0, t=a, u=a+l; result (ℤ/2)². | Agrees with stated abelianization; completeness needs Swan. |
| 1.1 H¹/Hom | Γ=1: both 0. Γ=ℤ: both ℂ. Γ=S₃: Hom(S₃,ℂ)=Hom(C₂,ℂ)=0 and H¹=0. | Matches the native trivial-coefficient comparison. |
| 1.2 parabolic kernel | Translation cusp ℤ²: dim H¹=2 and half-boundary image dimension 1. Rotation −1 acts by −1 on both generators: invariant dimension 0. | Explains the 1-versus-0 cusp contribution. |
| 1.2 matrix criterion | Scalar-unipotent [[1,1],[0,1]]: tr²=4=4det. diag(−1,1): tr²=0, 4det=−4. | Separates translation and rotation. |
| 1.3 coefficient weight | k=2: dim E₂=1. k=3: dim E₃=4, minimal K-type dimension 5, knowl k+1=4. | Trivial case sound; R15 for general indexing. |
| 1.4 finiteness | r generators, dim E=d: cocycles inject into E^r, so dimension ≤rd. r=0 gives 0≤0; r=2,d=1 gives ≤2. | Algebraic route has the necessary finite-generation input. |
| 1.5 total space | One ideal class gives a one-factor product. Cl=C₃, [𝔭]=g: S_𝔭 sends c→cg², and three applications send c→c. | Central class movement matches the pair construction. |
| 1.5 character control | χ(g)=ζ₃: −2χ(g)=1−i√3, χ(g)²≠1; trivial χ gives −2∈ℝ. | Correct negative control for trivial central character. |
| 1.6 integral structure | k=3, 𝔞=(2): tensor coefficient 1/4 outside 𝓞; transported tensor lattice has integral coefficient 1. | R05. |
| 1.6 unrestricted Γ | Γ=ℚ unipotent: H¹(Γ,ℤ)=0, H¹(Γ,ℚ)=ℚ; ranks 0 versus 1. Γ=ℤ gives ranks 1 and 1. | R06. |
| 1.7 finite quotient | For quotient C₂ on a complex vector space, averaging is (1+g)/2: value 1 on the + eigenspace, 0 on the − eigenspace. | Characteristic-zero invariants are the right adapter. |
| 2.1 slash/coframe | Identity gives I₃. At inversion, x=y=1, A e₂=(1/2,0,−1/2); rescaled M e₂=(1,0,−1). | The roadmap's A corrects the knowl's coframe mismatch. |
| 2.2 harmonicity | Zero form gives dω=δω=Δω=0. Locally ω=dy/y has δω=2 but Δω=0. | Integration by parts needs decay/boundary control; this local example is not a finite-volume automorphic counterexample. |
| 2.3 constant terms | F=(c₁y,c₂y²,c₃y) gives ω=−c₁dx+c₂y dy+c₃d x̄, with dω=δω=0. All c_i=0 gives constant term 0. | Correct zero-mode shape for closed/co-closed forms. |
| 2.4 Fourier phase | On ℚ(i), α=1, λ=2π: the exponential is exp(2πiv), and the real K₁ phases make the dx∧dy coefficient 0; replacing them by the knowl's fixed ±i/2 leaves a nonzero coefficient. | Correct directional phases in the roadmap. |
| 2.5 ideal coefficient | 𝔞→2𝔞: raw 1→4; ideal unchanged; corrected quotients 1/1=4/4. | R01. |
| 2.6 Petersson norm | ‖β₁‖²=2, ‖β₂‖²=1, ‖β₃‖²=2; image of e₂ has weighted norm 1 but unweighted norm 1/2. | R07. |
| 2.7 SL₂/GL₂ | Units modulo squares have order 2. A +1 eigenvector of its involution has invariant dimension 1; a −1 eigenvector has invariant dimension 0. | Correct invariants formulation, with the quotient action explicit. |
| 3.1 adelization | Cl=1 gives one component; Cl=C₃ gives three. A central scalar acts trivially on H3; an order-three unramified twist has central value ζ₃². | Compatible with the supplied component/central-character dictionary. |
| 3.2 comparison multiplicity | At conductor level the newvector space has dimension 1; raising by an unramified prime gives dimension 2 although archimedean H¹ remains dimension 1. | R08; ES does not identify these two copies. |
| 3.3 equivariance/real structure | γ=id gives ES(F)=ES(F). For a path integral 1+i, conjugation gives 1−i on both forms and cochains. | Direction and real-structure test agree. |
| 3.4 higher weight | k=2,3,4: coefficient dimensions 1,4,9 and minimal K-type dimensions 3,5,7. | Supplier convention verified; fix R15. |
| 4.1 pair counts | Over 𝔽₅, ℙ¹ has 6 lines; removing the one bad line leaves 5. Index-𝔭 changes determinant ideal by 𝔭, not 𝔭². | Good/bad counts and Steinitz movement agree. |
| 4.2 correspondence | At norm 5 the good degree is 6, bad degree 5; K₀(1) differs from K₀(𝔭), with index 6. | R09's right-hand compact subgroup is a real distinction. |
| 4.3 principal cosets | At level π, diag(π,1) has upper-left residue 0; all Γdiag(1,π)Γ residues have nonzero upper-left entry. | R09. |
| 4.4 recurrence | a_𝔭=1,q=5: c(𝔭²)=1²−5=−4. Bad a_𝔭=0 gives c(𝔭^r)=0 for r≥1; bad −1 gives 1,−1,1,… starting r=0. | Sound normalized recurrence after R01. |
| 4.5 curve eigenvalues | Enumerating 11a1 over 𝔽₂,𝔽₃,𝔽₅,𝔽₇,𝔽₁₃ gives #E=5,5,5,10,10; traces −2,−1,1,−2,4. | Produces the stated base-change good eigenvalues. |
| 4.6 adjoints/realness | Old U at q=2,a=−2 has polynomial X²+2X+2 and roots −1±i; good T has real a. | Confirms the roadmap's exclusion of U from self-adjointness; integral proof still needs R05. |
| 4.6 Ramanujan | Inert 3: a=−5,q=9 gives 5≤6. Inert 7: a=−10,q=49 gives 10≤14. | Normalization matches BCGNT and supplier bounds. |
| 4.7 coefficient field | Rational trace system gives degree [ℚ:ℚ]=1. Twisted value 1−i√3 generates ℚ(√−3), which is not totally real. | Central-character hypothesis discriminates the wrong model. |
| 4.8 SL₂ operator | Nonprincipal class g of order 3: source class 1, target class g≠1. | R10. |
| 5.1 degeneracy | Level m→m𝔭 has divisors e=1,𝔭: two maps, versus one forgetful map. | Necessary for the two-copy oldspace. |
| 5.2 old/new | Unit level: zero proper divisors, old dimension 0. The 121.1-a contribution at (11)(1+i) has dimension 2=number of divisors of (1+i). | Matches the stated Check and refutes §3.2's multiplicity claim. |
| 5.3 newforms | At conductor (11), bad a=1 gives a²=1. At squared bad prime for 100.2-a, asserted a=0 gives c(𝔭^r)=0. | Classification arithmetic consistent; latter database datum conditional. |
| 5.4 uniqueness | Scaling a normalized form by 2 changes c(1)=1 to 2, so it is not another normalized newform with the same data. | Normalization excludes the scalar wrong model. |
| 5.5 Atkin–Lehner pair | W_n(L,M)=(M,nL), hence W_n²=(nL,nM). For n=(π), scalar π identifies this with (L,M); nonprincipal class g gives g²≠1. | Correct central square, with total-space qualification. |
| 5.6 signs | Bad a_(11)=1 gives w_(11)=−1 and ε=+1. Product (−1)(+1)(+1)=−1 gives ε=+1. | Correct Bianchi sign convention. |
| 5.7 conjugation | Rational field: one embedding and orbit size 1. Coefficients 3 and −3 at conjugate primes are exchanged by τ, so F^τ≠F despite both being real. | Distinguishes coefficient conjugation from field conjugation. |
| 6.1 Euler factors | q=5,a=1: denominator 1−T+5T², inverse coefficients 1,1,−4,…; split rational prime gives two factors, inert prime norm p². | Matches §4.4 and norm indexing. |
| 6.2 Mellin | s=1, d_K=−4,w=4: prefactor w·abs(d)/(16π²)=1/π². Under 𝔞→2𝔞 the raw integral scales by 2^(2−2s). | Class-one constant correct; representative-invariant weight is N𝔞^(s−1), R01. |
| 6.3 reflection | Fricke y→1/(abs(N)·y) sends dy/y→−dy/y. Conductor for Qi/(11): 16·121=1936=11·176. | Correct minus sign, centre 1 and conductor. |
| 6.4 base-change sign | At k=2: I²w=−w. Two classical root signs +1 multiply to +1; two Fricke signs −1 also multiply to +1. | Product sound, individual identification false: R13. |
| 6.5 analytic rank | Germs 1,t,t² at the centre have orders 0,1,2 and reflection signs +1,−1,+1. Zero germ has infinite order whose ENat.toNat is 0. | Nonzero continuation is essential; correct carrier chosen. |
| 6.6 L-ratio | Independent primitive signs allow abs(1+1)=2 and abs(1−1)=0; one global primitive line allows only abs(±2)=2. At q=9, 2√q=6<10=q+1. | R11; denominator inequality is sound. |
| 6.7 SL₂ newforms | Rotation involution +1 eigenspace descends to GL₂; −1 eigenspace does not. Dimensions 1 and 0 in one-dimensional tests. | Keep distinction; all-prime operators require R10. |
| 7.1 twists | ζ₃²≠1 but (−1)²=1; twisting −2 by ζ₃ gives 1−i√3. Over 𝔽₇ the nonzero squares are {1,2,4}, so (5/7)=−1. | Quadratic splitting Check correct; carrier repair R16. |
| 7.2 norm character | Split p: χ_K(p)=1. Inert p: χ_K(p)²=(−1)²=1. Thus norm pullback of χ_K is trivial at unramified primes. | Matches kernel {1,χ_K}; the all-place statement uses class field theory. |
| 7.3 good base change | a₃=−1 gives (−1)²−2·3=−5; a₇=−2 gives 4−14=−10; split a₅=1 stays 1. | Correct Satake trace rule. |
| 7.3 bad signs | Nonsplit multiplicative a₁₁=−1 gives rational w=+1; inert degree 2 gives a_𝔭=1,w_𝔭=−1. | R12. |
| 7.3 all-place product | Rational factors at 2 are 1 and (1+2T+2T²)⁻¹; their product equals the base-change factor, even though gcd(176,4)=4. | R14. |
| 7.4 descent and bc | Conjugate prime values 3 and −3 differ; τ-invariance is false. Of the three Gaussian ideals of norm 100, conjugation swaps two and fixes (10). | Descent criterion separates this pair; the claimed database bc value remains uncertified. |
| 7.5 coefficient-field arithmetic | a₃²=2 and a₇²=8 give −4 and −6 after inert base change; [ℚ(√2):ℚ]=2. | Recomputed conditional-data example, not a general proof of the coefficient-field assertion. |
| 7.6 self-twist | ψ(𝔭)=−1 forces a=−a, hence 2a=0 and a=0 over ℂ; ψ=1 imposes no condition. | Excluding the trivial character is necessary and done. |
| 7.7 CM field | ℚ(√−7,√5)=ℚ(√−7,√−35); the other imaginary quadratic discriminant is −35, not +5. | Explicit field/discriminant Check correct; Weil input uncertified. |
| 8.1 curve attachment | For 11a1 at q=2, #E=5 gives 2+1−5=−2; over 𝔽₉, a=−5 implies #E=15=9+1−(−5). | Good-prime convention agrees with pinned frobeniusTrace. |
| 8.2 elliptic-curve predicate | Smooth integral 11a1 has Δ=−11^5≠0, so only finitely many excluded primes. A singular model has Δ=0 and every prime excluded; the explicit IsElliptic condition rejects it. | Nonvacuity safeguard is present. |
| 8.3 curve/form base change | A rational classical form has coefficient-field degree 1; a form from ℚ(√2) has degree 2 and cannot be that same rational eigensystem. | Correct distinction in the conditional 16384.1-d example. |
| 8.3 CM Q-curve | E:y²=x³+2+i and its conjugate both have j=0. Mod 13 with i=5 their constants are 7 and 10; point counts 7 and 9 give traces 7 and 5. Quadratic twist permits only ±7. | Q-curve is true, quadratic-twist conclusion false: R19. |
| 8.4 CM obstruction | h(−35)=2 from the two reduced classes; their CM j-values are real, while an imaginary quadratic field intersects ℝ in ℚ. Degree 2 cannot fit this intersection. | The stated obstruction is consistent; general CM theorem needs its named source contract. |
| 8.5 multiplicative data | Split: a=1,w=−1; nonsplit: a=−1,w=+1. Inert quadratic extension turns the second trace into (−1)²=1. | Agrees with all-place supplier and R12. |
| 8.6 L-function comparison | Same good trace a and q gives the identical polynomial 1−aT+qT². At a=−5,q=9 it is 1+5T+9T² on both sides. | Full equality depends on supplied bad-place compatibility, not this good-prime test alone. |
| 9.1 modular-symbol relation | l²: m+m=2m, boundary 2([∞]−[0])≠0. Oriented stabilizer relation: m−m=0. | R17. |
| 9.1 relative carrier | H3 requires y>0; cusp points lie on its ideal boundary and provide no inclusion into Γ\\H3. | R18; a compactification is needed. |
| 9.2 duality/rank | Perfect duality with rank r=1 yields dim=1; subtracting e=1 yields 0. | R18; distinguish prequotient and cuspidal quotient. |
| 9.3 level-one theorem | d=−20 has class number 2 and cuspidal dimension 0; d=−43 has nonzero cuspidal H¹. Both are in the source's full classification. | R20. |
| 9.3 Euler characteristic | Torus boundary: χ(T²)=1−2+1=0; half the sum is 0. | Correct finite-volume three-manifold computation, then finite-index orbifold passage. |
| 9.4 Euclidean floors | 1−M for M=1/2,3/4,1/3,4/7,9/11 gives 1/2,1/4,2/3,3/7,2/11. | Arithmetic consistent; face completeness and large lists not certified. |
| 9.5 covolumes | 60·(Catalan/3)=20 Catalan; 168·(√3L/8)=21√3L. | Matches supplier's two congruence covolumes; domains must have the supplier's rotational folding. |

### The seeded source sample

There were no explicitly flagged unverified locators to add to the fifteen requested targets. Bibliographic association is not an exact theorem locator. The following distinguishes text actually read from a supplier contract and from an inaccessible source.

| Seeded target | Text/locator inspected | Outcome |
|---|---|---|
| 0.5 cusp count | cremona1984 lines 96–104 (printed pp.276–277); sengun2014 lines 669–710 (preprint p.18). | Neither is an exact locator for the stated GL₂ formula. Orbit-map counterexample R03; no source certification of that map. |
| 1.1 H¹ | Mathlib LowDegree.lean:1018, under A.IsTrivial. | Exact native comparison supports the statement; no need to reconstruct generic H¹/Hom theory. |
| 1.4 finite dimension | sengun2014 lines 361–367 (preprint p.10); ALS §2.4. | Cocycles determined by finitely many generator values; hypotheses align for the stated component groups. |
| 1.6 rational/integral | mf.bianchi.spaces line 98, unpaginated; cremona1984 lines 258–261 (printed p.282). | Knowl gives background, not the general component-lattice proof. R05–R06. |
| 2.7 SL₂ level | mf.bianchi.level lines 90–98, unpaginated. | GL₂ space is the unit-invariant subspace of the SL₂ space; read the knowl's class-number-one simplification explicitly. |
| 3.4 weight k | sengun2014 lines 555–562 (preprint p.14); ModularityAndLanglandsExtensions §§4.26,4.41. | Comparison uses V_(k−2,k−2); R15 catches the inconsistent analytic weight label. Harder's primary text remains uncertified. |
| 4.6 Hecke properties | cremona1984 lines 104–137 (printed pp.277–278); bcgnt2025 lines 437–480,506–526 (v3 pp.9–11). | Good-prime qualifications matter. BCGNT Theorems E/F support the stated weight-two bound; F is principal-component qualified. Integral lattice requires R05. |
| 5.2 old/new | cremona1984 lines 131–137 (printed p.278); ALS §3.14. | Old multiplicities agree with the two-map example. Cremona's setting does not certify every all-class/higher-weight assertion here. |
| 5.7 conjugates | mf.bianchi.spaces lines 98–100 and mf.bianchi.newform lines 90–92, unpaginated; rational Hecke/newvector supplier contracts. | Orbit arithmetic tested above; knowls alone do not prove the full general assertion. They must not replace a primary locator. |
| 6.4 signs | TauCeti Sign.lean:148; GL₂ transfer R17.4.3. | Product root number compatible with transfer; individual Fricke identification false, R13. |
| 6.5 analytic rank | Mathlib Order.lean:62; mf.bianchi.sign lines 90–92. | Order/continuation and parity calculations checked. mf.bianchi.anr returned CAPTCHA; positive-rank database examples uncertified. |
| 7.1 twists | cremona1984 lines 147–152 (printed p.278); TauCeti finite-order character theorem:80. | Specialized twist background and finite-order/ray-class identification read. General carrier mismatch R16 is internal. |
| 7.4 cyclic descent | langlands1980 lines 496–518, §2 properties A–F, printed p.13; GL₂ transfer R17.4.4–6. | Galois-invariant cuspidal representations descend, and the fibre consists of norm-kernel twists. Specific database bc entries remain uncertified. |
| 8.1 curves | bcgnt2025 lines 437–480; EllipticCurveModularityImaginaryQuadratic endpoint; pinned PointCount.lean:109–115. | Weight-two coefficient convention and the supplier's non-CM/all-place statement resolved; finite-field traces recomputed. |
| 9.2 symbols | cremona1984 lines 278–320 (printed pp.283–284). | Geometric-symbol setup is for Euclidean fields; it does not justify arbitrary-relator sums or the double subtraction. R17–R18, R23. |

Additional primary check: `vogtmann1985 lines 13–33`, printed p.399, contains the full fourteen-field result; lines 91–105, printed pp.400–401, describe the boundary/cuspidal dimensions. Şengün was read as arXiv:1204.6697v4, not as an assumed page-for-page copy of the Springer chapter. BCGNT was read as arXiv:2309.15880v3; no unverified published/preprint page identification is being asserted. Langlands was read in the IAS institutional text with printed pagination.

Three individual LMFDB annotations were also readable: `mf.bianchi.2.0.4.1-34225.3-a.top line 90` records the non-base-change QM surface; `mf.bianchi.2.0.7.1-10000.1-b.top line 90` records CM by ℚ(√−35) and an abelian surface rather than an elliptic curve; `mf.bianchi.2.0.4.1-16384.1-d.top line 90` distinguishes a base-change form from its non-base-change curve. These certify what those annotations say, not their underlying proofs or all the numerical entries used elsewhere.

### Pins, signatures and acceptance-test coverage

Pins inspected: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

Native declarations opened and compared with the claims include:

- `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:1018`, `H1IsoOfIsTrivial`: requires the representation to be trivial; supplies the generic comparison, not cusp or arithmetic finiteness.
- `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402`, `H1InfRes_exact`: supplies inflation–restriction, not an automatic identification without the finite-quotient/characteristic-zero argument.
- `Mathlib/RingTheory/ClassGroup/Basic.lean:347`, `ClassGroup.mk0_surjective`: nonzero integral ideal representatives in the Dedekind setting.
- `Mathlib/GroupTheory/Schreier.lean:165`, `Subgroup.fg_of_index_ne_zero`: requires ambient finite generation and finite subgroup index.
- `Mathlib/Analysis/Analytic/Order.lean:62`, `analyticOrderNatAt`: explicitly applies `ENat.toNat`; it does not assert nonzero analyticity.
- `Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`, `Complex.besselJ`: the opened file provides J, not the K₀/K₁ needed here; object searches found no pinned Bianchi K-Bessel construction.
- `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `Newform`: classical normalized newforms, not a Bianchi carrier.
- `TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean:148`, `frickeCompletedL_sub_eq`: the essential `I^k` factor, trivial nebentypus and positive weight are present.
- `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteOrder.lean:80`, `isFiniteOrder_iff_exists_rayClassCharacter`.
- `TauCeti/NumberTheory/ClassFieldTheory/ClassField.lean:70`, `classField`: a class field construction on the specified Galois-side subgroup, not the proposed ray-character adapter by itself.
- `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73`, 109 and 115: point count, trace, and its agreement with the point cardinality under the finite-field/ellipticity hypotheses.
- `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121` and `MordellWeil/Regulator.lean:91`: the existing finite-generation and regulator objects support keeping those topics outside this roadmap.

I elaborated a scratch copy with `#check @name` for all 40 declarations and compared the output with the README. The 38 automated suspected binder losses were not 38 defects: the arithmetic theorems retain their number-field, totally-complex, degree-two and nonzero-ideal hypotheses; more general algebraic definitions legitimately omit them. No needed lost section binder was established. No file was repaired here.

Headline inventory: arithmetic groups/cusps and finite generation; finite-dimensional cuspidal cohomology and Eisenstein dimension; representative-independent total cohomology; Eichler–Shimura–Harder; the all-prime Hecke comparison and Ramanujan; old/new decomposition and multiplicity one; functional equation, parity and rational periods; twists/base change/CM; curve attachment with local compatibility; modular-symbol comparison; level-one vanishing and fundamental-domain results.

The file states the available group/cohomology headlines, including the last vanishing theorem, but narrows the latter unnecessarily (R20). Analytic H3/forms, Bianchi Hecke/newform and comparison carriers are not at these pins; the docstring identifies those missing constructions instead of declaring sorry'd carriers. Exact-divisor and prime-class helpers are not substitute headlines (R26). All sixteen sorries were tried with rfl, simp and infer_instance on a scratch copy; none closed. The general acceptance statements remain genuinely nontrivial under those tests.

### Ownership and supplier order

Object searches used the roadmap service, the main content tree, the supplied open checkouts and the board packages: Bianchi groups/forms, parabolic cohomology, Fourier–Bessel expansions, Hecke correspondences, newforms, base change and modularity. No other readable roadmap declares this file's fully qualified namespace; the other match is this same roadmap's indexed head. Main examples consulted for shape included ModularForms and Completed/GlobalNumberFields.

The intended ownership is an extension by concrete GL₂ component groups, harmonic-form formulas and adapters. Generic hyperbolic geometry remains KleinianGroups; adelic quotients and cohomological correspondences remain ArithmeticLocallySymmetricSpaces; the adelic Bianchi comparison remains ModularityAndLanglandsExtensions; global transfer remains GL2AutomorphicRepresentationsAndTransfer. MaassForms Layer 7 treats scalar Laplace eigenfunctions and does not duplicate these weight-two 1-forms. The mathematical scope is repairable, so this is not a rejection as a re-planned existing roadmap.

Resolved contracts (file names are repository-relative; section identifiers are the stable locators):

| Supplier | Resolved contract and limitation |
|---|---|
| KleinianGroups, README.md:265, Layers 0–4 | H3/action/measure, discrete groups, face pairings, Bianchi congruence groups, two covolumes; index law assumes subgroup inclusion (R02). |
| ArithmeticLocallySymmetricSpaces, §§0.6–0.7,1.5,2.4,3.5–3.8,3.14,4.1,F.6 | Components, group/Betti comparison, finiteness, Hecke pull/trace, oldspace, boundary and cusp forms. Non-neat quotients require stabilizer-aware coefficients, not an unjustified ordinary local system. |
| ModularityAndLanglandsExtensions, §§4.26–4.27,4.40–4.43 | All-component parabolic comparison, normalized adelic coefficients and bounds; no claimed typed API names (R21); higher-weight K-type convention fixes R15. |
| AutomorphicFormsOnReductiveGroups, §§4.5,7.2–7.3 | K-Bessel ODE/asymptotic and classical rational GL₂ adelization/Hecke dictionary. The Bianchi adelization is an adapter to construct here, not literally §7.2's rational theorem. |
| GL2AutomorphicRepresentationsAndTransfer, R16.4.4,R16.6.1,R17.4.1–6 | Strong multiplicity one, classical realization, Satake rule, base change, all-place compatibility, descent, cuspidality and fibres. All-place input should be used in R14. |
| EllipticCurveModularityImaginaryQuadratic, endpoint | Every elliptic curve, non-CM cuspidality, CM cases, and finite Weil–Deligne compatibility including inertia/monodromy. |
| LFunctions, Layers 0 and 6 | Arithmetic/analytic cards, functional equation and Grossencharacter cards. Weight-one translation changes the centre from 1 to 1/2; the completed-function scalar normalization must follow the card contract. |
| ClassFieldTheory, Layers 11–12 | Arithmetic Frobenius, global class field/index and ray-class Artin dictionary; the character-to-quadratic-field specialization can be owned here. |
| Completed/GlobalNumberFields; Completed/NumberFieldArithmetic | Ray/Hecke characters and rational-prime splitting/residue degrees. |
| ModularForms, Layers 4–9; EllipticCurves, Layers 0.5,1,3,4 | Existing classical newforms/CM and curve base change, traces, conductors; reuse these rather than new carriers. |
| EllipticCurvePeriodsAndModularParametrizations §§2.5,3.6–3.7; HilbertModularForms; MaassForms Layer 7 | Resolved as scope exclusions, not incoming prerequisites. |

The mechanical dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1560 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no declared gap. I also read the actual supplier references: the absence of per-target Needs lines is R25, not evidence that the theorem inputs are absent. The ten citation-scanner leads include database knowl identifiers and proposed own names, which are not missing-library findings by themselves; the genuine nonexistent supplier API assertions are isolated in R21.

## Not verifiable

The review is finished with the following limits; none is silently treated as a verified source claim.

- `harder1987`, `swan1971`, `bianchi1892`, `egm1998`, `weil1971`: source-service searches reached paywalled/uncertified publications. The primary proofs and exact locators behind the higher-weight comparison, general finiteness/domain claims and Mellin theorem were not read. Supplier contracts were inspected, but are not substitutes for source certification.
- `bygott1998`: the source-service title search did not retrieve the Exeter thesis. `lingham2005`: the title search and Nottingham institutional PDF link did not yield the thesis (the latter returned 404). Thus the claimed general-class constructions were not certified against those theses.
- `cremona_whitley1994`: DOI and AMS PDF attempts returned the journal landing page, not the paper. Its abstract's class-number-one setting was visible; its full period theorem and non-Euclidean symbol construction were not verified.
- `weil1955`: the bibliographic/source-service search did not yield a readable legal text. The exact unit/infinity-type input in §7.7 remains uncertified.
- LMFDB knowls `mf.bianchi.anr`, `mf.bianchi.base_change`, `mf.bianchi.cm`, `mf.bianchi.labels`, `nf.ideal_labels`, `mf.base_change`, `ec.base_change`, `ec.q_curve`, `ec.complex_multiplication`: fetched responses were CAPTCHA pages, not mathematical text. Successful HTTP retrieval does not verify their claims.
- Database-only numerical assertions about individual L-ratios, positive ranks, labels and specific twisting curves were not independently certified. The three qualitative individual annotations listed above were read, but the primary proofs behind their curve/surface assertions and the LMFDB labelling code were not inspected. Elementary arithmetic consequences are marked conditional in the table.
- The precise full non-Euclidean face lists, the all-class period theorem, and the proposed general modular-symbol presentation are not established by the sources that were readable. Findings above use explicit counterexamples or missing constructions, not guesses about these inaccessible texts.
- No legal source passages were copied into the worktree or report. All fetched texts remained in the source cache. Missing-source information was retained in the scratch request file; the now-readable Langlands text is not an outstanding request.

## Source issues

- **Misprint** in mf.bianchi.fourierbessell at additive-character definition, unpaginated, line 94: the source says the exponential has a real 2π trace exponent; it should be a 2πi trace exponent; affects a stated result.
- **Error** in mf.bianchi.fourierbessell at Bessel differential equation, unpaginated, line 99: the source says the potential is 1+y^(−2j); it should be 1+j²/y²; affects a stated result.
- **Error** in mf.bianchi.fourierbessell at the three-component Bessel vector, unpaginated, line 97: the source says fixed imaginary phases work for every Fourier direction; it should be direction-dependent phases with an explicitly matching coframe; affects a stated result.
- **Error** in mf.bianchi.weight2 at slash matrix and coframe, unpaginated, lines 91–106: the source says its displayed matrix acts on coefficients in the displayed coframe; it should use the rescaled coefficients or conjugate that matrix; affects a stated result.
- **Error** in mf.bianchi.hecke_algebra at self-adjointness assertion, unpaginated, line 94: the source says all these operators are self-adjoint; it should restrict this assertion to good-prime operators with the appropriate central character; affects a stated result.
- **Error** in mf.bianchi.spaces at self-adjointness assertion, unpaginated, line 94: the source says the Hecke operators are self-adjoint without the bad-prime qualification; it should distinguish good T operators from bad U operators; affects a stated result.
- **Error** in sengun2014 at Fourier–Bessel formula, arXiv v4 p.14, lines 546–553: the source says a fixed three-component Bessel vector supplies all Fourier directions; it should include the frequency-direction factors for its coefficient/coframe convention; affects a stated result.
- **Misprint** in sengun2014 at additive-character formula, arXiv v4 p.14, line 546: the source says the trace exponential has a real 2π exponent; it should include the imaginary unit in that exponent; affects a stated result.
- **Error** in sengun2014 at Bessel differential equation, arXiv v4 p.14, line 553: the source says the potential is 1+y^(−2j); it should be 1+j²/y²; affects a stated result.

