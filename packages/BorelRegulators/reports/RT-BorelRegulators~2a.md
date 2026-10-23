<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6376268244 -->
Red team round 2 pass a (codex) of 5436aa1

Verdict: needs_changes

1. **F01** (P2) The analytic leading-term headline is statable at the pins

   **Location:** packages/BorelRegulators/Suggested.lean:12–13: “require its global continuation and analytic germ”; packages/BorelRegulators/README.md:211, §1.3.

   **Claim:** The exact order, nonzero real leading coefficient and zeta proportionality cannot be acceptance-tested until a new continuation/germ carrier exists.

   **Witness:** Mathlib/Analysis/Analytic/Basic.lean:110 and :120 define analyticity; Mathlib/Analysis/Analytic/Order.lean:48 defines analyticOrderAt; Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:55 defines iteratedDeriv. A function agreeing with the named Dedekind series on Re(s)>1 specifies its unique analytic continuation off 1.

   **Exact repair text:** Delete the Layer 1 “not statable” bullet. Add before Layer 3 the following native statement, and name it in README §1.3. The continuation hypotheses are precisely the regularity/agreement provided by LFunctions Layer 3; they assume neither the zero order nor its leading coefficient. This tests §1.3 without re-owning the construction of that supplier's continuation. No definition or new carrier is necessary.

   ```lean
   /-! ## Layer 1: Tate coordinates, trace and leading coefficients -/

   /-- Every analytic continuation of the native Dedekind series off its pole
   has the exact higher-weight zero order and nonzero real leading coefficient
   of README §1.3. See Borel 1977, §1.4 and §6.4. -/
   theorem dedekindZeta_continuation_leadingTerm
       (F : Type u) [Field F] [NumberField F]
       (Z : ℂ → ℂ)
       (hZ : ∀ z : ℂ, z ≠ 1 → AnalyticAt ℂ Z z)
       (hseries : ∀ z : ℂ, 1 < z.re → Z z = NumberField.dedekindZeta F z)
       (n : ℕ) (hn : 2 ≤ n) :
       let d := if n % 2 = 0 then NumberField.InfinitePlace.nrComplexPlaces F
         else NumberField.InfinitePlace.nrRealPlaces F +
           NumberField.InfinitePlace.nrComplexPlaces F
       let z₀ : ℂ := 1 - (n : ℂ)
       let c : ℂ := iteratedDeriv d Z z₀ / (Nat.factorial d : ℂ)
       analyticOrderAt Z z₀ = (d : ℕ∞) ∧ c.im = 0 ∧ c ≠ 0 ∧
         Filter.Tendsto (fun z : ℂ => Z z / (z - z₀) ^ d)
           (nhdsWithin z₀ ({z₀}ᶜ)) (nhds c) ∧
         ∃ q : ℚ, q ≠ 0 ∧
           c = (q : ℂ) * (Real.sqrt |(NumberField.discr F : ℝ)| : ℂ) *
             (Real.pi : ℂ) ^
               ((d : ℤ) - (Module.finrank ℚ F : ℤ) * (n : ℤ)) *
             NumberField.dedekindZeta F (n : ℂ) := by
     sorry
   ```

   **Repair test:** For F=ℚ and its usual continuation, n=2,3,4 give (d,c,q)=(0,−1/12,−1/2), (1,−ζ(3)/(4π²),−1/4), (0,1/120,3/4). The punctured limits have those same values. The zero function and twice the continuation fail hseries already at 2: 0 or π²/3 is not π²/6. Thus this is tied to the actual zeta function, not an arbitrary-function stand-in or a hypothesis containing the conclusion. Analyticity at z₀ follows from n≥2, preventing analyticOrderAt's nonanalytic junk value. The displayed signature was checked against the pinned definitions by reading; it was not elaborated, in accordance with the read-only review restriction.

2. **F02** (P2) The structure-gap needs sentence still includes degree one

   **Location:** packages/BorelRegulators/README.md:93 and packages/BorelRegulators/design/plan.json:1815: “Supply absolute almost simplicity and simple connectedness of the existing SL₁(D) carrier.”

   **Claim:** This standalone needs sentence is a precise supplier contract on the existing norm-one carrier.

   **Witness:** TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3340–3352 constructs the carrier for every finite-dimensional central division algebra and explicitly tests D=F. Then SL₁(F)=1, of dimension 0, which is not absolutely almost simple.

   **Exact repair text:** Replace the needs sentence in both locations by: “For every number field F and finite-dimensional central division F-algebra D of degree a≥2, prove that the existing AdelicAlgebraicGroups §3.4 group SL₁(D) is absolutely almost simple and simply connected.” Keep the detailed extension and its existing owner.

   **Repair test:** D=F has a=1 and is excluded; quaternion division algebras have a=2, dim SL₁(D)=3 and geometric group SL₂; degree-three division algebras give dimension 8 and geometric group SL₃. This moves the already-correct restriction from the detail into the sentence consumed by intake. It does not assert that §3.4's mathematical target currently includes degree one.

## Verification of the round-one findings

Locations below are in packages/BorelRegulators/README.md unless another repository-relative path is given. The two F01 entries are distinguished by pass. Each quoted repaired passage is under 40 words. This audit checks the current text, rather than accepting the repair report as evidence.

| Earlier finding | Status and repaired passage | Witness and recomputation |
|---|---|---|
| a/F01, duplicate Tamagawa contract | Repaired, :99: “§6.2 supplies τ(S)=1 for every simply connected semisimple group over a number field, including inner forms”. | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1958 states this theorem; :1975 names the same gauge supplier. For SL₁ of division degree 2 or 3, dimension is 3 or 8 and the supplied mass is 1. The obsolete gap is absent from README and plan. |
| b/F01, rational versus twisted character | Repaired, :25: “The twisted character is chₙᵗʷ=(2πi)^n·chₙ, valued in ℚ(n)”; :129 requests rational pairing 1. | CharacteristicClasses C6 items 2–3 define the rational character and ch(u)=−v. At n=2,3 the rational pairings of u² and −u³ are 1,1; twisted pairings are −4π²,−8π³i. Both contracts and §§2.1,4.3,5.2,6.2 agree. burgos2002 line 1426 and line 3670 support the twist. |
| b/F02, unspecified finite-stage contract | Repaired, :77: “the actual invariant-form maps H^q(Lie G,K;ℝ)→H^q(Γ;ℝ) for q∈ℕ”. | The sentence now quantifies F,N,a,K,Γ, names the maps, and gives strict bijectivity range and naturality. At (N,q,a)=(1,5,22),(2,3,26), the inequalities are 21>20 and 25>24. At a=21,25 respectively there is equality and no promised conclusion. borel1977 line 459–461 gives the sufficient comparison range. |
| b/F03, unrestricted local degrees | Repaired, :115: “finite set S of finite places and set R of real places (R empty when a is odd)”. | At a=8,S={2}, the quotient of (ℤ/32ℤ)ˣ by {1,31} is cyclic order 8; 2 has local degree 8, while 31 has degree 1. For subgroup {1,15}, 3 has quotient order 8 and 31 is outside the subgroup, so the fixed field is imaginary. poonen2017 line 1435–1444 permits variable local extensions. |
| b/F04, homotopy conversion at weight one | Repaired, :608: “For n≥2, transport the free compact-dual homotopy lattice”. | :620 now records π₁SU=π₁(SU/SO)=0 versus dim V₁(ℚ)=1. At n=3,5, the two quotient/Cartan indices are (1,2),(2,1); the covolumes remain 4π,2π. |
| b/F05, omitted pinned Needs | Repaired, :377 adds “Mathlib `NumberField.prod_abs_eq_one`”; :604 lists all five total-reality/discriminant/zeta inputs. | Mathlib/NumberTheory/NumberField/ProductFormula.lean:98 requires c≠0 and uses complex multiplicity 2. Scaling c=2 over ℚ gives 2·1/2=1; at a complex place the multiplier is 4. TotallyRealComplex.lean:47,52, Discriminant/Defs.lean:36,41 and DedekindZeta.lean:49 match the other citations. |
| b/F06, arbitrary invariant realization locator | Repaired, :338: “(poonen2017, Theorem 1.5.36(i) and (iv), p.26, poonen2017 line 1402–1446, with §3.1)”. | Poonen's exact sequence realizes (1/3,−1/3); period=index gives 3 and dimension 9. Borel's particular existence family remains cited only for existence. |
| b/F07, consumer citation drift | Partly repaired; package-local part repaired, :785: “§5.1 and `exists_pos_rat_dedekindZeta_of_isTotallyReal` (totally real even weight)”. External portion remains settled, not re-raised. | TauCetiRoadmap/Polylogarithms/README.md:99,111,704 still points to §7.1; :105 still assigns injectivity to Layers 3–5. Its supplied head is read-only. The repair report correctly identifies the external edit needed. At ℚ(√2), n=2, √8ζ_F(2)/π⁴=1/24, agreeing with the corrected local contract. |

The head also quantifies gap:multiplicative-serre-comparison and records the downstream borel-period-contract in the allowed gaps list. The dependency check returns `depcheck: 28 roadmaps, 245 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line occurs. The earlier external ownership/placement issue remains settled under MERGE-ORDER in packages/BorelRegulators/reports/FIX-PKG-BorelRegulators~2.md; this report does not count it as a new package defect.

## Verified sound

Read all 803 README lines and all 80 Suggested.lean lines, the repository README and CONTRIBUTING rules, both earlier reviews, and the repair report. Counts: **3 declarations, 26 numbered mathematical targets, 117 Check bullets, 12 declared gaps, 22 distinct cross-roadmap names**. The README uses numbered headings rather than bold target names; all 26 are included below. The bold summary and five bold consumer bullets were also checked. Source coverage and citation-resolution limits are recorded separately below.

The three current acceptance theorems have mathematical content beyond one tactic or a pinned library theorem. There is no padding to delete. All three elaborated signatures supplied for this head were compared with their README statements: **0 dropped binders, 0 changed hypotheses**. No Lean command was run. The two Tau Ceti imports exist at the specified pin and provide the native Brauer law and index/splitting API. There is one Mathlib import, no admitted data, no local stand-in definitions, no `set_option`, no `lemma`, and no forbidden evaluation or axiom commands. All three Lean names occur in the README.

The headline inventory is: the analytic leading-term theorem (§1.3); the actual Chern regulator and real isomorphism (§§2.1–2.3); period=index and division-algebra existence (§§3.1–3.2); the gauge-normalized arithmetic volume (§§3.4–3.6); compact/arithmetic primitive periods and fibre cancellation (§§4.3–4.6); the primitive determinant, homotopy conversion, integral lattice, zeta covolume and S-integer/order transport (§§5.1–5.5); and the geometric point identification, independent factor-two comparison and Adams weight (§§6.1–6.3). The three native statements cover §§3.1,3.2 and the rank-zero consequence of §5.1. S01 identifies the other currently statable headline. The remaining missing carriers are individually named in the module docstring; native scalar lattices, singular cohomology or a point quotient alone do not supply the specified regulator or geometric realization.

### Declaration and context ledger

Every row is in namespace `TauCetiRoadmap.BorelRegulators`; universe `u` is the only standing declaration. There are no section variables or `include` blocks. Paths in this table are relative to packages/BorelRegulators.

| Declaration; section and own context | Instances and computed sides | Result; change |
|---|---|---|
| Suggested.lean:46, period_eq_index; §3.1; F : Type u, Field F, NumberField F, A : CSA.{u,u} F | F=ℚ, A=ℚ or M₂(ℚ): orderOf(1)=1=index, although dimensions are 1 and 4. Indefinite quaternion class: order=2=index, dimension 4. Invariants 1/3,−1/3: order=3=index, dimension 9. | Matches the README and native positive-size matrix equivalence. CSA includes centrality, simplicity, finite dimension and nontriviality; no zero-algebra counterexample. No change. |
| Suggested.lean:55, exists_divisionAlgebra_split_at_infinity; §3.2; F, Field, NumberField, a : ℕ, 1≤a; existential D : Type u, DivisionRing, Algebra F D, IsCentral, FiniteDimensional | a=1: D=F, finrank=1=1² and every scalar extension M₁. a=2: invariants 1/2 at 2,3 over ℚ, dimension 4=2², real splitting M₂(ℝ). a=3: ±1/3, dimension 9=3². a=0 would require 1≤0 and dimension 0. | Each real/complex embedding supplies its own Algebra instance. Real embeddings may be empty for imaginary fields, but the complex clauses remain. Finite-dimensional algebras have models in F's universe. No change. |
| Suggested.lean:72, exists_pos_rat_dedekindZeta_of_isTotallyReal; §5.1; F, Field, NumberField, IsTotallyReal; n : ℕ, 2≤n, Even n | ℚ,n=2: √1·ζ(2)=π²/6=(1/6)π². ℚ,n=4: π⁴/90=(1/90)π⁴. ℚ(√5),n=2: √5ζ_F(2)=(2/75)π⁴. ℚ(√2),n=2: √8ζ_F(2)=(1/24)π⁴. | Coercions put both sides in ℂ; the rational coefficient is positive, not required to be integral. n=0,1 and imaginary quadratic fields are excluded. No change. |

### Target, definition and convention ledger

Here N=[F:ℚ], d=dₙ, Δ=abs(discriminant), and a “class” is a positive rational proportionality class, not an exact scalar. The ambient contexts are number fields, n≥2 unless explicitly noted, and the actual maps described in the cited section. The values in the Check ledger further test each interface law, including identity and base-change laws.

| Statement and README line | Instances tried; values on the two sides | Result; change |
|---|---|---|
| Conventions :19–27, Tate signs, phase, gauge, empty determinant | n=2 conjugate pair (1,−1), n=3 pair (1,1); (2πi)²=−4π² divided by itself gives 1. i·i²=−i=i³. det of the empty matrix=1=covolume of 0 in 0. For ℚ(i),h=3: 4^(−3/2)·2³=1. | Opposite parity, untwisted coordinates, zero empty determinant and unnormalized complex measure are distinguished. No change. |
| 1.1 :167, Vₙ,Cₙ, coordinate equivalence, topology and Haar measure; n≥1 | ℚ: d₂=0, d₃=1. ℚ(i): d₂=d₃=1 despite two embeddings. Real weight-three generator has ambient norm 4π², coordinate norm 1; weight-two imaginary generator has norms 2π and 1. | Subspace and transported topologies agree; an isometry is not asserted. Conjugating a selected representative gives determinant −1 at n=2 and +1 at n=3; both have absolute determinant 1. No change. |
| 1.2 :191, R,T and towers | ℚ(i)/ℚ,n=3: R(3)=(3,3), TR(3)=6=2·3. n=2: T(3,−3)=0. For a tower of degrees 2 and 3, TR(t)=6t by either sum. Identity extension gives R(t)=T(t)=t. | Full-embedding sum is required; selected-coordinate averaging gives t instead of 2t. No change. |
| 1.3 :211, exact zero order, leading coefficient, punctured limit | ℚ,n=2: d=0,c=−1/12, comparison=1/6, ratio=−1/2. n=3: d=1,c=−ζ(3)/(4π²), comparison=ζ(3)/π², ratio=−1/4. n=4: c=1/120, comparison=1/90, ratio=3/4. | Analytic value 0 at −2 is not the leading coefficient. n=1 would give order 1 instead of 0 over ℚ and is excluded. Mathematical statement holds; add native acceptance theorem, S01. |
| 2.1 :242, normalized continuous class; b≥2n+1 | n=2, ε₂=u²: rational pairing 1 and twisted pairing −4π². n=3, ε₃=−u³: rational pairing 1 and twisted pairing −8π³i. Twice the class has pairings 2 and −16π³i in weight 3. | Calibration excludes zero and doubled classes; positive-degree character of an identity block is 0. No change. |
| 2.2 :262, regulator on actual integral/rational Quillen groups | Torsion element of order m>0: mr(x)=r(mx)=0, hence r(x)=0. Nonzero ℚ K₅-class: direct evaluation t equals transported evaluation t; doubled inverse gives 2t≠t. Imaginary pair: (t,−t) at n=2 and (t,t) at n=3. | Actual localization equivalence fixes the inverse. No change. |
| 2.3 :282, real isomorphism, torsion kernel, restriction/transfer | Source/target dimensions: ℚ n=2 gives 0=0, n=3 gives 1=1; imaginary quadratic gives 1=1; real quadratic n=3 gives 2=2. ℚ(i)/ℚ in odd weight: both trace composites multiply by 2. | Finite generation and finite-type Hurewicz are supplied on arithmetic objects, not discrete GL(ℂ). The explicit finite-stage gap has strict range; boundary tests below. No change. |
| 3.1 :315, period=index=lcm and matrix representatives | Empty support: lcm=1=period=index. Invariants (1/2,1/2) sum to 0 mod1 and give 2=2, dimension4. (1/3,−1/3) gives 3=3, dimension9; singleton1/3 sums nonzero and is unrealizable. M₂(D) has the same index as D but twice its degree. | Matrix size a/d is positive because d≥1 divides a≥1. Includes real invariants1/2 and finite residue characteristics2,3. No change. |
| 3.2 :338, division algebra for every positive degree, all infinity split | a=1: dimension1; a=2,3,8: dimensions4,9,64 from denominator lcm2,3,8. Hamilton quaternions have dimension4 but real invariant1/2, whereas required real invariant is0. | Arbitrary zero-sum families with zero infinite invariants are supported by Poonen's exact sequence, not just Borel's chosen two-place family. No change. |
| 3.3 :359, discriminant-normalized gauge and scaling | ℚ, ω→2ω: infinite ratio2, finite ratio1/2, product1. ℚ(i),h=3: Δ^(−h/2)=1/8, complex factor8, product1. h=0,ω=2: masses2 and1/2, product1; zero form would give0. | Nonzero form required. Chart determinant uses normalized complex abs². No change. |
| 3.4 :381, norm-one Tamagawa mass | Quaternion degree2 gives h=3 and τ=1; degree3 gives h=8 and τ=1. Scaling by2 over ℚ gives τ multiplier2·1/2=1. Norm-one quadratic torus has dimension1 and character rank1, versus h=3 and character rank0 here. | Target has a≥2 and uses the earlier general Tamagawa theorem. S02 concerns the intake sentence, not this correctly restricted target. |
| 3.5 :400, finite factors, c_S, full Euler product | SL₂(𝔽₂): 6/8=3/4=1−2^−2. SL₃(𝔽₂):168/256=21/32=(1−2^−2)(1−2^−3). Exceptional mass b gives correction4b/3; ω=2ω_std gives b=3/8 and correction1/2. | q≥2 and j≥2 make denominators positive and Euler products convergent. Enlarging S adds ratio1; finite-index m changes mass by1/m. No change. |
| 3.6 :422, compact arithmetic volume and exact product | For m_f(U)=b, vol∞=1/b. Index3 refinement gives masses b/3 and3/b, whose product is1. Over ℚ(√5),a=2, unscaled volume / Borel volume=5^(3/2). Split M₂(ℚ) gives a noncompact quotient, excluded by division. | Infinite splitting and a≥2 imply noncompact infinite group for strong approximation; anisotropy over F gives quotient compactness. No change. |
| 4.1 :453, cohomological quotient adapters and determinant lines | Λ(x₃,x₅): dimH⁸=1, dimQ⁸=0. Λ(x₃): dimQ³=1, Q⁶=0. k[u₂]: dimQ²=1, Q⁴=0 despite u²≠0. A=k: Q=0, ∧⁰Q=k, generator1. | Quotient and top exterior power distinguish whole cohomology and an arbitrary complement. The generic quotient remains with CharacteristicClasses. No change. |
| 4.2 :474, actual invariant-form comparison jℝ=i^qμ | q=0:1→1. q=1,2: correction i,−1, product−i=i³. q=3,5:−i,i respectively. At a C₂ stabilizer with 𝔽₂ coefficients H^q has dimension1 for every q, while a point has dimension0 for q>0. | Characteristic-zero and torsion-free descent avoid the last mismatch. Compatibility is on actual cochains. No change. |
| 4.3 :496, compact period determinant; n≥2,a≥n | ℚ,n=2: classπ², calibrated absolute period4π², ratio4. ℚ,n=3: classπ³. ℚ(i),n=2: π⁴·4^(−3/2)=π⁴/8. | Rational basis changes have rational nonzero determinant; each scalar is nonzero. No change. |
| 4.4 :515, compact cycles and lower ideal | j=1,N=1: dimension3, restriction factor2. j=2,N=1: dimension8, factor9, periodclassζ(2)ζ(3). j=1,N=2: dimension6, factor4. j=1,a=17: 4-dimensional regular block plus I₁₃, determinant Nrd²=1. | An algebra embedding in dimension17 would require4∣17; group padding is valid. Wedge x₃∧x₃=0 kills the specified lower ideal. Corrects source proof slips. No change. |
| 4.5 :537, full arithmetic primitive determinant | Consecutive cumulative periods1,ζ_F(2),ζ_F(2)ζ_F(3) give quotientsζ_F(2),ζ_F(3). ℚ,n=2 has full primitive rank1 and compact-dual rank0; period remainsζ(2) on the full line. | Positive ζ_F(j) for j≥2 permits division. Larger odd stage restriction supplies arbitrary stages in the stated range. No change. |
| 4.6 :556, exact primitive sequences and common fibre | Ranks(base,full,fibre): ℚ n=2=(0,1,1); ℚ n=3=(1,1,0); ℚ(i) either parity=(1,2,1). [[1,2],[0,1]] has determinant1. Fibre multiplication2 would change determinant to2, while promised fibre map is identity. | Stable odd a avoids exceptional Euler primitives. Filtered comparison is explicitly a declared supplier gap. No change. |
| 5.1 :587, primitive determinant and phase parity | ℚ,n=2: det=1, zeta expression=1/6, ratio6. ℚ,n=3: expressionζ(3)/π³, E=2, phase−1. ℚ(i),n=2,3: E=0, expressions2ζ_F(2)/π⁴,2ζ_F(3)/π⁶. ℚ(√5),n=2: E=−4, phase1, expression2/75. | E=(n−1)r₁ for odd n and −nr₁ for even n is always even. Rank zero has empty determinant1, not a missing nonvanishing argument. No change. |
| 5.2 :608, homotopy-to-Tate lattice; n≥2 | ℚ n=2: (2π)^0·1=1. n=3: (2π)·2=4π; quotient/Cartan indices1,2. n=5: (2π)·1=2π; indices2,1. Imaginary quadratic:2π in both parities. | At n=1 the homotopy group is0 but target dimension1, so no full lattice; restriction repaired. Cartan ggᵗ is representative-independent. No change. |
| 5.3 :630, actual integral image and covolume | d=0: image0, determinant1,covolume1. Rank1 image tℤ: abs(det)=abs(t)=covolume; subimage2tℤ has index2 and covolume2abs(t). ℤ+√2ℤ has rank2 but ambient real dimension1 and accumulation at0. | Real isomorphism plus finite generation gives discreteness; neither abstract finite generation nor rational image tℚ suffices. No change. |
| 5.4 :652, zeta covolume and every rational basis | ℚ,n=2:1=(−12)(−1/12)=6(1/6). ℚ,n=3: final classζ(3)/π² versus rawζ(3)/π³. ℚ(i): classes2ζ_F(2)/π³ and2ζ_F(3)/π⁵. Column swap has det−1 and absolute determinant1. | Rational basis scaling2 multiplies absolute determinant2; integral covolume uses an integral basis. Leading coefficient multiplier may be negative; positive-integer comparison multiplier is positive. No change. |
| 5.5 :674, finite-S equality and order commensurability | S=∅ gives image equality and ratio1. ℤ→ℤ[1/2] in degrees3,5 retains odd integral image; in degree1 unit ranks change0→1. Common sublattice indices2,3 give larger/smaller covolume ratio3/2 in the indicated ordering. | Finite fields have K_even=0 for positive even degree, giving odd localization surjectivity; torsion does not affect real image. Nonmaximal-order finiteness is a declared gap. No change. |
| 6.1 :713, point quotient and projection; n>0 | n=2: P₁(1)=0,P₁(i)=i,P₁(1+i)=i. n=3: P₂(1)=1,P₂(i)=0,P₂(1+i)=1. Differences1 and i lie in ℝ(2) and ℝ(3). n=0 truncated n−1 gives P₀(1)=1 despite1∈ℝ(0). | Positive weight excludes junk; quotient image of ℤ(n)=0, whereas ℤ(n−1) survives with coordinate1. Embedding conjugation retains d=0,1 over ℚ at n=2,3. No change. |
| 6.2 :736, Bo=2Be, ordered determinants and actual images | d=0:1=2⁰·1. d=1: t=2(t/2), ratio2. d=2: det(tI₂)=t²=4(t/2)². A zero Be gives0 rather than t≠0. | Independent universal calibration prevents defining Be as Bo/2. Absolute covolume ratio is2^d on images of the same integral free quotient. No change. |
| 6.3 :757, Adams weight; a≥1 | ℚ,n=3,a=2: scalar8,det8. Real quadratic: diag(8,8),det64=2^(3·2). ℚ,n=2: zero-dimensional determinant1=2^0. a=1:scalar1,det1. | Actual regular-scheme Adams operations, affine comparison and real regulator injectivity give the rational K assertion. a=0 is not asserted. No change. |

### Complete Check ledger

Each line below refers to packages/BorelRegulators/README.md. All 117 bullets were tested. Each row gives computed values, not just a pass label. Negative controls that violate a stated hypothesis are retained as negative controls; none requires a new change. The definition sections have at least three such discriminating Checks.

| Check line | Computation | Result; change |
|---|---|---|
| 31 | n=2 pair (1,−1); n=3 pair (1,1); real n=2 coordinate0; (−4π²)/(−4π²)=1. | Consistent; none. |
| 32 | i·(−1)=−i=i³; i⁵=i; ℚ,n=3 gives i²=−1∈ℚˣ. | Consistent; none. |
| 33 | covol(tℤ)=∣t∣; covol(2tℤ)=2∣t∣; empty lattice=empty determinant=1. | Consistent; none. |
| 34 | 2·(1/2)=1; complex scaling ∣2∣²=4; 4^(−3/2)·2³=1. | Consistent; none. |
| 181 | ℚ: n=2 has t=−t⇒t=0,d=0; n=3 has t=t,d=1. | Consistent; none. |
| 182 | ℚ(i): n=2 pair (1,−1), n=3 pair(1,1); both have one free coordinate. | Consistent; none. |
| 183 | Weight-three generator −4π² has divided coordinate1, not −4π². | Consistent; none. |
| 184 | Totally real/even: zero space and zero lattice; point Haar mass1. | Consistent; none. |
| 185 | Weight-two norms2π and1; weight-three norms4π² and1; scalar rescaling preserves topology. | Consistent; none. |
| 203 | T(1,−1)=0; selected-coordinate sum alone=1, so fails. | Consistent; none. |
| 204 | R(1)=(1,1); T(1,1)=2=2·1; average gives1≠2. | Consistent; none. |
| 205 | Real quadratic T(2,3)=5, R(2)=(2,2); identity T(2)=2. | Consistent; none. |
| 223 | (−1/12)/(1/6)=−1/2, with d=0. | Consistent; none. |
| 224 | ζ(−2)=0 but c=ζ′(−2)=−ζ(3)/(4π²)≠0; d=1. | Consistent; none. |
| 225 | (1/120)/(1/90)=3/4, with d=0. | Consistent; none. |
| 226 | At n=1 overℚ actual order0 versus proposed odd formula1. | Consistent; none. |
| 254 | ch(u²) coefficient=1; twisted value(2πi)²=−4π²; divided value1. | Consistent; none. |
| 255 | ch(−u³) coefficient=1; twisted value−8π³i; replacing ch₃ by c₃ gives−16π³i. | Consistent; none. |
| 256 | Identity-block character contribution0; calibrated value stays1; zero/doubled give0/2. | Consistent; none. |
| 274 | r(0)=0; mr(x)=0 with m>0 in real vector space implies r(x)=0. | Consistent; none. |
| 275 | Nonzero K₅ class: localization evaluation t=direct t; doubled inverse2t≠t. | Consistent; none. |
| 276 | Imaginary pair n=2:(t,−t), n=3:(t,t); matches conjugation in both cases. | Consistent; none. |
| 294 | ℚ dimensions(source,target): n=2:(0,0), n=3:(1,1). | Consistent; none. |
| 295 | ℚ(i) n=2,3:(1,1); real quadratic n=3:(2,2). | Consistent; none. |
| 296 | Odd-weight transfer/restriction gives2t on both sides; even imaginary trace t−t=0. | Consistent; none. |
| 297 | N=1,q=5,a=22:21>20; a=21:20=20, not in strict range. | Consistent; none. |
| 298 | N=2,q=3,a=26:25>24; a=25:24=24, not in strict range. | Consistent; none. |
| 299 | q=0,a=2:1>0; constant1 maps1, whereas zero map gives0. | Consistent; none. |
| 326 | Empty lcm1; F dimension1; M_a(F) dimensiona² and index1; a=0 has no positive matrix size. | Consistent; none. |
| 327 | 1/2+1/2=0 mod1; lcm2=index2; dimension4. | Consistent; none. |
| 328 | 1/3−1/3=0; lcm3=index3; dimension9. Singleton1/3 has nonzero sum. | Consistent; none. |
| 329 | Degree8 means dimension64; unramified dyadic prescription is not the variable-local contract. | Consistent; none. |
| 330 | a=1,S=R=∅:L=F,degree1; odd cyclic group has no element of order2. | Consistent; none. |
| 331 | Units mod32/{1,31}: 16/2=8; class3 has order8; Frobenius31 is identity; local degrees at2,31 are8,1. | Consistent; none. |
| 332 | Units mod32/{1,15}:16/2=8; class3 has order8;31 is outside subgroup; local degree at2=8 and real places become complex. | Consistent; none. |
| 350 | a=1:D=F,dim1=1²,scalar extensionM₁; a=0 would give dim0 against nontriviality. | Consistent; none. |
| 351 | Invariants1/2 at2,3,0 at∞:degree2,dim4,splitM₂(ℝ). | Consistent; none. |
| 352 | Invariants1/3,−1/3:degree3,dim9,infinite invariants0. | Consistent; none. |
| 353 | Hamilton dimension4 but invariant∞=1/2≠0, hence nonsplit at∞. | Consistent; none. |
| 372 | ω→2ω overℚ:infinite ratio2,2-adic ratio1/2,global ratio1 independently of h. | Consistent; none. |
| 373 | ℚ(i),h=3:4^(−3/2)=1/8;2³=8;product1. | Consistent; none. |
| 374 | h=0,ω=1:mass1;ω=2:infinite2,finite1/2,total1. | Consistent; none. |
| 375 | ω=0 gives measure0 and volume0, outside every positive rational zeta-product class. | Consistent; none. |
| 391 | (−1,3) has local symbols−1 at2,3,+1 at∞;degree2,h=3,τ=1. | Consistent; none. |
| 392 | Degree3 gives h=9−1=8;τ=1, not3. | Consistent; none. |
| 393 | Scaling multipliers2,1/2 have product1; both masses1. | Consistent; none. |
| 394 | Quadratic norm-one torus dim1,character rank1; quaternion norm-one group dim3,character rank0. | Consistent; none. |
| 412 | #SL₂(𝔽₂)=6;6/2³=3/4=1−1/4. | Consistent; none. |
| 413 | #SL₃(𝔽₂)=168;168/256=21/32=(3/4)(7/8). | Consistent; none. |
| 414 | Exceptional mass b divided by3/4 is4b/3, not1 for general b. | Consistent; none. |
| 415 | ω=2ω_std at2:mass(1/2)(3/4)=3/8; correction(3/8)/(3/4)=1/2. | Consistent; none. |
| 416 | q=1 gives1−1=0 and totalized inverse0; finite residue-field q≥2 gives positive factor. | Consistent; none. |
| 434 | Index3:finite massb/3,infinite volume3/b;product1=(b)(1/b). | Consistent; none. |
| 435 | Hamilton infinite norm-one group is compact; noncompactness premise of chosen strong-approximation route fails. | Consistent; none. |
| 436 | SL₂(ℝ)/SL₂(ℤ) has a cusp and is noncompact; M₂(ℚ) contains nontrivial zero divisors, so is not division. | Consistent; none. |
| 437 | ℚ(√5),a=2:h=3;unscaled/Borel volume ratio5^(3/2). | Consistent; none. |
| 465 | Λ(x₃,x₅):H⁸=k·x₃x₅ dimension1;Q⁸=0 dimension0. | Consistent; none. |
| 466 | Λ(x₃):Q³ dimension1; x₃²=0, henceQ⁶=0. | Consistent; none. |
| 467 | A=k:A₊=0,Q=0;∧⁰Q=k,empty generator1. | Consistent; none. |
| 468 | k[u₂]:Q² dimension1;u₂²≠0 but its class inQ⁴=0. | Consistent; none. |
| 487 | q=0:i⁰=1;jℝ(1)=1;zero map gives0. | Consistent; none. |
| 488 | Degree1 and2 scalars i,−1; product−i=i³. | Consistent; none. |
| 489 | i⁵=i≠−i=i³; constant correction−i fails in degree5. | Consistent; none. |
| 490 | C₂ with𝔽₂:dimH^q=1 for every q≥0;point dimensions1 atq=0,0 atq>0. | Consistent; none. |
| 507 | ℚ,n=2:compact classπ²;absolute calibrated value4π², ratio4. | Consistent; none. |
| 508 | ℚ,n=3:compact classπ³; exponent3≠2. | Consistent; none. |
| 509 | ℚ(i),n=2:Δ^−3/2=1/8;compact classπ⁴/8≠0. | Consistent; none. |
| 527 | j=1,N=1:dimension1·(1+2)=3;factor2¹=2;periodclassζ(2). | Consistent; none. |
| 528 | j=2,N=1:dimension4+4=8;factor3²=9;[ζ(2)ζ(3)]/ζ(2)=ζ(3). | Consistent; none. |
| 529 | j=1,N=2:dimension2·3=6;factor2²=4≠2. | Consistent; none. |
| 530 | j=1,N=1,a=17:b=4,a−b=13;detL_g=Nrd²=1;4 does not divide17. | Consistent; none. |
| 531 | η₁=x₃ givesx₃∧x₃=0; x₃∧x₅≠0 has no repeated generator. | Consistent; none. |
| 548 | j=0 cumulative product1;j=1 productζ_F(2);quotientζ_F(2)/1=ζ_F(2). | Consistent; none. |
| 549 | ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3), denominatorζ_F(2)>0. | Consistent; none. |
| 550 | ℚ,n=2:base rank0,full rank1;full periodζ(2)≠0. | Consistent; none. |
| 568 | ℚ,n=2:ranks0,1,1;cancelling common fibre leaves∧⁰ identity1. | Consistent; none. |
| 569 | ℚ,n=3:ranks1,1,0;fibre determinant1. | Consistent; none. |
| 570 | ℚ(i):ranks1,2,1 for both parities, so full and base ranks differ. | Consistent; none. |
| 571 | Triangular matrix diagonal1,1 has det1;fibre scaling2 instead has det2. | Consistent; none. |
| 599 | ℚ,n=2:empty determinant1;comparison scalarζ(2)/π²=1/6;ratio6. | Consistent; none. |
| 600 | ℚ,n=3:E=2,phase−1;rawζ(3)/π³,converted classζ(3)/π². | Consistent; none. |
| 601 | ℚ(i):E=0 for n=2,3;classes2ζ_F(2)/π⁴,2ζ_F(3)/π⁶. | Consistent; none. |
| 602 | ℚ(√5),n=2:E=−4,phase1;√5ζ_F(2)/π⁴=2/75;reciprocal75/2. | Consistent; none. |
| 620 | ℚ,n=1:π₁SU=π₁(SU/SO)=0;d₁=1;image0 cannot spanℝ. | Consistent; none. |
| 621 | ℚ,n=2:d=0,ε=1;factor(2π)^0·1=1. | Consistent; none. |
| 622 | ℚ,n=3:indices1,2;composite2;d=1,ε=2;covolume4π. | Consistent; none. |
| 623 | ℚ,n=5:indices2,1;composite2;covolume2π;C(SO)=I;given g,h giveggᵗ=(gh)(gh)ᵗ=−I. | Consistent; none. |
| 624 | Imaginary quadratic:d=1,r₁=0,ε=1;factor2π for n=2,3. | Consistent; none. |
| 643 | ℚ,n=2:free group0,image0;empty determinant=covolume=1. | Consistent; none. |
| 644 | Image tℤ:covolume∣t∣;2tℤ:index2,covolume2∣t∣;Be image(t/2)ℤ:covolume∣t∣/2. | Consistent; none. |
| 645 | ℤ+√2ℤ spansℝ but(3−2√2)^k∈ℤ+√2ℤ is nonzero and tends0;source rank2≠target dimension1. | Consistent; none. |
| 646 | t/m∈tℚ is nonzero and tends0; for m>1 generally t/m∉tℤ. | Consistent; none. |
| 665 | 1=(−12)(−1/12)=6(1/6);signed rational factor−12 and positive factor6 differ. | Consistent; none. |
| 666 | ℚ,n=3:d−Nn=1−3=−2;raw exponent−3,converted−2. | Consistent; none. |
| 667 | ℚ(i):√Δ=2,d=1;n=2 exponent−3;n=3 exponent−5. | Consistent; none. |
| 668 | Column transposition det−1:absolute multiplier1;column scaling2:absolute multiplier2. | Consistent; none. |
| 685 | S=∅:identity K-map,image unchanged,covolume ratio1. | Consistent; none. |
| 686 | Including a place over2:odd rational ranks unchanged, d₂=r₂ andd₃=r₁+r₂;no exceptional deletion. | Consistent; none. |
| 687 | K₁ℤ unit rank0;K₁ℤ[1/2] unit rank1 via powers2;degree1 is outside n≥2. | Consistent; none. |
| 688 | If common L₀ has indices2 inL₁ and3 inL₂, covol(L₁)=c/2,covol(L₂)=c/3;ratio3/2. | Consistent; none. |
| 700 | ℚ,n=2:(−1/12)/(−1/2)=1/6;6·1/6=1. | Consistent; none. |
| 701 | ℚ,n=4:(1/120)/(3/4)=1/90;90·1/90=1. | Consistent; none. |
| 702 | r₂=0,n=2k:d=0,exponent−2kN;N=2 gives−4k;positive factors have nonzero product. | Consistent; none. |
| 703 | ℚ(i),even n:d=r₂=1,so determinant size1 rather than0. | Consistent; none. |
| 726 | n=2:P₁(1)=0,P₁(i)=i≠0 moduloℝ(2). | Consistent; none. |
| 727 | n=3:P₂(1)=1,P₂(i)=0;imaginary projection would give0,i. | Consistent; none. |
| 728 | n=2:P(1+i)=i,difference1∈ℝ(2);n=3:P(1+i)=1,differencei∈ℝ(3). | Consistent; none. |
| 729 | n=1:P₀(1+i)=1;n=0 natural subtraction also givesP₀ butP₀(1)=1≠0 for1∈ℝ(0). | Consistent; none. |
| 730 | ℚ:n=2 conjugation-fixed quotient dimension0;n=3 dimension1;embeddings-only invariants would wrongly give1 atn=2. | Consistent; none. |
| 748 | d=0:both determinants1 and2⁰=1. | Consistent; none. |
| 749 | d=1:detBo/detBe=2 forℚ,n=3 and imaginary quadratic n=2,3. | Consistent; none. |
| 750 | Real quadratic,n=3:d=2;ratio2²=4≠2. | Consistent; none. |
| 751 | Nonzero rank-one regulator t compared with zero Be:2·0=0≠t. | Consistent; none. |
| 768 | ℚ,n=3,a=2:scalar2³=8,rank1 determinant8. | Consistent; none. |
| 769 | Real quadratic,n=3,a=2:diag(8,8),det64=2⁶. | Consistent; none. |
| 770 | ℚ,n=2,a=2:rank0,det1=2^0≠4. | Consistent; none. |
| 771 | a=1:scalar1^n=1,det1^(nd)=1;no assertion at0. | Consistent; none. |

### Supplier, ownership and dependency audit

Checked **22 of the 23 named cross-roadmap contracts/consumer references** against current readable text; PeriodsAndSpecialValues is the exception below. This count is by roadmap name, not by repeated citations. The 18 supplier rows are resolved as follows. Sections cited without a declaration name were read as mathematical contracts; missing future implementations were not classified as missing citations.

| Supplier and exact section(s) | Resolved input and hypothesis check |
|---|---|
| GeneralAlgebraicKTheory §§2.5,3.2,3.12,7.7–7.8 | Actual Q-construction groups, functorial maps, plus/Q comparison, and restriction-of-scalars transfer under finite projective resolution. Arbitrary maps of singular orders are not silently assigned transfer. |
| StableHomotopyKTheory §§2.3–2.5,3.37,4.14 | Strict/homotopy-fibre comparison, homotopy LES, rational primitive Hurewicz for path-connected finite-type rational H-spaces, and the stable GL plus H-space. Degree-zero/one LES distinctions do not affect the repaired n≥2 conversion. |
| ArithmeticKTheory §§3.2–3.4 at its supplied head | Finite generation for number rings/finite S; actual rational localization; odd-degree ≥3 integral surjectivity; rational comparison for full orders; stable rank and cohomology inputs. Finite-stage range and integral finiteness for singular orders remain explicit gaps. |
| ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9, ALS.5b.1 | CE cochains, invariant forms, quotient/symmetric-space carriers, arithmetic discreteness, finite-stabilizer/neat comparisons and de Rham. The coefficient system here is finite-dimensional and trivial; semisimple SL has no extra split-central Lie factor. |
| AutomorphicFormsOnReductiveGroups §§1.1–1.3 | Smooth/continuous group cochains and van Est with the full maximal compact and finite-dimensional coefficients. The connected SL factors used here satisfy the stated group conditions. |
| AdelicAlgebraicGroups §§1.2,1.4,2.2–2.5,3.4,4.2 | Restricted products, scalar restriction, quotient integration, gauge normalization, standard finite-field SL masses, the existing SL₁(D), anisotropic compactness and simply connected strong approximation. Arbitrary ramified compact-open rational masses and general inner-type-A structure remain declared extensions; see S02. |
| EndoscopicTransferAndUnitaryTraceComparison §6.2 | General simply connected semisimple Tamagawa number 1, explicitly including inner forms and the same adelic gauge normalization. It precedes BorelRegulators in ORDER. |
| RepresentationTheory/SemisimpleAlgebras Layer 6 | Division factors and splitting fields. The all-finite-splitting-degree divisibility extension is not the native index-degree existence theorem. |
| ClassFieldTheory Layers 5,10 | README:980–985 gives the local invariant with arithmetic Frobenius and degree-multiplying restriction. README:1570–1573 retains real invariants; :1598–1608 gives the finite-support zero-sum exact sequence. The existing field-Brauer/H² dictionary is imported from Tau Ceti. |
| ArithmeticGaloisDuality §§R02.4.5b–R02.4.6 | Prescribed-character Grunwald–Wang with its dyadic exception. The variable-local-extension corollary is correctly distinguished by its gap. |
| LFunctions Layer 3 | Continued Dedekind function, regularity off 1, agreement with the convergent series, uniqueness, and completed functional equation. It supplies S01's continuation hypotheses without supplying S01's higher-negative-integer conclusion. |
| IntegralIwasawaTheory §6.0 | Siegel–Klingen rationality includes the trivial character over totally real fields. Used for the comparison example, not as a substitute for the general period proof. |
| CharacteristicClasses C5a.2–C5a.5, C6 items 2–3 | Existing invariant-polynomial indecomposables, compact primitive/transgression constructions, multiplicative Serre sequence, rational Chern character and ordered suspension. The generic graded extension, calibrated integral pairing and invariant-form filtration comparison are explicit gaps. |
| TopologicalKTheory T4,T7 item 1 | Ordered complex Bott generator and real coefficient maps c(a)=2u²,c(b)=u⁴; these yield the distinct degree-five and degree-nine indices, not a uniform factor 2 on the Cartan map. |
| DifferentialGeometry Layers 5–6,8 | Integration/Stokes and multiplicative de Rham on finite-dimensional Hausdorff σ-compact manifolds. The compact cycles and arithmetic manifolds here satisfy these conditions. |
| SchemeKTheoryOperations §6.8 | Higher Adams operations for regular Noetherian finite-dimensional schemes with ample family, and affine comparison to actual Quillen groups. Fields and number rings qualify; arbitrary singular orders are not used for Adams. |
| AlgebraicTopology Stage 5 item 5 | Bundle Serre filtration, monodromy and Leray–Hirsch applications; no unconditional collapse is imported. The additional multiplicative/invariant-form comparison is separately contracted. |
| MotivicEtaleKTheory, universal-realization layer | Available design Final targets 2,3,5,6 fixes the independent realization ownership. Its unavailable exact point/CE/Weil implementation is explicitly requested by the two gaps, rather than claimed implemented. |

The four readable consumer references are Polylogarithms §§2.3,3.7–3.8,4.4 (the supplied head retains the settled §7.1 drift), ColemanIntegration §L3.Fc.1 (Beilinson rather than Borel normalization), HeightsRationalPointsAndObstructions §3.6 (period/index application), and HabiroNahmSeries §1.5 (embedding regulator through Polylogarithms). Their stronger polylogarithmic, syntomic, descent or Nahm assertions are not premises here. PeriodsAndSpecialValues PS.3.2a is not counted as verified in this round.

Ownership searches used the roadmap service by object as well as local searches of main, Completed, the board packages and all **27 supplied sibling checkouts**. The search covered regulators and their lattices, period/index and division representatives, norm-one groups and Tamagawa mass, Chern calibration, cohomological indecomposables, analytic continuation and cyclic local degrees. K3BlochGroups owns the Bloch/Suslin objects, ArithmeticKTheory owns ranks and localization, Polylogarithms owns explicit analytic regulator comparisons, and the adelic/Chern/realization suppliers own their generic carriers. The package constructs the Borel-normalized maps and period comparisons on those carriers. No competing fully qualified name was found for its three declarations. The external overlap already recorded under MERGE-ORDER in the earlier package repair remains settled; it is not counted as a new ownership finding.

All **12** gap slugs occur in plan.json and the README, with named suppliers; none has supplier `none`. Eleven are upstream requests and borel-period-contract is the downstream export to Polylogarithms, not a self-dependency. The removed classical-tamagawa-proof gap is absent. The following computations test the contracts rather than pretending their implementations exist.

| Gap | Boundary/minimality witness | Result |
|---|---|---|
| stable-finite-range | (N,q,a)=(1,5,22):21>20; (2,3,26):25>24; q=0,a=2:1>0 and 1↦1. Stable supplier has no explicit finite-stage contract of this form. | Precise extension, present in both locations. |
| integral-chern-calibration | n=2,3 rational evaluations1,1; twisted evaluations−4π²,−8π³i. Rational Chern character alone does not provide this integral Hurewicz calibration. | Precise extension, not duplicate Chern construction. |
| cyclic-local-degrees | a=1 gives L=F; a=8 cyclotomic quotients have specified local degree8 at2 and degree1 at31 outside S. An odd-degree cyclic extension has no complex conjugation element of order2. | Variable-local, finite-S extension; no unrestricted Wang assertion. |
| inner-type-a-structure | Existing D=F has SL₁(D)=1,dim0; degree2 gives geometric SL₂,dim3. | S02. |
| adelic-rational-masses | Standard SL₂ mass3/4 at2; scaling gauge2 gives3/8; open index2 divides each by2. Smooth model mass alone does not cover an arbitrary ramified model. | Named extension; nonzero gauge and local field conventions come from §2.4 and the detailed contract. |
| order-finite-generation | The full order ℤ[2i]⊂ℤ[i] has index2 and is not a Dedekind ring; abstract equality after ⊗ℚ alone permits a nondiscrete rational image. | Integral extension beyond supplier's rational-order comparison. |
| universal-deligne | Point quotient at n=2 retains i and kills1; at n=3 retains1 and kills i. Its normalization must be fixed before testing Bo=2Be. | Independent universal realization request; no circular definition. |
| infinitesimal-classifying-comparison | Cone projection on 1+i gives i at weight2 and1 at weight3; replacing the projection by its complement reverses these values. | Specific comparison beyond the realization's existence. |
| graded-indecomposable-api | k[u₂]:Q² dimension1,Q⁴ dimension0, while H⁴ dimension1. Existing C5a.2 is invariant-polynomial-specific. | Generic extension and local cohomological adapter have separate ownership. |
| multiplicative-serre-comparison | ℚ,n=2,a=15:14>12, ranks0,1,1; identity fibre determinant1, doubled fibre determinant2. | Explicit filtration/edge/identity contract; no assumption of desired zeta determinant. |
| splitting-degree-index | Division degree d and splitting degree e give d²k=de; d=2,e=4 gives4k=8 and k=2. e=3 would require k=3/2 and is impossible. Argument uses no separability. | Native index-degree existence does not already state this universal divisibility. |
| borel-period-contract | Rank-zero ℚ,n=2 gives det1 and coefficient1/6; positive-rank ℚ,n=3 retains one coordinate and factor-two normalization. | Downstream contract correctly names §§2.3,5.3–5.4,5.1,3.4 in this package; external drift remains settled. |

The declared extensions were accepted as contracts, not reported merely because their supplier does not yet implement them. Future library results remain conditional on those contracts. The internal proof direction is 1→2, 3→4→5, with 1–2 and 5 feeding 6; §§2.3 and 4.6 take their finite-stage/filtered comparisons from the named gaps rather than deriving them from the zeta conclusion. No target uses the later Polylogarithms conclusions to prove its own regulator theorem.

The required dependency command exited 0. Its complete output was:

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only diff against origin/main listed **8 changed files, all within packages/BorelRegulators**. No computational algorithm target or new process narrative was found in README.md or Suggested.lean. No package source, manifest, merge-order file, Git state or external application was changed during this review.

### Pinned definitions and broader adversarial controls

Read the cited definitions rather than inferring their hypotheses from names. Mathlib's CSA bundles finite-dimensional central simple algebras; Tau Ceti's splitting predicate permits a zero matrix size for arbitrary algebras, but the present CSA and division instances are nontrivial. The native degree is Nat.sqrt(finrank); central simplicity supplies the square identity. Native `IsZLattice` requires a discrete subtype topology separately from its spanning field. The native Dedekind zeta is a convergent-series definition, while Tau Ceti's existing analytic remainder is only on Re(s)>1−1/N. These distinctions agree with the README; they do not prevent S01's uniquely characterized continuation statement.

The cardinal computation also resolves to Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:127, `Matrix.card_SL_field`, with finite-field and nonzero matrix-size hypotheses; AdelicAlgebraicGroups §2.4 explicitly supplies its normalized product form. Matrix size0 cannot be inserted into that formula, and q=1 cannot be a field cardinality. The period/index theorem is not the pinned `index_dvd_deg`, which only compares an algebra's index and its own degree. The Tau Ceti Brauer/H² equivalence at Algebra/CrossedProduct/Comparison.lean:267 prevents a duplicated comparison construction.

| Wider input class / total-function trap | Computed witness and why it does or does not enter |
|---|---|
| Zero ring, square-zero thickening, characteristic2 or3, field versus DVR | A number field has characteristic0 and dimension N≥1. The zero ring has1=0; 𝔽₂ and𝔽₃ have2=0 or3=0; ℚ[ε]/ε² has nonzero ε with ε²=0. None is a number-field instance. Finite residue fields of characteristics2 and3 are retained in §3.5, with SL₂ masses3/4 and8/9. |
| Nonmaximal orders / non-smooth integral models | ℤ[2i] has conductor containing2 and index2 inℤ[i]; it is admitted by §5.5 only with the declared integral extension. Bad local group models are admitted by the rational-mass gap, not by the smooth-reduction formula. |
| Inseparable extensions | Number-field extensions are separable. The generic splitting-divisibility gap deliberately allows inseparability and the dimension calculation d²k=de does not divide by a separability degree. |
| Nonabelian group controls | SL₂(𝔽₂)≃S₃ has order6, giving mass6/8. Quaternion algebra units contain Q₈, but its Brauer class has order2 rather than8; the statements concern the abelian Brauer group, not the order of the unit group. |
| Empty index set / rank0 / unit ideal | Empty local invariant support has lcm1; empty Euler product1; zero-dimensional exterior determinant1. S=∅ localization is identity. The unit ideal is not a finite prime and is never a place in the Euler product. |
| Infinite sets or noncompact quotients | Only finite S is used in localization and prescribed local degrees. The split SL₂ arithmetic quotient is noncompact, so the compact-cycle argument uses a division algebra. Norm-one groups split at infinity are noncompact there, which is a required strong-approximation premise. |
| Natural subtraction, zero denominators, out-of-range degrees | n≥2 gives2n−1≥3; a>4N(j+1)² givesa−(j+1)²≥0. Tate projection explicitly assumes n>0. Every cancelled ζ_F(j),j≥2 is positive; q_v≥2 makes1−q_v^−j>0; Δ>0 andπ>0. Stable primitive degrees requirea≥n and the stronger displayed range. |
| Universe and arbitrary-data controls | Finite-dimensional algebras are isomorphic to models carried by finite products of F, so same-universe CSA loses no isomorphism class. Bo is fixed by suspended Chern evaluation, Be by independent realization, α/β/j by actual cochains, and each integral lattice by an actual image. Zero or doubled maps fail the listed calibrations. |

### Source locator audit

Inspected **47 distinct source locator units** in **5 readable works**, counting a numbered result or a section once, including adjacent supporting results used to check a cited proof. The 26 target locator groups are accounted for: 25 have readable supporting text; §3.4's primary Weil locator is waived and its invocation in Borel was checked. Two manifest works remain settled as waived/uncertified. No new missing-reference request is needed.

| Source; units inspected | Locators checked against the supplied text |
|---|---|
| borel1974; 3 | Theorem 7.5, p.259 (line 934); §11.4,p.267 (line 1246); Proposition 12.2,p.271 (line 1377). These are stable comparison/rank inputs, not a normalization of the present regulator. |
| borel1977; 19 | §§1.3–1.6,p.616–617 (lines122–163); Lemma 2.2,§2.3,Proposition 2.4,p.617–619 (lines177–236); §§3.3–3.5,p.620–622 (lines289–337); Proposition 4.3,p.623–625 (lines369–402); §§5.2–5.3,Proposition 5.4,Theorem 5.5,p.626–630 (lines440–551); §6.1,Theorem 6.2,Remark 6.3,§6.4,p.631–633 (lines567–615). Inspected scan images for discriminant powers, complex phases and the regular-representation step. |
| burgos2002; 23 | Remark 4.25,p.32 (line 1423); Propositions8.9,8.10,8.14 and Theorems8.12,8.15 (lines2865,2882,2967,2928,2974); Corollary9.8,Theorem 9.9,Definition 9.10,Theorem 9.12 (lines3140,3189,3222,3256); Lemma 9.18,Definition 9.19,Remark 9.20,Propositions9.21–9.22,Corollary9.23,Definition 9.24 (lines3546,3577,3607,3628,3681,3689,3733); Examples10.4–10.5,Remark 10.6,Definitions10.7–10.8,Theorem 10.9 (lines3973,3982,3991,4087,4091,4139), including the comparison proof through line 4242. |
| poonen2017; 1 | Theorem 1.5.36,p.26, including parts(i),(iii),(iv) and the proof (lines1396–1446). The zero-sum sequence realizes arbitrary invariant families; the cyclic extension proof permits local extensions to vary. |
| deligne_goncharov2005; 1 | Published §1.6,pp.7–9, equations(1.6.1)–(1.6.10), lines282–428, and the Adams consequence, lines429–440. Used published numbering, not the differently numbered preprint. |

The earlier alleged factorial misprint in burgos2002 Remark 4.25 is **not confirmed**: the scanned printed p.32 puts (p−1)! in the denominator, agreeing with the next suspension formula. The extraction loses fraction layout. It is therefore excluded from the source-issues register below. The Borel source slips listed below were checked in scan images and were not copied into the current mathematical targets.

## Not verifiable

- The proof text of weil1961 §3.3, Theorem 3.3.1 remains waived. Borel's invocation and the current EndoscopicTransferAndUnitaryTraceComparison §6.2 contract were inspected; that is not a new certification of Weil's proof.
- beilinson1985 §§1–2 remains uncertified/paywalled. The factor-two claim was instead checked in the available Burgos proof, without claiming to have read Beilinson's original text.
- PeriodsAndSpecialValues PS.3.2a could not be opened in this round: the roadmap service returned no document, and the previously recorded board object 9f14c68 was unavailable in this checkout. This is a downstream reference and the external ownership decision was already settled. No missing-supplier finding is inferred from this access failure.
- The future constructions requested by the declared gaps are contracts, not existing proofs. This review verifies their ownership, scope and computed controls; it does not certify the still-unwritten implementations.
- No Lean elaboration/build was run under the read-only prohibition. The three supplied elaborated signatures were read and compared. S01's proposed native signature was checked against pinned declaration types and mathematical instances, but requires the repair worker's permitted elaboration.
- Ownership was checked against the readable main/Completed content, board packages, service results and all supplied sibling heads. No independent search for unprovided open-pull-request files was made; ownership against such unavailable heads is not certified.

## Source issues

- **Misprint** in borel1977 at Theorem 5.5 proof, printed pp.629–630 (borel1977 line 518 and line 532): the source says the restricted-scalar cycle and its top form have dimension j²+2j; it should be [k:ℚ](j²+2j); affects the proof.
- **Misprint** in borel1977 at Theorem 5.5 proof, equation(8), printed p.629 (borel1977 line 510–512): the source says the discriminant factor has exponent j+1/2; it should be −(j+1/2), consistently with §1.5; affects the proof.
- **Error** in borel1977 at Theorem 5.5 proof, printed p.630 (borel1977 line 549): the source says the wedge of j primitive generators restricts with scalar j+1; it should be (j+1)^j, since each generator contributes j+1; affects the proof.
- **Gap** in borel1977 at Theorem 5.5 proof, printed p.630 (borel1977 line 525–526): the source says the regular representation embeds D into matrices of the chosen arbitrary odd size; it should be the regular algebra representation in dimension(j+1)² followed by an identity-padded group representation; affects the proof.
- **Misprint** in borel1977 at Proposition 2.4 proof, printed pp.618–619 (borel1977 line 216–223): the source says the rational-point group is H(F), although the number field is k; it should be H(k); affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5436aa1e06361f20051d99bfa8ae634941373b94", "job": "RT-BorelRegulators~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
