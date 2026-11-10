# Review of NonordinaryCMSpecialValues (package, round 2)

**Verdict:** needs changes

The three previous findings are repaired. This pass nevertheless finds 11 additional issues (8 P1/P2), including false norm and realization statements. The package is repairable; its overall scope need not be replaced. Neither a successful elaboration nor the previous review's computed rows establish the omitted hypotheses below.

## Previous findings, checked first

- **F01 — repaired.** README line 65 now cites “One-dimensional CM components of the Tate module” and “Frobenius and infinity-type identities”; line 66 cites “Full elliptic CM L-factorization, including bad primes”. ComplexMultiplicationAndExplicitReciprocity, open PR #1254, has these targets in §§4.1–4.2, README lines 639–679. Its §1.2 period pairing is at line 372, §2.2 dictionary at 453, §3.2 ray-level criterion at 595, and §4.3 canonical existence/good reduction at 699/703. The ten old invented declaration names are absent from this package. The mathematical applications were rechecked; §2.1 has the independent defect R01.
- **F02 — repaired.** README line 71 now cites “AL.1.3.5 Explicit local ε-factors” and “AL.1.6.2 Hecke continuation and functional equation”; line 72 cites “AL.5.1.1 Finite Euler corrections at critical points”. AutomorphicLFunctionsAndLocalFactors, PR #924, retains AL.1.1.1, AL.1.3.1/4/5, AL.5.1.1 and AL.5.3.2. Its explicit forwarding list at README lines 25–27 maps former AL.1.5.2 and AL.1.6.2 to AnalyticNumberTheoryPartI §2.3a. This is a valid retained mapping, not missing supply. ArithmeticGaloisRepresentations §2.7, PR #856, README line 2398, supplies the root-number product. The eight old slugs are absent.
- **F03(a) — repaired.** README line 497 says “equation (14) with the vanishing of `b_ℓ`, p.788”; FINIS06 line 902 and lines 911–917 are on that printed page.
- **F03(b) — repaired.** README line 105 explicitly includes “Layer 3 (local factors and Euler products) and Layer 5”; the former is Completed/ArithmeticDirichletSeries/README.md:190 and Layer 0's dependency list also includes it.
- **F03(c) — repaired.** README line 101 says the anticyclotomic quotients “are derived here in §§0.2 and 0.6”. ClassFieldTheory Layer 13 supplies the ring-class correspondence, not that quotient construction.
- **F03(d) — repaired.** README line 533 uses “relations among the `p̄`-components `α′_ν`”. FINIS06 lines 1573–1584 specify exactly those relations. With β₀=(1,1), β₁=(2,1), their second components give R={(x,−x)} and the diagonal in E², whereas full-pair relations give R=0 and E². The repair selects the correct diagonal.

No previous finding was marked not actionable. None is re-raised.

## R01 (P1) — The theta norm law fails for isogenies meeting the smoothing kernel

**Location.** packages/NonordinaryCMSpecialValues/README.md:284: “for an isogeny `E → E'` … the norm sends `_aθ_E` to `_aθ_{E'}`”. The same unrestricted compatibility is promised at line 279.

**Claim.** Every CM isogeny preserves the smoothing function under norm.

**Witness.** E=ℂ/ℤ[i], a=(5), h=[5]. Pushforward of 25[0]−Σ(P∈E[5])[P] is 25[0]−25[0]=0. The claimed target divisor is nonzero: coefficient −1 at each nonzero 5-torsion point.

**Repair.** Require an O_K-linear isogeny whose kernel meets E[a] trivially (equivalently, its annihilator is prime to a); state source and target of its norm. For ordinary c-theta, use the degree-prime-to-c condition of KATO04 Proposition 1.3(4), line 238. Explain that (15.4.2), KATO04 lines 5254–5255, omits the necessary restriction; the page image confirms this is in print. Add [5] as a negative Check. For the repaired law, [2] permutes E[5], so the pushed divisor remains 25[0]−E[5]; [5] is excluded. Keep the general construction and the appropriate distribution laws for noncoprime isogenies; do not assert this equality there.

## R02 (P1) — Kato's realization uses the wrong dual and loses its coefficient data

**Location.** packages/NonordinaryCMSpecialValues/README.md:327: “`V_L(ψ) = H₁(E(ℂ), Q)^{⊗ r} ⊗ L`”; line 331 gives the local scalar `a_v ψ(a)⁻¹`; line 339 identifies D⁰ and D¹.

**Claim.** This is Kato's inverse-action realization for every r≥1, with scalar-valued period map.

**Witness.** KATO04 §15.8, p.256, lines 5398–5417 (page image checked), uses H¹, tensor powers over K, extension to L, period target V_L⊗_Lℂ, and local scalar a_v^rψ(a)⁻¹. At r=2 and a_v=6 the omitted power changes 36 to 6.

**Repair.** State V_L(ψ)=H¹(E(ℂ),ℚ)^{⊗_K r}⊗_K L; specify the CM K-action. Take L from finite-idele values, K(ψ(K̂×)), not the diagonal K× on which a Hecke character is trivial. Set per_ψ:S(ψ)→V_L(ψ)⊗_Lℂ, and retain γ as a vector unless an explicit basis trivializes the line. Replace a_v by a_v^r. State Kato's comparison for 1≤j≤r and delete the untwisted D⁰=D¹ Check: H¹ has Hodge pieces (1,0) and (0,1), so over the two coefficient embeddings Fil⁰ has dimension 2 and Fil¹ dimension 1. If a selected component or Tate twist is intended, name it and compute its filtration separately. At a good inert prime 7, the inverse CM line has eigenvalue −1/7, becoming −7 after twist by norm 49; covariant homology has eigenvalue −7 before twisting. These tests distinguish the repaired realization and preserve the r=1 reciprocity target.

## R03 (P2) — The ordinary theta construction has an earlier owner

**Location.** packages/NonordinaryCMSpecialValues/README.md:12 and 279 claim ownership and construction of “Kato's theta function on an elliptic curve”.

**Claim.** This roadmap constructs the general integer-smoothed theta unit anew.

**Witness.** PR #1019, TauCetiRoadmap/PadicFamilies/README.md:2366, §4.0.1, already constructs the same normalized c-theta unit, divisor, base change, isogeny norm and expansion. PR #1804, TauCetiRoadmap/KatoEulerSystems/README.md:68–75 explicitly imports it.

**Repair.** Import PadicFamilies §4.0.1 in the overlap range (c invertible on the base); retain the CM ideal refinement and any genuine extension to noninvertible c, explaining precisely how it extends the supplier. Add the supplier contract and dependency. The complex witness E=ℂ/ℤ[i], c=5 is already supplied: the two putative constructions have divisor 25[0]−E[5] and the same normalization, hence are the same unit. Do not use KatoEulerSystems as an upward supplier. Also correct the blanket assertion that no earlier roadmap constructs CM elliptic units: PR #1307, TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2062, owns the ordinary class-number-one ray-unit construction. Cite that overlap and retain here the general CM refinement/normalization comparison and inert application, rather than claiming exclusive ownership of all elliptic units.

## R04 (P1) — The ray congruence subgroup has infinite index in K×

**Location.** packages/NonordinaryCMSpecialValues/README.md:115: “the elements `x ≡ 1` form a subgroup of finite index of `K×`”.

**Claim.** The finite-conductor principal congruence subgroup has finite index in the whole multiplicative field.

**Witness.** K=ℚ(i), f=(1+i)³. Congruence elements have valuation 0 at (1+i). The cosets (1+i)^nU have valuations n, giving infinitely many distinct cosets, not finite index.

**Repair.** Delete “of finite index of K×”. Prove the archimedean density directly by weak approximation with the finite congruence conditions. If useful, state finite index only in the subgroup of elements with valuation zero at every prime dividing f. For the witness, U is the kernel of the finite residue-unit map on that subgroup; valuation distinguishes the infinitely many cosets in K×. Density, and hence the archimedean type conclusion, survives this repair. The pinned definition IsCongrOne explicitly permits fractional elements and enforces the local valuation condition (TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:316).

## R05 (P1) — The Finis conversion omits complex conjugation

**Location.** packages/NonordinaryCMSpecialValues/README.md:503: “`λ ↦ λ/N` … carries ideal type `(1,0)` … to … type `(−1, 0)`”.

**Claim.** Dividing a type-(1,0) character by the ideal norm produces the stated Finis infinity type.

**Witness.** A type-(1,0) character has archimedean component z⁻¹. Dividing its ideal values by N multiplies that component by z z̄, giving z̄: Finis type (0,−1), not (−1,0).

**Repair.** Use φ̄ρ/N, as §5.1 already correctly does. Its component is z̄⁻¹·z z̄=z. At z=i the old expression is −i and the corrected expression is i. Keep this as a negative-control Check and make §4.1 agree with Conventions and §5.1. FINIS06 lines 61–69 fix the type convention.

## R06 (P2) — The standing conductor rule omits the class-number hypothesis

**Location.** packages/NonordinaryCMSpecialValues/README.md:39: “For a `p`-anticyclotomic `χ` of exact order `p^n` … `c = n + 1`”.

**Claim.** This applies under the standing odd-inert hypotheses, including Layers 0, 1 and 6.

**Witness.** K=ℚ(√−31) has reduced forms (1,1,8),(2,−1,4),(2,1,4), hence class number 3. The prime 3 is inert. A nontrivial Hilbert-class character has order 3 and conductor exponent 0, not 2.

**Repair.** Add p∤h_K to this order-to-conductor rule and to the parenthetical “c=2 (order p)” / “c=3 (order p²)” examples in §1.3. Leave the conductor-exponent formulation of §§1.3 and 6.5 general; do not narrow the Lean headline. Add the unramified order-3 character as a Check. The repaired conditional does not apply to this witness; the parity formula still gives (−1)^0=1, as required. §0.2 already has the correct qualification.

## R07 (P3) — Two Checks assert incorrect logical or boundary behavior

**Location.** packages/NonordinaryCMSpecialValues/README.md:686: “`c ≤ 0`: the box contains only `(0, 0)`”; line 166 says removal of entire-ness is satisfied “vacuously by no `F`”.

**Claim.** The first count vanishes for every q; the second existential condition is vacuous when no function exists.

**Witness.** P={5}, α=5, β=0, q=5, c=0 gives t=1 and six pairs (u,±1), u∈{−1,0,1}, not zero. An existential with no witness is false, not vacuously true.

**Repair.** For c<0 and q>1 the box is {(0,0)}. At c=0 it is the nine-point box {−1,0,1}²; nonzero linear forms are excluded by sufficiently large supported q, not all q (the same data give count 0 at q=25). Replace §0.3's Check by the actual failure without holomorphy: define F by the product on Re(s)>3/2 and assign an arbitrary value at 1, obtaining both 0 and 1 as candidate central values. Entire continuation rules out that arbitrary assignment. These are README repairs; add no boundary theorem to Suggested.lean.

## R08 (P3) — Complex conjugation is outside the automorphism group of the Check

**Location.** packages/NonordinaryCMSpecialValues/README.md:705: “`σ` is complex conjugation”, under σ∈Aut(ℂ/K) at line 701.

**Claim.** This instantiates the preceding theorem's automorphism hypothesis.

**Witness.** For K=ℚ(i), complex conjugation sends i to −i≠i. It is not a K-automorphism of ℂ.

**Repair.** Use σ=id as an in-domain Check, and retain conjugation as a separately labelled compatibility of the two complex embeddings, proved by reindexing ideals. Do not call it an instance of Aut(ℂ/K). The reindexing still gives L(η̄,1)=L(η,1), while σ=id fixes i and satisfies the actual quantifier.

## R09 (P1) — Lubin–Tate supplier citations still use vanished design target ids

**Location.** packages/NonordinaryCMSpecialValues/README.md:77–78: `primitive-division`, `tate-module-comparison`, `lt-character`, `unramified-honda-comparison`, `elliptic-honda-comparison`; also §§3.1, 3.3, 3.5.

**Claim.** These are the supplier's current section/target identifiers.

**Witness.** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md has none of those five ids or a former-numbering map. Its corresponding targets are §§2.3 (line 657), 2.2 (635), 2.4 (688), 4.3 (1066), 4.4 (1101).

**Repair.** Repoint every occurrence to those sections and their mathematical titles; cite the actual declaration finrank_adjoin_primitive_lubinTate_root only if needed. The old ids remain in the supplier's design catalogue, which is not its package interface. The mathematics exists, so no new supplier gap is needed: §2.3 gives (q−1)q^(m−1), and §4.4 gives a_(p²)=2sp ↔ parameter sp. For p=5, m=1 these yield degree 24 and, at trace −10, parameter −5. Severity follows the brief's explicit rule for a prerequisite cited through a nonexistent current section/declaration; this is not an allegation that Lubin–Tate theory is unowned.

## R10 (P3) — The Lean docstring incorrectly says ring class fields are absent

**Location.** packages/NonordinaryCMSpecialValues/Suggested.lean:36: “CM torsion fields … and ring class fields are missing”.

**Claim.** The pinned libraries have no ring-class-field carrier.

**Witness.** TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111 defines TauCeti.ClassFieldTheory.ringClassField O as an IntermediateField K (SeparableClosure K); line 121 provides finite dimensionality.

**Repair.** Remove ring class fields from the missing-carrier list and cite the native carrier in the README's Tau Ceti contract. Explain that the still-missing ingredient for the Layer 3 headline is the CM attachment/torsion-field comparison, not ring class fields themselves. The native type handles a number-field order directly and does not require a new carrier. This correction does not force a weakened Layer 3 stand-in into Suggested.lean.

## R11 (P2) — The split-prime valuation identity has unspecified terms

**Location.** packages/NonordinaryCMSpecialValues/README.md:523: the identity uses `W̃` and `b_ℓ` but specifies only “`W̃ = 1` for nonsplit `ℓ`”. §4.1 defines b_ℓ only for nonsplit ℓ.

**Claim.** The displayed identity supplies both split and nonsplit cases needed by §4.6.

**Witness.** For split ℓ=11 in ℚ(√−7), the stated conditions leave W̃ unconstrained: changing it from 1 to 11 changes the left valuation by 1 with unchanged right side. b₁₁ has no declared value.

**Repair.** Define b_ℓ=0 for split ℓ (FINIS06 line 893), and define W̃ by the Gauss sum and root-of-unity choice in Proposition 3.7, lines 922–927; retain v_ℓ(W̃)=v_ℓ(W_ℓ(λ)) in the split case (lines 1141–1142). Alternatively state two complete identities using W_ℓ directly in the split one. Distinguish the positive integer d from the squarefree ramified ideal 𝔡_λ in “dD𝔡_λ⁻¹”, and specify the eigenfunction/pairing domain and nonzero denominator of Proposition 3.6. In the unramified split test the prescribed correction is 1, with valuation 0; the arbitrary choice 11 is excluded. The nonsplit application at 5 retains W̃=1 and b₅=0 when unramified.

## Verified sound

### Coverage and principles

Read all 43 numbered targets, their API bullets, Checks, conventions, supplier contracts, and the three theorem signatures. Rechecked the repairs before the new pass. The previous review's computed rows were used only for unchanged instances; they were not treated as blanket approval (its c≤0 row, in particular, is incorrect). All 15 seeded targets were read against the cached sources. No author-flagged unverified locator occurs. All ten cited works have one manifest entry; no fetch or manifest edit was required. No target text was changed.

The layer organization is mathematical: characters → signs and reciprocity → towers; theta divisibility is an independent branch feeding unit values; the analytic branch feeds parity. No source-chapter order is imposed without dependencies. The general parity target includes p=3 and p dividing the class number; the canonical unit application states its additional hypotheses separately. No computational algorithm, copied source passage, sorry'd data, set_option, forbidden supplier, process path, or PR number was found in the package's roadmap text. The ordinary-theta ownership overlap is R03, rather than a reason to reject the entire scope.

Compared house shape with Completed/Chebotarev/README.md, Completed/ArithmeticDirichletSeries/README.md and TauCetiRoadmap/ClassFieldTheory/README.md. All seven layers have Examples and Dependencies; definitions have prose API lists and at least three section-level Checks. Those counts do not cure R07/R08 or the missing normalization in R11. Backticked public identifiers attributed to this package resolve to its ten public declarations; the local instance factPrime is implementation support. Mathematical symbols such as X_l are notation, not asserted Lean declaration names.

### Source sample, exact locators

| Target | Text opened | Assessment |
| --- | --- | --- |
| 0.5 | BKO21 lines 388–395, p.951 | Auxiliary exclusions and split prime correct; infinitude additionally uses the named Chebotarev supplier. |
| 0.6 | BKO21 lines 391–395, 435–438, pp.951–952 | Character family correct; package correctly separates order r from conductor r+1 instead of reproducing the source's mixed index. |
| 1.4 | JIA24 lines 42–70, p.2; BKO21 lines 479–488, p.953 | Self-duality, central sign and deletion implications match; no sign-positive converse asserted. |
| 2.1 | KATO04 lines 212–239, pp.121–122; 5242–5258, p.252 | Divisor and normalization agree; unconditional CM isogeny law has the printed error R01. |
| 2.8 | BKO21 lines 422–432, p.952; KATO04 lines 5463–5478, p.258, 5533–5536, p.259 | Direct finite character and deleted factors agree; Kato fixes the conjugated infinite character when BKO extraction loses bars. |
| 2.10 | BKO21 lines 404–415, p.951, 423–430, p.952 | Scaling follows from γ=per(ω)/Ω and the vector-valued formula; R02 is needed for its declared carrier. |
| 3.1 | BKO21 lines 435–466, pp.952–953 | Compositum, co-restriction and two regular factors agree after the conductor-index correction. Supplier labels need R09. |
| 4.3 | FINIS06 lines 862–868, p.787; 922–940, p.789; 1134–1147, p.794 | Formula is supported on the source's fully specified data; R11 restores missing split-case data. |
| 4.5 | FINIS06 lines 1221–1225, p.795 | All eigenspaces at sufficiently large level, p odd/split and ℓ≠p; quantifier order and normalization agree. |
| 4.6 | FINIS06 lines 101–122, p.769 | Weight-one specialization, nonsplit discriminant factor, finite exceptional set and lower-bound exception agree. |
| 5.1 | FINIS06 lines 61–69, p.768; BKO21 lines 491–508, pp.953–954 | φ̄ν/N, central shift and root sign correct here, unlike §4.1's API. |
| 6.1 | ROHRLICH84 lines 763–775, p.401; 821–823, p.402; 896–904, p.404 | Both asymptotic theorems and the universal exponent range are supported. Boundary Check is R07. |
| 6.3 | JIA24 lines 96–100, p.3 | Vanishing transport cited correctly and supplied by modular-symbol period coordinates. The conjugation Check is R08. |
| 6.4 | JIA24 lines 18–39, 66–70, pp.1–2; AH05 lines 141–152, p.4 | Arbitrary class number and fixed finite ramification set retained; AH05 explicitly separates the trivial character. |
| 6.5 | JIA24 Theorem 1; GREENBERG83 lines 317–333, p.247; QUEYRUT74 lines 86–97, p.135 | Conductor-exponent parity agrees with the local odd-order argument. The general local theorem remains a declared supplier contract. |

Also checked FINIS06 lines 902–917 and 1571–1592 for the repairs; KATO04 §15.8 in both extraction and page image; BKO21 lines 501–508 for the unit theorem; and Jia's four explicitly corrected misprints. The document does not need a new source request.

### Computed adversarial table

Each row records actual values or dimensions, not an elaboration claim. Failures refer to the findings above; “retain” means no repair to that statement was found. Infinite-family claims are source-verified, with these instances checking their domains and normalization.

| Statement | Instances | Values on the two sides / wrong-model value | Result; change |
| --- | --- | --- | --- |
| 0.1 equivariant type; conductorModulus | Gaussian CM character, inert 7; inverse and norm characters | φ((7))=−7=κ(7)7; norm is 49, inverse −1/7; φ(a)conjφ(a)=49=N((7)); modulus has empty infinite part | Native carrier and type discriminate; retain. |
| 0.1 congruence index | f=(1+i)³, powers of 1+i | v(U)=0; v((1+i)^nU)=n, infinitely many values versus claimed finite quotient | Fails; R04. |
| 0.2 anticyclotomic predicate | 1, norm N, odd class character | 1=1⁻¹; 49≠1/49; χ(ā)=χ(a)⁻¹ since aā is principal | Retain. |
| Conventions and 0.2 conductor | K=ℚ(√−7), p=5; K=ℚ(√−31), p=3 | Pic(O_5)=6, p-part at 25 is 5: c=2; Hilbert character order3 has c=0 rather than n+1=2 | Qualified §0.2 sound; R06. |
| 0.3 Euler factor, central value | inert 7; ramified place; functions differing at 1 | (1+7/49)⁻¹=7/8, wrong sign 7/6; ramified factor1; arbitrary continuation can have F(1)=0 or1, entire continuation cannot have both | Retain definitions; R07 Check. |
| 0.3 convergence/deletion | Re(s)=2, norm Q≥2; p=5 | absolute Euler parameter Q^(−3/2); deleted p-factor6/5≠0 with v₅=−1 | Nonzero denominator and valuation distinction retained. |
| 0.4 period datum | ω↦2ω; ω↦5ω at p=5 | Ω↦2Ω, A↦A/2, valuation unchanged; second change drops valuation by1 and is not Néron | Retain. |
| 0.5 split prime | K=ℚ(√−7), p=5, l=23,11,13 | −7≡4² mod23, 23≡3 mod5; 11≡1 mod5 excluded; 6 is nonsquare mod13 | Retain; admissible Frobenius (1,3) exists in C₂×C₄. |
| 0.6 auxiliary character | l=23, r=1; ν=1 | degree23, conductor23²; trivial degree1, conductor1; [g] evaluates to ζ₂₃, not ζ₂₃⁻¹ | Retain. |
| 1.1 canonical sign | D=7,11 | (2/7)=1, (2/11)=−1; −D mod8 is1,5 respectively | Split-dyadic target correct. |
| 1.2 auxiliary sign | inverse pair over split l, ν odd | ε(ν)ε(ν⁻¹)=ν(−1)=1; φ(λ)φ(λ̄)/l=1 | Root-number ratio1; retain. |
| 1.3 conductor parity | c=0,2,3,4; odd local χ | χ(Δ)²=1 and odd order imply χ(Δ)=1; (−1)^c=1,1,−1,1 | Retain general exponent formula; R06 for order labels. |
| 1.4 central zero | W=−1 at center; delete p=5 | Λ(1)=−Λ(1) implies2Λ(1)=0, hence0; (6/5)·0=0 | Retain, both primitive and deleted. |
| 2.1 divisor and norm | a=(5), h=[5] or[2] | degree25−25=0; pushforward by[5] is0 versus nonzero25[0]−E[5]; [2] permutes all25 points | R01; ordinary unit overlaps R03. |
| 2.2 canonical pair | K=ℚ(i), f=(3),(2) | four units inject into group of order8 modulo3, ray degree2; 1 and−1 coincide modulo2 | Injectivity hypothesis discriminates; retain CM pair. |
| 2.3 smoothing | two smoothing operators A,B nonzero-divisors | A⁻¹(Az)=z=B⁻¹(Bz); on augmentation A=N(a)−1≠0 for N(a)>1 | Localization required; no integral conclusion from inversion alone. |
| 2.4 realization | r=1 at inert7; r=2 local unit6 | inverse line −1/7, twisted49·(−1/7)=−7; local power36 versus6; full H¹ filtration dimensions2,1 | Fails as written; R02. |
| 2.5 reciprocity derivative | r=1,2,3; ω↦2ω | (r−1)!⁻¹=1,1,1/2; derivative and tensor factors multiply by2^(−r)·2^r=1 | Retain normalization. |
| 2.6 smoothing reciprocity | r=1, α≡2 mod5, χ=1 | αᾱ−α≡4−2=2 mod5; deleted factor6/5 has valuation−1 | Retain scalar formula after R02 carrier repair. |
| 2.7 integrality component | α≡2 or1 modp after ν/augmentation/Δ projection | α(ᾱ−1)≡2 or0; first invertible, second nonunit | Projection and Betti-lattice comparison remain necessary; no inference from rational identity. |
| 2.8 direct-character reciprocity | cyclic auxiliary group, χ(g)=ζ₂₃; χ=1 | evaluation sends[g] toζ₂₃, inverse convention toζ₂₃⁻¹≠ζ₂₃; at trivial p-character factor6/5 retained | Correct orientation; retain. |
| 2.9 character twist | scalar action a on Tφ, diagonal tensor | on Tφ∨ scalar a⁻¹; choosing a=2 gives1/2, not2; trivial twist gives1 | Correct dual, dependent on declared global twist contract. |
| 2.10 period change | v=2,u=−1,v=p | γ fixed, scalarA/2 times2ω=Aω; u negates class and scalar; p drops valuation1 | Retain. |
| 3.1 compositum | n=0,1; r=0,1; p=5,l=23 | local degrees24,600; M_(n,0)=F_n; r=1 uses conductor23² | Retain arithmetic; R09 citations. |
| 3.2 disjointness | intersection I of l-power degree, l∤h_K | [I:K] divides both l^r and h_K, hence1; no use of gcd(l,p²−1)=1 | Retain. |
| 3.3 semilocal factors | h_K=2, degree L[r]=l^r | 2l^r local factors; augmentation(x,y)=x+y rather than x; Artin of principal pO_c=1 | Retain. |
| 3.4–3.5 CM Frobenius/LT | Gaussian curve at7; p=5,n=1 | (X+7)², trace−14; parameter−5, degree(25−1)25=600, cyclotomic degree20 divides600 | Retain sign; R09 citations. |
| 4.1 μ and type | ℓ=5, unit valueζ₅; norm twist at z=i | v₅(ζ₅−1)=1/4; λ/N has component−i versus required i | μ correct; R05 type. |
| 4.2 Yang constant | K=ℚ(√−7) | 4√7/(4π)=√7/π; ramified correction1−0/q=1 | Retain. |
| 4.3 valuation data | inert ℓ=5; split ℓ=11 | v₅(7^(1/4))=0; permitted unspecified split choices1,11 give valuation shift0,1 | Nonsplit application correct; R11 completes general statement. |
| 4.4 repaired relation module | β₀=(1,1),β₁=(2,1); r=1,α′=0 | R={(x,−x)}, A=diagonal dimension1, not E² dimension2; α′=0 gives R=O_K,A=0 | F03(d) repaired. |
| 4.5 theta modℓ | integral scalar a=l(ϑ)/w_K, vℓ(a)=0; replacement ℓϑ | a modℓ≠0; vℓ(ℓa)=1, reduction0 | Existence of an integral representative with unit value is discriminating, not a claim for every representative. |
| 4.6 weight-one Finis | k=1; nonsplit unramified local data | (k−1)! (2π/√D)^(k−1)=1; Σμ+b=0, so almost-all valuation0; W=−1 yields L=0 outside family | Retain theorem. |
| 5.1 Finis family | ν=1, z=i; prime normQ | φ̄/N has componenti; denominator at0 is1−φ̄(a)/Q, identical to original at1 | Retain; fixes R05. |
| 5.2–5.4 unit values | D=7,p=5,l=23,ν≠1 | all inert μ=0,b₅=0,v₅(7^(1/4))=0; l-factors1, p-deletion6/5 | Finis gives v₅(Aν)=0 almost always; retain. |
| 5.5 witness | orders23^r, r=1,2,… | conductors23²,23³,… distinct; removing finite set leaves unbounded conductor | Retain existential consequence. |
| 5.6 coefficients | p∤d, u a unit; p=d | derivative of X^d−u at root d x^(d−1) is unit; at d=p it has positive valuation | Unramified proof uses coprimality; retain. |
| 5.7 tensor injectivity | F totally ramified,U unramified; U=F≠Φ | intersection degree1, tensor degree[F:Φ][U:Φ]; a⊗1−1⊗a maps0 in second case despite being nonzero | Retain domain restriction. |
| 6.1 count definition and first bound | P={5}, α=β=1,q=25,c=2/5; P=∅ | t≈3.624, no nonzero difference divisible25, count0; empty P allows only positive supported q=1, excluded eventually | Retain headline; Set.ncard used only on finite boxes. |
| 6.1 boundary Check | P={5},α=5,β=0,c=0,q=5,25 | counts6,0 respectively; t=1 in both | R07. |
| 6.1 second bound | d=11/20,s=7/16,q=25,α=β=1 | 5d/2−1=3/8<7/16<1/2; t≈5.873, count0<25^(7/16) | Retain exact exponent range. |
| 6.2 average | K=ℚ(√−7),R={5} | κ(5)=−1, Euler correction6/5; limit=(12/5)L(1,κ)≠0 | Support factor retained; arbitrary class number preserved. |
| 6.3 Galois vanishing | normalized value0, σ fixing K; complex conjugation on i | σ(0)=0; conj(i)=−i≠i | Main theorem sound; R08. |
| 6.4 correct-sign nonvanishing | vanishing orbit; finite deletion at5 | all normalized conjugates0 imply average0, contradicting nonzero limit; (6/5)L≠0 when L≠0 | Retain almost-all theorem, not pointwise nonvanishing. |
| 6.5 parity headline | K=ℚ(√−7),p=5,ε=1,c=0,2,3,4; unramified class character | signs1,1,−1,1; wrong-sign center0; unramified c=0 preserves sign independent of order | Retain Lean signature and arbitrary class number. |

### Lean acceptance test and headline coverage

Ran the required lake env lean invocation from the pinned content checkout on packages/NonordinaryCMSpecialValues/Suggested.lean. Exit 0; exactly three warnings, all “declaration uses sorry”, at lines 127, 137 and 163. Both imported Tau Ceti object files were available; no build/update/cache command was needed. The import list is Mathlib followed by the two individually used HeckeCharacter modules.

A separate scratch copy appended #check @name for all 11 actual declarations, including factPrime inside its local section. It elaborated. Every binder was compared with the README: the parity signature retains quadratic CM, primality, p≠2, the inert ideal equation, equivariant type, unramified φ and ν, odd finite order, anticyclotomic ν, and normalized uniformizers. The count theorems retain algebraicity, nonzero direction, supported q and all exponent inequalities. No binder was dropped. The supplied signatures.md's apparent extra declaration “)” is a docstring parsing artifact; its reported appended-code parse error does not affect this clean rerun.

Probed every sorried theorem (all three) on a scratch copy using alternatives that must close the goal: simp, rfl, infer_instance and exact?. All three end with “exact? could not close the goal”; none of the earlier alternatives closes. No theorem is padding or a Check restatement. The library near-match candidates concern Dirichlet L-functions, counting interval multiples, or local prime definitions, and do not prove these statements.

| Headline from summary / deep target | Acceptance-test disposition |
| --- | --- |
| Parity dichotomy, including forced central zeros | centralValue_parity_dichotomy, native HeckeCharacter with real predicates and Euler-product continuation definition. |
| Rohrlich vanishing and power-saving counts | rohrlichCount_eq_zero and rohrlichCount_lt, finite integer box on native p-adic integers. |
| Finis divisibility, BKO unit theorem and unit witness | Explicitly named in docstring; CM periods, algebraic avatars and local invariants not supplied by the pins as a matching interface. |
| Kato reciprocity and integral BKO class | Named in docstring; the CM coefficient realization and its period/regulator comparison are missing. README realization must be corrected by R02. |
| CM Lubin–Tate comparison, torsion/ring-class disjointness and semilocal splitting | Named in docstring. R10 corrects the claim about ring-class carriers; the full CM attachment/torsion comparison remains unavailable. |
| Root-number formulas and canonical root sign | Named in docstring; no native Hecke epsilon/root-number carrier found at the pins. |
| Jia Galois-average limit | Named in docstring; algebraic-character coefficient transport is missing as a matching native interface. |

No additional statable headline was found absent, and no free-Prop stand-in is used. HasCentralValue has a real body: existence of an entire continuation agreeing with the native Euler product, not an arbitrary assumed conclusion.

### Pinned declarations opened and compared

Paths in this table are relative to the respective pinned library repository. Native definitions do not silently supply extra structure: IsCMField alone does not mean degree two over ℚ; HeckeCharacter does not mean finite order; Set.ncard alone does not certify finiteness; IsCongrOne is on K× and excludes zero.

| File and line at pin | Declaration / content checked |
| --- | --- |
| Mathlib/NumberTheory/NumberField/Basic.lean:102 | NumberField.RingOfIntegers is integralClosure ℤ K. |
| Mathlib/NumberTheory/NumberField/ClassNumber.lean:65 | NumberField.classNumber is cardinality of ClassGroup. |
| Mathlib/NumberTheory/NumberField/CMField.lean:70,142 | IsCMField; complexConj over the maximal real subfield. |
| Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:666 | IsQuadraticExtension carries freeness and rank two. |
| Mathlib/Algebra/MonoidAlgebra/Basic.lean:250 | lift_single evaluates single a b to b•F(a), with no inverse. |
| Mathlib/RingTheory/LinearDisjoint.lean:233 | Subalgebra.linearDisjoint_iff_injective concerns the multiplication map. |
| Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412 | DirichletCharacter.LFunction_apply_one_ne_zero, χ≠1; not the Hecke parity headline. |
| Mathlib/NumberTheory/Padics/PadicIntegers.lean:71; PadicNumbers.lean:545 | PadicInt subring and Padic completion, prime instance retained. |
| Mathlib/Data/Set/Card.lean:643 | Set.ncard is encard.toNat; bounded box supplies finiteness here. |
| Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107; Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172 | HasProd and Differentiable used by HasCentralValue. |
| Mathlib/RingTheory/Algebraic/Defs.lean:45; FractionalIdeal/Basic.lean:83; DedekindDomain/Ideal/Lemmas.lean:490 | IsAlgebraic, FractionalIdeal and HeightOneSpectrum native carriers. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80 | HeckeCharacter is a continuous idele-class hom to ℂ×; IsFiniteOrder is separate. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85,181,254,270 | finiteComponent, conductorExponent, finiteConductor and finiteConductor_ne_bot. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120,155,200 | idealCharacter; prime value uses uniformizer, principal congruence value is inverse infinite component. |
| TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98,316; RayClass/Basic.lean:87 | Modulus, IsCongrOne, principal-ideal membership adapter. |
| TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111 | Native ringClassField; contrary to R10's docstring claim. |
| TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:15 | Continued L-function documented there is for ray-class characters, not this weight-one ideal character. |

### Supplier and ownership audit

Read board-packages-index.txt before the search; its three independently listed packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Used roadmaps grep by objects (theta units, elliptic units, Finis, Rohrlich, anticyclotomic predicates and Fröhlich–Queyrut), then roadmaps show to inspect matching heads. The five closest roadmaps in overlaps.md were opened. No same fully qualified Lean declaration was found by the predicate/count search. Existing ring-class and character carriers are consumed; R03 identifies a construction that must be imported.

The supplied overlap report has no conflicting head, dropped-id item or revision-only id. AL's retained forwarding list is specifically honored. AnticyclotomicLocalUnits #1692, README lines 15 and 104, still uses design labels NCM.0–NCM.5; this package is not an open revision deleting an on-main id, so this is recorded as downstream coordination, not an additional violation of the dropped-id rule. Its signed projections are not constructed here. CMRankZeroConverse #1744 uses this branch's values; HeegnerPointEulerSystems #1423 owns Heegner points, not these CM theta units. KatoEulerSystems #1804's overlap is resolved upstream through PadicFamilies, as R03 explains. NoncommutativeAndEquivariantIwasawa #1307 is an earlier ordinary special-case owner. No circular handoff was found for Finis divisibility or the inert parity theorem.

| Supplier citation | Current location opened; result |
| --- | --- |
| ComplexMultiplicationAndExplicitReciprocity §§1.2,2.2,3.2,4.1–4.3 | PR #1254, TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:354,445,583,634,666,684. Named targets resolve; arithmetic Frobenius −p and period pairing agree. |
| AutomorphicLFunctionsAndLocalFactors AL.1,AL.5 | PR #924, TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:973,1004,1107,2379,2448; old completion/continuation ids forward at lines25–27. |
| ArithmeticGaloisRepresentations §2.7 | PR #856, TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2398: rootNumber_eq_prod_tateLocalConstant and additive-character independence. |
| SelmerIwasawaCohomology §§0.8–0.11,3.6–3.7 | PR #869, TauCetiRoadmap/SelmerIwasawaCohomology/README.md:222,236,250,264,1468,1492. Full-field Kummer uses completion; finite-S version is a tensor; cyclotomic twist is supplied. |
| PadicHodgeRegulators §§1.4,1.7,1.11 | PR #1498, TauCetiRoadmap/PadicHodgeRegulators/README.md:523,572,646. Dual exponential, traces, and componentwise semilocal maps resolve. |
| ModularSymbolsPadicLFunctions §§1.2,4.3 | PR #968, TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1380,2520. Algebraic critical coordinates transport; arbitrary complex periods do not. |
| GL2AutomorphicRepresentationsAndTransfer R17.4.16 | PR #931, TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2692. AI(θ) has L-function L_K(θ), with correct quadratic central character and conjugate pair. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | Board package §§2.2–2.4,4.3–4.4; exact repointings and computed sign in R09. |
| DiophantineApproximationAndTranscendence §§2.1,2.3 | Main, TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:953,1035. Finitely many places and p-adic approximation branch. |
| GlobalNumberFields Layers9–11 | Main, Completed/GlobalNumberFields/README.md:508,531,571. Hecke carriers, infinity types and orders/Picard groups. |
| ClassFieldTheory Layer13 | Main, TauCetiRoadmap/ClassFieldTheory/README.md:1924,2128. Ring-class correspondence and principal Artin relation; native implementation now exists. |
| Chebotarev Layer10 | Main, Completed/Chebotarev/README.md:410. Density #C/#G and finite-exclusion invariance. |
| LocalFieldsRamification Layers2–3 | Main, Completed/LocalFieldsRamification/README.md:576,724. Unramified and totally ramified extensions, finite residue separability retained. |
| EllipticCurves Layers1–3 | Main, TauCetiRoadmap/EllipticCurves/README.md:423,647,683. Isogenies/differentials, torsion/Tate realization, Frobenius polynomial. |
| ArithmeticDirichletSeries Layers3,5 | Main, Completed/ArithmeticDirichletSeries/README.md:190,237. Euler products, ideal counts and partial summation. |

The dependency command was run unchanged as requested, with movable placement, against ORDER.txt and main. Its complete substantive output was:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The resolver also reported no cross-roadmap or Lean name found nowhere, but expressly did not check pinned library names; the manual pinned audit above supplies that check. Its coarse success does not detect R09's stale target ids.

Both declared gaps have identical slugs and needs in README lines 73/83 and design/plan.json:1892. The local Fröhlich–Queyrut formula and the global finite-free character twist are precise contracts, with named earlier suppliers. SelmerIwasawaCohomology §3.7 currently supplies the cyclotomic case; the full-field versus finite-S Kummer distinction is preserved. No earlier matching general statement was found. They are not findings and are not requested again. Because the verdict is needs_changes, conditional_gaps is not used in review.json.

## Not verifiable

- JIA24's published Acta Arithmetica version was not read. All checks use the manifest's arXiv v1 numbering, so no claim about changed published numbering is made.
- BKO21's extraction drops some overlines. The reciprocity orientation was cross-checked against KATO04 Proposition15.9; the source sample does not claim that the extraction itself distinguishes every bar. Kato pp.252 and256 were additionally read as page images.
- Ownership was checked against main, the available board packages and the supplied open-head tooling. No unnamed or inaccessible external branch was sought. The board index does not provide a separate PR number for the Lubin–Tate package, so its checked local package path is given instead.
- No missing-source request remains. This is a mathematical review of planned results, not a proof of the three admitted Lean theorems.

## Source issues

- **Error** in KATO04 at (15.4.2), printed p.252: the source says CM theta functions are preserved by every isogeny norm; it should require a kernel prime to the smoothing ideal; affects a stated result.
- **Misprint** in BKO21 at §3.0.2, printed p.952: the source uses l^m for both order and ray conductor of a nontrivial auxiliary character; it should use conductor l^(m+1) for exact order l^m; affects a stated result.
- **Misprint** in JIA24 at the rational-principal formula before (2.1), p.4: the source writes κ(n)n⁻¹ for the ideal character; it should be κ(n)n; affects the proof.
- **Misprint** in JIA24 at (2.43), p.10: the source gives a positive exponential in the tail bound; it should be exp(−N(a)/(Af)); affects the proof.
- **Misprint** in JIA24 at §4 before Proposition5, p.18: the source takes the congruence modulo Z_p; it should be modulo qZ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), p.20: the source bounds the box by q⁻¹; it should be q^c; affects the proof.
