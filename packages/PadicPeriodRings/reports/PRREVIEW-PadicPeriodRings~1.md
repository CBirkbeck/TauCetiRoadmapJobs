# Review of PadicPeriodRings (pull request #940 at 8839b29)

**Verdict:** needs changes

🤖 AI review by independent-review-PRREVIEW-PadicPeriodRings~1. The mathematical supplier contracts need repair, and the gate fails. The two reported upward edges need qualification: both names have roadmaps on main, which this review's contract permits consuming. They are not, by themselves, evidence of a mathematical cycle. No PR file was changed.

## R01 (P1) — The general-residue ramification prerequisite is not supplied

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:29`, also 238, 242, 251 and 267: “ramification over complete discretely valued fields with arbitrary perfect residue field”.

**Claim:** LocalFieldsRamification Layers 3–4 supply general-base Herbrand theory, full Hasse–Arf, absolute upper numbering and completed maximal unramified comparison.

**Witness:** On main, `TauCetiRoadmap/LocalFieldsRamification/README.md:19` exports nonarchimedean local fields. Its valuation at line 85 uses finite residue cardinality. `TauCeti/RingTheory/LocalRing/RamificationGroup.lean:680` supplies a lower filtration, not the claimed package.

Take the roadmap's own `K=Frac W(𝔽_p(s)^perf)`: its residue field is infinite, so the local-field contract does not apply. A real-indexed lower filtration on a local ring does not imply Herbrand quotient compatibility, Hasse–Arf or invariance under completed unramified extension. I checked main rather than treating the open revision of this existing roadmap as a supplier. No matching declared gap exists. LocalFieldsRamificationPartII appears in the order, but the roadmap registry has no readable contract for it.

**Repair:** Retain the general domain. Give each missing general-residue prerequisite an explicit owner: establish precise supplier gaps on the earlier Part II extension, with matching plan/README slugs and separate needs for finite upper ramification/Hasse–Arf and completed unramified comparison, or make the missing results targets here before §2. Cite the pinned lower-filtration API only for what it actually defines. The replacement contract must apply to the displayed infinite-residue `K`; restricting `K` to local fields does not repair the requested library.

## R02 (P1) — Unit-filtration reciprocity is attributed to a section that does not state it

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:30`, 110 and 114: “`U_F^n` maps onto `Gal(L/F)^n`”.

**Claim:** ClassFieldTheory Layer 7 supplies this equality, including depth zero, and the absolute density statement used for upper-break spacing.

**Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:1312–1431` on main constructs the Artin map, cyclotomic normalization and conductor minima; it does not state the unit/upper-ramification comparison. The pinned `Local/ArtinMap.lean:145,215` gives restriction and continuity, not that comparison.

This is additional mathematics, not a consequence of merely naming a continuous reciprocity map. The finite-residue source result is Serre, XV §2, Theorem 2 and Corollary 3, but a literature citation is not an implementation owner.

**Repair:** Consume the existing Artin map by its pinned declarations and add the missing comparison as an owned target before `senTowerEstimates`, or declare its precise supplier gap. State, for every finite abelian extension of nonarchimedean local fields and every integer `n≥0`, the image equality for `U_F^n`; separately give the inverse-limit density consequence. Test `ℚ₃(ζ₃)/ℚ₃`: `U^0` maps onto the order-two inertia group and `U^1` maps to 1. This pins the depth-zero/tame boundary that continuity alone cannot supply.

## R03 (P2) — Resolve the ClassFieldTheory gate failure against its main/pinned ownership

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:114,255`, supplier `ClassFieldTheory`.

**Claim:** The worker and repeated dependency checks report `UPWARD: PadicPeriodRings (#19) -> ClassFieldTheory (#258) at README lines [114, 255]`.

**Witness:** That exact line occurs in both gate runs. ClassFieldTheory also exists on main; `TauCetiRoadmap/ClassFieldTheory/README.md:1220,1312` are the finite and absolute reciprocity layers.

The ordering diagnosis is a false positive for the existing main-branch material under the brief's allowed-supplier rule. It does not cure R02: the stronger filtration result is absent from that main contract.

**Repair:** Cite the actual pinned reciprocity declarations for the available inputs and give the missing comparison the ownership required by R02. Obtain a passing gate, with the worker resolving any remaining main-roadmap classification error. Do not move this roadmap after a downstream revision or re-plan ClassFieldTheory. Retest the depth-zero example in R02 and the dependency check; no tool or order file was edited during this review.

## R04 (P2) — Resolve the ProfiniteArithmetic gate failure using the completed/pinned supplier

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:28,49`, supplier `ProfiniteArithmetic`.

**Claim:** The check reports `UPWARD: PadicPeriodRings (#19) -> ProfiniteArithmetic (#324) at README lines [28, 49]` and refuses automatic movement because of an intervening consumer.

**Witness:** Main contains `Completed/ProfiniteArithmetic/README.md`. At the pin, `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean:89,100,140,223` supplies the generator, density, lift and joint continuity; `ZHat/Ring.lean:69,146` supplies the topological ring.

This too is an ordering false positive for completed material, not evidence that the mathematics needs the later revision.

**Repair:** Replace the broad future-supplier wording with exact pinned contracts for the profinite carrier, powers and units actually consumed. Keep the completed roadmap as provenance in scope. Have the worker resolve any remaining completed-roadmap classification issue and rerun the gate. On the test `σ↦1+p` acting on `ℤ_p`, the pinned powering API still gives `(σ−1)ℤ_p=pℤ_p` and coinvariants `ℤ/p`; no new owner or late dependency is necessary.

## R05 (P2) — The native Galois-action headline is absent from the acceptance test

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:76`: “gives a continuous action map `G_K × ℂ_p → ℂ_p`”; `Suggested.lean:87–90` only defines its underlying function.

**Claim:** §1.1 promises joint continuity, but no theorem in the file asserts it, and the module docstring does not classify this finite-base action theorem as unstatable.

**Witness:** I elaborated the following signature against the same imports and pins, with only `sorry` warnings:

```lean
theorem action_headline_probe (p : ℕ) [Fact p.Prime]
    (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K] :
    Continuous (fun z : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) × ℂ_[p] =>
      completedGaloisAction (z.1.restrictScalars ℚ_[p]) z.2) := sorry
```

**Repair:** State this headline on the existing action function, with a README name and docstring. Keep identity/composition checks in the README. The type was tested for the finite-base interface; the identity acts by `x↦x`, while an automorphism sending `√p` to `−√p` remains nontrivial. Continuity of each individual completion map is not the omitted joint-continuity statement.

## R06 (P2) — Envelope definitions silently lose the coefficient domain

**Location:** `TauCetiRoadmap/PadicPeriodRings/Suggested.lean:231–247,266`; README 339: “a regular pair `(p,ξ)` in a `ℤ_p`-algebra”.

**Claim:** The elementary envelope definitions have the stated `ℤ_p`-algebra domain.

**Witness:** `#check @periodPDEnvelope` elaborates to a function of `p`, `A`, `[CommRing A]` and `ξ`; both `[Fact p.Prime]` and `[Algebra ℤ_[p] A]` disappear. The same happens to its positive powers, ideal and completion.

This matters for the total inverse used in the body. With `p=2`, `A=ℤ[X]`, `ξ=X`, degree three is computed as zero: 6 is not a unit in `ℤ[X,1/2]`, so `Ring.inverse 6=0`. It cannot be the advertised `X³/6`; multiplication by 6 gives 0 rather than `X³`. The theorem signatures retain the coefficient hypotheses, so this is a definition-domain mismatch, not a counterexample to their restricted conclusions.

**Repair:** Put the prime and `ℤ_p`-algebra binders explicitly on all four definitions. A scratch copy with those explicit binders elaborates, and its printed signature retains them. It excludes `ℤ[X]`; for the intended control `A=ℤ₂[X]`, 3 is a unit and the degree-three generator satisfies `6γ₃(X)=X³`.

## R07 (P3) — Restore the required roadmap structure and distinguish prose targets from Lean names

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:1,37,70,214,333,357`; for example “`periodTraceIdeal`” at 104 and “`senUpperBreaks`” at 238.

**Claim:** The README follows the prescribed layer form and backticked own declaration names denote declarations in Suggested.lean.

**Witness:** There is no “How to read the build”, no layer-ending “Examples” or “Dependencies”, and no “Downstream consumers” section. Neither `periodTraceIdeal` nor `senUpperBreaks` occurs as a declaration in Suggested.lean.

**Repair:** Use `# Roadmap: …`, `## Layer k: …`, the build paragraph, per-layer examples/dependencies and the downstream section. Keep README-only targets as prose names rather than implying Lean declarations; do not pad Suggested.lean with their API. Preserve the computed `e=2,d=3` trace example when reorganizing it: the two output ideals remain `2ℤ₂` and `4ℤ₂`.

## R08 (P3) — Give the small definitions their own discriminating API and Checks

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:212,313`; `Suggested.lean:117–129` defines `padicUnitLog`, `residueInertia` and `cyclotomicTower`.

**Claim:** Each retained definition has its defining mathematics, usable API and at least three discriminating Checks in the README.

**Witness:** The README merely names `padicUnitLog` as the coefficient of the H¹ generator. It never states its exponent/series normalization or supplies three Checks for that definition; the inertia and tower definitions likewise lack their own API lists.

**Repair:** Add prose definitions and API for the actual bodies. For the logarithm check `log(1)=0`, `log(−1)=0` also at 2, and `log(4)/3≡7 mod 9` at 3 (hence valuation 1); omitting the prefactor gives residue 1 modulo 9 instead of 7. For inertia distinguish identity, tame ramification and nontrivial residue Frobenius. For the tower distinguish the `n=0` root 1, `μ₂` already in `ℚ₂`, and the nontrivial `μ₄` extension. Keep these Checks out of Suggested.lean.

## R09 (P3) — Correct and version the source locators

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:92,421,437–439`.

**Claim:** Fontaine–Ouyang Proposition 4.3 is on printed p. 88; the cited Colmez–Fontaine item is identified only by its publication and proposition number.

**Witness:** `fontaine-ouyang line 3756` is printed p. 89 and line 3757 begins Proposition 4.3. The linked Colmez–Fontaine author text has Proposition 1.3(iv)–(v) on printed pp. 11–12 (`colmez-fontaine line 568`).

**Repair:** Change the Ax–Sen locator to p. 89, retain Proposition 4.9 at p. 91, and identify the author version and its pp. 11–12 for the fundamental sequence. Include version notes for fetched preprints (Bhatt was read as arXiv:1204.6560v1). The corrected locators support the closed-fixed-field and filtered-surjectivity statements; this is not a request to weaken them.

## R10 (P3) — Record the cited sources in the required manifest

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:433–449`, References.

**Claim:** The 15 cited works have the required source provenance records.

**Witness:** This folder contains README.md, Suggested.lean and metadata.toml only; no sources.toml is present. The sources service retrieved 11 texts and classified four works as paywalled/uncertified.

**Repair:** Add the required `tauceti-roadmap-sources/v1` manifest with one stable key per work, exact target locators, legal retrieval provenance and the four uncertified statuses. Do not copy source material into the repository. Retest that each of the 15 reference entries resolves to one manifest entry; published/preprint forms share a key.

## Verified sound

I read all 449 README lines and all 287 Lean lines, including every Needs line and Check. Main-branch shape/context reads were LocalFieldsRamification, ProfiniteCohomology and Completed/ProfiniteArithmetic. The recorded pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The direct `lake env lean` elaboration passed with exactly 13 `sorry` warnings. The two imported Tau Ceti modules were built first. I elaborated a scratch copy containing `#check @name` for every one of the 21 declarations: 13 theorems, seven definitions and one abbreviation. The Tate–Sen and de Rham statements retain the complete/discrete/perfect/algebraically-closed hypotheses; the four envelope definitions have the erasure described in R06. Nothing was changed in the PR.

All 13 admitted theorems were probed with `simp`, `rfl` and `infer_instance`, each required to close the whole goal. None closed. Object searches found no matching single pinned theorem that closes a retained headline. In particular Mathlib's finite-cyclic cohomology is not continuous cohomology of `Ẑ`; no padding finding is raised. These probes are not proofs of the admitted statements.

The headline inventory is: procyclic H¹ in three coefficient domains; the completed Galois action; the two Ax–Sen–Tate assertions; normalized traces and almost trace surjectivity; Tate–Sen H⁰/H¹ and the character criterion; the de Rham DVR/field and topological graded comparison; completed unramified descent and break spacing; the principal algebraic/completed PD universal properties; general period structures and invariant functors; fixed fields, regularity and the fundamental exact sequence. The 13 Lean theorems cover the indicated algebraic/cohomological headlines except R05. The docstring explicitly names the missing ramification/proalgebraic carriers, unramified-completion action, period topology/action/period `t`, and crystalline/semistable carriers needed for the other deferred signatures. Normalized traces and their Banach splitting remain README construction targets; no artificial carrier or free predicate substitutes for them.

### Seeded source audit

All ten seeded subsections were checked against text at their locators. No additional locator was explicitly marked unverified in the README. These are source support checks, distinct from proving the roadmap's targets.

| Target | Text read and result |
| --- | --- |
| 0.1 | Rubin Appendix B Lemma 2.8, printed p.153/PDF p.163, `rubin line 6638`: evaluation and the three domains. The printed discrete domain is p-primary; the README's finite-orbit/periodic-sum argument extends to arbitrary discrete torsion without imposing one prime. |
| 0.2 | Rubin Definition 2.1 and Proposition 2.5(i), pp.151–152, `rubin line 6571`, `rubin line 6601`; continuous-section qualification at line 6576. General topological-group exactness was checked in the pinned Tau Ceti theorem. Brinon–Conrad Proposition 14.3.3 and Theorem 14.3.4, pp.253–255, `brinon-conrad line 10833`, supports the descent application. |
| 1.1 | Brinon–Conrad §2.1, p.12, `brinon-conrad line 444`; Fontaine–Ouyang §4.1.2 before Question 4.8, p.91, `fontaine-ouyang line 3880`. Isometric extension agrees with the native spectral-norm construction. |
| 1.2 | Fontaine–Ouyang Proposition 4.3, p.89, `fontaine-ouyang line 3757`, and Proposition 4.9, p.91, line 3888; Brinon–Conrad Proposition 2.1.2, p.12, `brinon-conrad line 452`. Characteristic zero gives completion of the fixed field; the characteristic-p alternative would require perfect closure. R09 corrects the page. |
| 1.3 | Brinon–Conrad Theorem 13.1.2, p.199, `brinon-conrad line 8495`; Lemma 13.1.6, p.201, line 8585; Lemma 13.1.8/Proposition 13.1.9/Lemma 13.1.10, pp.203–205, lines 8674,8714,8748; Lemmas 14.1.3–4 and Proposition 14.1.7, pp.237–241, lines 10168,10204,10291. Fontaine–Ouyang Corollaries 1.96,1.99 and Proposition 1.104, pp.38–40, lines 1832,1847,1901. The roadmap retains the necessary rounding term and all-stage density, unlike a flawed source proof step below. |
| 1.4 | Brinon–Conrad Lemma 14.3.1, pp.251–252, `brinon-conrad line 10735`, with its negative sign in degree one at line 10744; Theorem 14.3.4, pp.253–255, line 10838. Fontaine–Ouyang Corollary 4.45 and Proposition 4.46, pp.105–106, lines 4435,4452. The README uses the full cyclotomic kernel and controlled approximants; it does not silently pass from algebraic cochains to continuous cocycles. |
| 1.5 | Fontaine §1.5.1–7, pp.71–74, `fontaine-corps line 399`: DVR and residue at 405; canonical inverse-limit topology at 416; logarithmic uniformizer at 431–448; graded twists at 458; fixed fields at 485–494. |
| 4.1 | Fontaine §§2.3.3–4, pp.78–79, `fontaine-corps line 611`; logarithmic construction §§3.1–3.2; embedding Theorem 4.2.4, p.86, line 855 and proof §4.3. Brinon–Conrad Propositions 9.1.1–3, pp.128–130, lines 5428,5434,5457. The additional detailed inductive-limit continuity claims are construction obligations, not direct quotations of the embedding theorem. |
| 4.2 | Fontaine §5.1, pp.155–157, `fontaine-semistable line 1437`: invariant modules, monodromy kernel at 1464–1475, and dimension criterion at 1476. The dual comparison has direction `D(V∨) → D(V)∨`, as in §1.3 at line 335. |
| 4.3 | Fontaine §1.5.7, p.74, `fontaine-corps line 485`; Proposition 5.1.2 and Lemma 5.1.3, pp.155–156, `fontaine-semistable line 1403`; regularity Proposition 1.4.2, pp.123–124, line 353. Colmez–Fontaine Proposition 1.3(iv)–(v), author text pp.11–12, `colmez-fontaine line 573`, supplies filtered and unfiltered exactness. |

Additional checks: Brinon–Conrad Definition 1.3.1 at line 259 really allows arbitrary perfect residue fields. Its completed unramified descent Lemma 3.2.6, pp.36–37, line 1472 covers finitely generated modules with torsion, not just free modules. Serre geometric reciprocity Theorem 1, p.129, `serre-geometric line 970` has domain `π₁(U)`; Proposition 9/Theorem 2, pp.137–138, lines 1275,1302 support the conductor statements. Fontaine's principal presentation is at `fontaine-corps line 611`; Bhatt Proposition 9.9, p.35, `bhatt line 1709`, and BMS Definition 3.22(i), p.27, `bms line 1310` agree with the completed envelope construction. General-ideal and derived comparisons remain consumer work.

### Computed adversarial table

The 61 rows distinguish a successful mathematical test from an unresolved supplier/shape issue. Values are computations on test instances, not a claim that example testing proves a universal theorem. Fields have `1≠0`, so zero rings, equal-characteristic fields and inseparable mixed-characteristic extensions are excluded from the field theorems. The algebraic envelope definitions admit additional junk inputs until R06 is repaired.

| Statement / object | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: p-normalization | `ℚ₂(√2)/ℚ₂` | `ord_L(2)=2`; common `v(2)=1`, `v(√2)=1/2` | Consistent; use e=2 rather than 1. |
| 0.1 discrete H¹ | `Ẑ`, trivial `ℤ/2`, `ℤ/3`; zero module | Evaluating a homomorphism gives respectively `ℤ/2`, `ℤ/3`, 0; quotient by σ−1 gives the same | Pass; no good-prime restriction. |
| 0.1 integral H¹ | `C=ℤ₂`, σ=3; `C=ℤ₃`, σ=4 | σ−1 is 2 or 3; quotients `𝔽₂`, `𝔽₃`; invariants are 0 in both | Pass; distinguishes invariants from coinvariants. |
| 0.1 rational H¹ | trivial `ℚ₃`; σ=2 on `ℚ₃`; zero space | H¹=`ℚ₃`,0,0; quotients by 0,1,identity on 0 are `ℚ₃`,0,0 | Pass; σ=2 on `ℚ₂` excluded because valuation is nonzero. |
| 0.1 finite-group negative control | `Γ=C₂`, trivial `ℚ₂` | H¹=0 by averaging, whereas `(σ−1)`-quotient=`ℚ₂` | The theorem correctly requires `Ẑ`, not every finite procyclic group. |
| 0.2 inflation/restriction | H=1 and H=G | Maps `(id,0)` and `(0,id)` respectively; image=kernel in both | Pass on supplied explicit cochains. |
| 0.2 finite descent | `C₃` and `S₃`, trivial `ℚ₃`; `C₃` on `𝔽₃` | Rational H¹=0,0, using 1/3 and 1/6; characteristic-3 H¹=`𝔽₃` | Pass; characteristic-zero hypothesis excludes the negative control. |
| Completed action definition | identity and σ(√3)=−√3 | Extension values `x` and `−√3`; distance between ±√3 is `3^(−1/2)` | Correct native function; R05 adds joint continuity headline. |
| 1.1 composition / scalars | σ²=1 on `ℚ₃(√3)`; a∈ℚ₃ | σ²(√3)=√3; σ(a)=a | Pass; zero map fails at 1. |
| 1.2 finite fixed field | `K=ℚ₂`, x=2; x=√2 | Invariant predicate true/false; membership in K true/false | Pass in both directions. |
| 1.2 closed fixed field | H=1; full G; cyclotomic kernel | Fixed fields `ℂ_p`, `ℚ_p`, `K̂∞`; closures of algebraic fixed fields are the same | Pass; replacing K̂∞ by K∞ loses limits. |
| 1.3 trace ideal | unramified quadratic, r=0,1; `ℚ₂(√2)`, r=0,1 | Unramified exponents 0,1; ramified floors `⌊3/2⌋=1`, `⌊4/2⌋=2`; actual traces `2ℤ₂`, `4ℤ₂` | Pass; floor is essential. |
| 1.3 trace inequality | `L=ℚ₂(√2)`, x=1 | `v Tr(1)=1`; rounded RHS `0+3/2−1/2=1`; unrounded RHS=3/2 | README passes; source error below. |
| 1.3 Sen different growth | `L_n=ℚ₂(ζ_(2^(n+2)))`, base `ℚ₂(i)` | Relative different valuation n; RHS `n+c+2^(−n)a_n` with c=a_n=0 is n | Pass; unramified tower gives 0 instead of n+bounded. |
| 1.3 upper-break input | same 2-adic tower; finite tame `ℚ₃(ζ₃)` | Eventual break increment 2=`ord_(ℚ₂(i))(2)`; tame unit images have orders 2 at depth 0, 1 at depth 1 | R01–R02: these are the missing supplier domains/identities. |
| 1.3 algebraic trace descent | M=F; finite non-Galois M inside normal N | Identity trace gives a; transitivity gives `Tr_M/F(Tr_N/M x)=Tr_N/F x=a` | Pass; no normality restriction on M. |
| 1.3 almost trace | M=F, a=p, α=1; unramified F and M=F(p^(1/p²)) | Trace p=p and `v(α)=0>−δ`; negative control d=`3p²−1`, trace ideal=`p²O_F`, excludes p | Pass; almost statement is algebraic, not merely dense image. |
| 1.3 normalized trace | `K=ℚ₃(ζ₉)`, n=2,3 | Degrees 1,3; actual normalization sends 1 to 1,1; `3^(1−n)Tr` sends 1 to 1/3,1/3 | Pass. |
| 1.3 normalized trace growth | unramified degree `p^(m−n)` | Integral trace surjective; normalized operator norm=`p^(m−n)→∞` | Correct negative control. |
| 1.3 trace splitting | x∈K_n and trace-zero y | `(R_n x,(1−R_n)x)=(x,0)`; decomposition of y is `(0,y)` | Pass; zero projector fails R_n(1)=1. |
| 1.4 finite trace homotopy | C₂ acts by s(x)=−x; α=1/2; a=dx | a(s)=−2x; b=x; db(s)=−2x=a(s); defect 0 on both sides | Pass; reversing b's sign gives +2x. |
| 1.4 homotopy defect / nonabelian control | S₃, trivial action, α=1/6, constant cochain a=q | b=−q; db−a=−q; `−Σ(1/6)da=−q` since da=q | Pass; the identity is not limited to cyclic groups or cocycles. |
| 1.4 approximation | algebraic constant cochain q on any finite quotient | Approximation error 0, differential error 0; for q≠0 its differential is q, not 0 | Pass; no false cocycle approximation. |
| 1.4 primitive limits | c=1/2, v∞f=0; residual f=0 | Increment lower bounds `−1/2,1/2,3/2,…`; residual lower bounds `0,1,2,…`; limit defect=0; zero primitive=0 | Pass; independent primitives plus alternating constants need not converge. |
| 1.4 cyclotomic Banach H¹ | i=0; i=1 at sufficiently high stage | On K_m, A=0 or χ(γ_m)−1≠0; quotients K_m or 0; X_m quotient=0 | Pass; descends to K or 0 with finite quotient retained. |
| Tate–Sen H⁰ | i=0,1,−1 | K,0,0; invariant equation for x=0 true in all cases, for x=1 true only at i=0 | Pass on stated domain. |
| Tate–Sen H¹ | c=logχ at i=0; c=0; nonzero twists | Unique scalar k=1; k=0; nonzero-twist class=0 | Pass; primitive b is not asserted unique. |
| Log definition | p=2, x=±1; p=3, x=4 | Series=0 for ±1; log(4)=3−9/2+27/3−… gives log(4)/3≡7 mod9 | Correct values; R08 records missing API/Checks. |
| Inertia definition | identity; tame automorphism; residue Frobenius | Residue difference norm is 0, <1, and 1 for a moved nonzero residue element respectively | Correct in intended valued closure; R08 documents this domain. |
| Cyclotomic tower | n=0; p=2 first two levels | Root set `{1}` gives K; μ₂⊂ℚ₂ gives ℚ₂; adjoining μ₄ gives degree 2 | Correct; zero is not a root for prime p. |
| Character criterion | η=1; unramified η(Frob)=1+p; χ | Inertia images 1,1,infinite; `(dim H⁰,dim H¹)=(1,1),(1,1),(0,0)` | Pass; distinguishes full image from inertia image. |
| 1.5 de Rham DVR | t and p in B_dR⁺ | θ(t)=0, θ(p)=p≠0; t-adic orders 1 and 0 | Pass; p-adic completion after inverting p would be zero. |
| 1.5 de Rham field | 0,t,p | 0 has no inverse; inverses of t,p exist; `t·t⁻¹=p·p⁻¹=1` | Pass; native localization inverts generators of ker θ. |
| 1.5 graded pieces | degrees −1,0,1 | Characters χ⁻¹,1,χ; multiplication of degrees 1 and −1 has character 1 | Pass. |
| 2 general completed field | `Frac W(𝔽_p(s)^perf)`; identity map | Residue cardinality infinite, `v(p)=1`; completion map preserves 0,1 and p | Mathematics allowed; supplied general ramification still missing (R01). |
| 2 geometric reciprocity | additive graded unit group over F̄_p | x↦x^p−x has surjective point map, kernel 𝔽_p of size p; π₁ quotient=ℤ/p | Correctly uses π₁, not the point-group Artin map. |
| 2 twisted inverse | λ=1; λ=−1 at p=2; non-root λ=1+p | Constant kernel at λ=1; eigenline kernel for λ=−1 in degree-two normal basis; non-root case kernel=cokernel=0 | Pass; all p-power roots must be excluded. |
| 2 completed unramified descent | M=0,R′,R′/π² | Invariants 0,R,R/π²; base changes 0,R′,R′/π² | Pass; torsion length 2 is retained. |
| 2 unramified character descent | η(Frob)=1+p | Invariant generator a is a unit, `η(g)g(a)=a`; invariant rank=1, base-change rank=1 | Pass despite infinite character image. |
| 3 envelope generator | `A=ℤ₂[X]`, ξ=X, degrees 1,2,3 | Generators X,X²/2,X³/6; multiplying by 1!,2!,3! gives X,X²,X³ | Pass in intended domain; R06 excludes `A=ℤ[X]`, where degree 3 becomes 0. |
| 3 PD ideal / quotients | Fontaine ξ; p=2 | ξ²=2γ₂(ξ), hence ξ²=0 mod2; D/J₀=O_C, D/(J₀+2D)=O_C/2 | Pass; p cannot be put in ker θ. |
| 3 algebraic universal property | `ℤ_p[X]→ℤ_p`, X↦p, I=(p) | γ_n(X) maps to `pⁿ/n!`; n=1,2 give p,p²/2; base PD values identical | Pass including p=2; zero map fails at 1. |
| 3 completed universal property | same map to ℤ_p; A=ℚ_p with unit p | First map extends p-adically with same generator values; second completion is zero and any p-adically separated target receiving ℚ_p is zero | Pass on boundary cases; explicit binders repaired in scratch. |
| 3 generator change | ξ↦uξ, u a unit | γ_n(uξ)=uⁿγ_n(ξ); generated algebras and ideals coincide | Pass; canonical map fixes A. |
| 3 logarithmic period | ε↦ε^u, u∈ℤ_pˣ | log[ε^u]=u·t; θ(t)=0; factorial coefficient valuations tend to infinity also for p=2 | Pass; θ cannot extend after t is inverted. |
| 4.1 crystalline structures | t, constants a∈K₀ | φ(t)=pt; φ(a)=σ(a); g(t)=χ(g)t; φg(t)=gφ(t)=pχ(g)t | Pass; arithmetic Frobenius normalization retained. |
| 4.1 monodromy | u,u² | `N_pφ(u)=−p=pφN_p(u)`; `N_pφ(u²)=−2p²u=pφ(−2u)` | Pass at p=2,3; φ(u)=u would give −1 versus −p. |
| 4.1 monodromy kernel | f=a+bu+cu² in characteristic zero | N_p f=−b−2cu; zero iff b=c=0; kernel=B_cris | Pass; false in characteristic2, which is excluded. |
| 4.1 ramified normalization | e=2 | N(u)=−2 and Nφ(u)=−2p=pφN(u) | Pass; using uniformizer-normalized N does not change its kernel. |
| 4.1 logarithm branch / roots | branch shift c; ε-rescaling a | u-embedding shifts by c, root change by a·t; derivative remains −1 | Compatible; filtration embedding depends on branch. |
| 4.1 B_dR multiplication | `p^(−m)tᴺ` and `p^m t^(−N)` | Product=1 for every m, although the second tends to 0 and first lies in chosen V | Correct obstruction to global joint continuity; fixed-stage products still exist. |
| 4.1 crystalline/st polynomial stages | t^(−r)a, t^(−s)b; degrees d,e | Product lies in stage r+s, degree ≤d+e, coefficient bounds multiply | Consistent stage estimates; not an independent proof of the full inductive-limit theorem. |
| 4.1 functorial maps | identity; two compatible embeddings | 1↦1, t↦t under transported generator; compositions agree on Witt coefficients and u | Pass; unmarked generator rescaling must be transported. |
| 4.2 zero/direct-sum functors | V=0 and `ℚ_p⊕ℚ_p(1)` | D=0; ranks 2 with periods 1,t⁻¹; Frobenius diagonal 1,p⁻¹ | Pass. |
| 4.2 covariant/contravariant twist | V=ℚ_p(1) | Covariant generator t⁻¹, φ=p⁻¹σ, jump −1; dual generator t, φ=pσ, jump +1 | Pass; wrong dual convention reverses both values. |
| 4.2 tensor/dual maps | trivial lines and Tate line | `t⁻¹·t=1`; evaluation pairing=1; identity/zero maps give identity/zero on invariants | Pass; no tensor equivalence asserted for arbitrary V. |
| 4.2 monodromy invariants | V=ℚ_p; general invariant polynomial | `D_st=K₀`, N=0; coefficient derivative zero forces the constant part, giving D_cris | Pass in characteristic zero. |
| 4.3 fixed fields | ramified finite K; `K=Frac W(𝔽_p(s)^perf)` | First: crystalline constants K₀, de Rham constants K; second: both K₀=K | Pass; substituting ℚ_p for K₀ fails. |
| 4.3 regularity / admissibility | V=0 and V=ℚ_p(n) | Dimension equalities 0=0 and 1=1; comparison is identity on zero or multiplication by unit t^(−n) | Pass; rank-zero case is intentionally admissible. |
| 4.3 fundamental sequence kernel | 1 and a∈W(k)[1/p] with σ(a)≠a | 1 maps to 0 and is φ-fixed; a maps to 0 but is not in the φ=1 source | Pass; kernel is ℚ_p, not all K₀. |
| 4.3 filtered surjectivity | r=0,1 | At r=0 quotient=0, source=ℚ_p; at r=1 quotient=C_K(−1), supplied by U(−1)/ℚ_p | Agrees with Colmez–Fontaine; unions give the displayed target. |

### Pinned objects and ownership resolved

Opened at the pins (paths here are relative to the corresponding library repository):

- `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451`, `spectralNorm_eq_of_equiv`; `Mathlib/NumberTheory/Padics/Complex.lean:78,244`, `PadicAlgCl.spectralNorm_eq` and `PadicComplex.isAlgClosed`.
- `Mathlib/RingTheory/Perfectoid/BDeRham.lean:62,75,88`: `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham`. These are an adic completion and a localization; they do not themselves assert the new DVR, fixed-field or topology results.
- `Mathlib/FieldTheory/LinearDisjoint.lean:744`, `IntermediateField.LinearDisjoint.trace_algebraMap`, with finite-dimensional, linear-disjointness and compositum hypotheses. The README must supply those hypotheses through its finite-stage descent, which it explicitly targets.
- `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:83,96`, `Ring.inverse` and `Ring.inverse_non_unit`: the definition is inverse on units, zero otherwise. This is the R06 witness.
- `TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean:251,350`, `explicitInfl1_injective` and `explicitInfRes_exact`; the latter compares range and kernel of additive maps on explicit continuous H¹. This is existing theory; §0.2 describes its application, not a new competing cohomology carrier.
- `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean:89,100,140,223` and `ZHat/Ring.lean:69,146`, as in R04. `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:33` supplies `localCyclotomicCharacter`.
- `TauCeti/RingTheory/LocalRing/RamificationGroup.lean:677–685`: the native real lower filtration uses the ceiling, so it is constant on `(i−1,i]`. It assumes a local ring with a group action; it does not supply a valued-field upper filtration, Herbrand theorem or Hasse–Arf.
- `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:145,215`: finite restriction and continuity, distinguished from R02's missing unit-filtration theorem.

The two citation-resolver leads concerning `Tower.limOne_exact` and `Tower.limOne_subsingleton_of_isMittagLeffler` are **not findings**. They are promised by DerivedModuleAlgebra, not claimed as pinned library declarations: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1489,1507` and `Suggested.lean:407,478` state them. Its §0.DP.3 at README 239 supplies the augmentation API; §1.1 at 1573 supplies derived limits. PerfectoidTowers P9.0 contains all three named targets (README 1857,1874,1896 after removing the display header); the canonical comparison explicitly allows a topological module with jointly continuous action, despite its “compact coefficients” title. EtaleCohomologyFoundations §F.4.0, README 850 and stable-lattice paragraph 874, supplies the compact-group lattice needed here. PerfectoidSpaces P1.6, P1.10–11, P1.16–18, P1.31, P3.7 and P3.12 contain the named tilt, field, kernel, cyclotomic and almost-extension material.

Ownership was searched by objects using `roadmaps grep`, the readable main/completed roadmaps, the supplied sibling checkouts and the board packages, not just by declaration names. The period foundation has no main roadmap of the same name. The readable consumer contracts explicitly import it: ArithmeticGaloisDuality §R02.2.3a (README 1513); DerivedDeRhamCohomology §PD.7 (2763, with the principal-envelope specialization at 2903); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–P5 and R07.3.0; NoncommutativeAndEquivariantIwasawa §F.6 (3734); SelmerIwasawaCohomology's supplier subsection (119). These resolve the relocation and distinguish the ordinary principal envelope here from general/derived envelopes and the downstream continuous-section/realization packages. No competing fully qualified retained declaration was found. These are consumer citations, not permission to import a later roadmap. The board package index offered no additional owner of the missing general ramification contract. No dependency was inferred from an unprovided open review revision.

### Gate and dependency result

The worker's gate passed the targeted build and every text/shape scanner it ran except dependency checking. The repeated gate likewise reports `depcheck=2`, all other reported counters zero. There are no outside-folder changes and the worktree remained clean. The explicit movable dependency check returned:

```text
not movable: PadicPeriodRings consumes ProfiniteArithmetic (#324) and is consumed by CohomologyComparisonsPartII (#196), which comes first: moving PadicPeriodRings after ProfiniteArithmetic would put a supplier after a consumer, a cycle through PadicPeriodRings
UPWARD: PadicPeriodRings (#19) -> ClassFieldTheory (#258) at README lines [114, 255]
UPWARD: PadicPeriodRings (#19) -> ProfiniteArithmetic (#324) at README lines [28, 49]
depcheck: 164 roadmaps, 1171 edges, 2 problem(s)
```

R03–R04 report both failures and the evidence for the main/completed false positives. I did not infer a second mathematical cycle from the proposed move. There are no declared supplier gaps to accept conditionally. R01–R02 require ownership repair independently of these mechanical failures.

## Not verifiable

- Ax (1970), *Zeros of polynomials over local fields — the Galois action*: the sources service resolved only paywalled publisher material. The article's internal proof/locator was not certified; the fixed-field statements were checked in Fontaine–Ouyang and Brinon–Conrad.
- Tate (1967), *p-divisible groups*, §3.3, Theorems 1–2, pp.176–177: publisher-only resolution; uncertified. The general-domain conclusions were independently checked in the open Brinon–Conrad text.
- Neukirch–Schmidt–Wingberg (2008), (1.6.7): publisher-only resolution; uncertified. Rubin and the pinned topological-cochain theorem were read instead; no assertion is made about the inaccessible numbering.
- Serre, *Local Fields* (1979), III §3 Proposition 7 and XV §2 Theorem 2/Corollary 3: publisher-only resolution; uncertified. The trace formula was recomputed and compared with open sources, but the book locators were not certified.

The 11 other works were legally retrieved through the sources service; no access request or pause is needed for the four uncertified works. I did not copy source texts into the PR or report. No mathematical proof of the new inductive-limit topological-ring assertions was machine-checked; the source sample, stage calculations and B_dR counterexample above specify the evidence actually obtained.

## Source issues

- **Misprint** in fontaine-ouyang at Proposition 4.46 proof, printed p.106: the source says the positive trace sum is a primitive in degree one; it should be the negative trace sum for its usual differential; affects the proof.
- **Gap** in fontaine-ouyang at Proposition 4.46 proof, printed p.106: the source says finite-quotient vanishing passes to continuous completed-coefficient cohomology by a limit; it should justify controlled approximation and convergence of primitives; affects the proof.
- **Error** in fontaine-ouyang at Proposition 4.46 proof, printed p.106: the source says the cyclotomic ℤ_p-subextension makes the twisted fixed coefficient equal to its completed field with descended cyclotomic action; it should retain the full cyclotomic extension or first absorb finite torsion; affects the proof.
- **Misprint** in brinon-conrad at Lemma 3.2.6 proof, printed p.36: the source says the quotient module is M modulo itself denoted M-double-prime; it should be M modulo M-prime; affects nothing.
- **Error** in brinon-conrad at Lemma 13.1.6 proof, printed p.201: the source says geometric reciprocity is a surjective canonical map from the unit point group; it should use the fundamental group of the proalgebraic unit group and its filtration; affects the proof.
- **Error** in brinon-conrad at Lemma 13.1.8, printed p.203: the source says the different integral formula applies to arbitrary finite M/L using Gal(M/L); it should assume M/L Galois for that formula; affects a stated result.
- **Error** in brinon-conrad at Lemma 14.1.4 proof, printed p.238, and Proposition 14.1.7 proof, printed p.241: the source says trace valuation is at least input valuation plus different valuation without rounding; it should retain the discrete-value rounding loss, as `Tr_(ℚ₂(√2)/ℚ₂)(1)=2` demonstrates; affects the proof.
- **Misprint** in brinon-conrad at Lemma 14.1.4 proof, printed p.238: the source says the final different-error term has factor p^m; it should have factor p^(−m); affects the proof.
- **Misprint** in brinon-conrad at Theorem 14.3.4 proof, printed p.254: the source says untwisted H¹ vanishes before computing it; it should say it is one-dimensional over K; affects nothing.
- **Gap** in brinon-conrad at Proposition 14.3.2 proof, printed p.253, footnote 8: the source says the higher-degree descent argument is unfinished; it should complete that argument; affects the proof.
