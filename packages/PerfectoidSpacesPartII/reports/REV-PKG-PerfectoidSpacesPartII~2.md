# Review of PerfectoidSpacesPartII (package, round 2)

**Verdict:** needs changes

Thirteen findings: two P1, five P2 and six P3. The scope is a legitimate extension of PerfectoidSpaces and is repairable. The package is not ready to port. The README, Suggested.lean, metadata and author-recorded source entries were left unchanged.

## Previous findings, checked first

The identifiers below are those of `packages/PerfectoidSpacesPartII/reports/REV-PKG-PerfectoidSpacesPartII.md`, checked against the repair report and the actual files.

| Previous finding | Repaired passage | Status and independent check |
| --- | --- | --- |
| F01, missing quantitative headline | README:607–624 names `bhatt_riemann_extension_ker_almostZero` and `bhatt_quantitative_riemann_extension`; “with `c = pᵏm`” | **Partly repaired.** Both mathematical signatures are present at Suggested.lean:110,158. The restriction direction and explicit constant agree with BHATT18 line 355 and line 409. They fail elaboration at these pins: R01. |
| F02, namespace of comparison map | README:226: `TauCeti.ValuationSpectrum.pairHomOfRationalSubsetSubset` | **Repaired.** All four README occurrences use this namespace. Opened the pinned declaration at `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219`. |
| F03, inverse versus direct perfection | README:1088: “`PerfectClosure K p`, the direct limit along Frobenius” | **Repaired.** On F_p(T), inverse perfection is F_p, whereas direct perfect closure contains T^(1/p). `Mathlib/RingTheory/Perfection.lean:39` and `Mathlib/FieldTheory/PerfectClosure.lean:68` have the stated directions. |
| F04, order of extension-tower indices | README:365–368: “choose `n′ ≥ n` … `M′` … then `n″ ≥ n′` … `M″`” | **Repaired.** The first annihilation puts the element in M′ at n′, where the second applies. The final exponent is 2/p^(k+1) ≤ 1/p^k for p ≥ 2. |
| F05, root-algebra idempotents | README:1271–1274: “one for each subset” and “one for each clopen subset” | **Repaired at that passage.** At level i over Q_p there are i+1 factors and 2^(i+1) idempotents. A nonzero difference of idempotents has spectral norm 1, so completion adds no new idempotents. The same branch-selection mistake remains elsewhere: R03–R04. |
| F06, source manifest target ids | sources.toml uses `"0"`, `"1.1"`, …, `"5.12"` in `cited_for` | **Repaired.** All five source entries use actual README ids; no `RA.` entry remains. The old consumer-side `RA.` citations are not newly dropped package ids. |

None of the previous findings was marked “not actionable in this package”. This review does not silently inherit uncomputed “sound” claims from round 1.

## R01 (P2) — The acceptance file fails elaboration at the pins

**Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:137`, :194, :197, :203 and :402; applications include `(hden n)` and the completion in `kummer_almost_faithfullyFlat`.

**Claim.** The five headline signatures elaborate under default options.

**Witness.** `lake env lean` exits 1: four Set/Finset denominator-proof mismatches, followed by a typeclass-search timeout for the completion's module structure at line 402. `HasDenominatorPower` takes a Set; `completedPlusSubring` takes a Finset.

**Exact repair, tested.** In both Bhatt signatures, annotate each two-element numerator collection as `({algebraMap K R (t 0) ^ …, g 0} : Finset R)`, including the collection passed to `HasDenominatorPower`; use its coercion wherever a Set is expected. This avoids asking the elaborator to identify a Set literal with a coerced Finset through an unexposed definition. Relevant pinned declarations are `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311` and `Plus.lean:117`.

After the existing `letI` for the stage module in the last theorem, supply its completion module explicitly:

```lean
    letI : Module (kummerIntegralStage p k n g ⊤ 0)
        (AdicCompletion (Ideal.span {(p : kummerIntegralStage p k n g ⊤ 0)})
          (kummerIntegralStage p k n g ⊤ ⊤)) :=
      AdicCompletion.instModuleOfIsScalarTower
        (I := Ideal.span {(p : kummerIntegralStage p k n g ⊤ 0)})
        (M := kummerIntegralStage p k n g ⊤ ⊤)
```

The instance is defined at `Mathlib/RingTheory/AdicCompletion/Basic.lean:324`. With exactly these changes, a scratch copy elaborated with exit 0 and only the five `sorry` warnings; no option override was used. Apply this together with R02, then rerun on the actual acceptance file.

## R02 (P2) — Native perfectoid and almost APIs are duplicated or declared absent

**Location.** `packages/PerfectoidSpacesPartII/README.md:79`: “No perfectoid, almost or uniform Banach notion is in either library”; :90–93, §3.0; `Suggested.lean:80`, :348, and module docstring :48–54.

**Claim.** A local copy of the perfectoid predicate is needed; almost categories and a finite-projective trace are unavailable at the pins.

**Witness.** `TauCeti/RingTheory/Perfectoid/Basic.lean:86` defines the identical perfectoid class. `TauCeti/RingTheory/Almost/Module.lean:75` defines the almost-module category. `TauCeti/LinearAlgebra/Trace/Projective.lean:72` defines `LinearMap.projectiveTrace` for finite projective modules.

**Exact repair, tested by comparing definitions.** Import the individual native perfectoid module, use `TauCeti.Perfectoid.IsPerfectoidTateRing`, and delete the local class and the duplicate §3.0 target/API. Move the supplier information to Scope and Exact supplier contracts. The native class has precisely the same boundedness and pseudouniformizer/Frobenius fields, with the same complete Hausdorff Tate-ring binders. Its uniformity and reducedness API already exists at lines 102 and 108.

Replace the local `IsAlmostZero` definition with `Module.IsTorsionBySet V N (m : Set V)` in the remaining simple definitions: `Mathlib/Algebra/Module/Torsion/Basic.lean:214` says exactly that every element of the set annihilates every module element. With a basic setup, `TauCeti.Almost.BasicSetup.IsAlmostZero` and its elementwise equivalence already exist at `TauCeti/RingTheory/Almost/BasicSetup.lean:252,261`. Update the own-name references accordingly. The values for m = 0, m = V are respectively “all modules” and “only the zero module”, for both definitions.

Correct the docstring's missing-carrier reasons and supplier contracts: the almost-module category and finite-projective trace exist. Almost-algebra/finite-étale structure and the particular completed geometric carriers may still be unavailable; name those actual obstacles. Do not remove deep headlines merely because these foundations are now supplied. For the trace, on a rank-one projective summand eR of R = k × k, the native trace of the identity is e = (1,0), whereas the finite-free-only fallback need not supply that trace. This is exactly the generality the README claimed was missing.

## R03 (P1) — Freely adjoining an existing root system is not the identity

**Location.** `packages/PerfectoidSpacesPartII/README.md:1155–1156`: “the root algebra `A⟨T^{1/p^∞}⟩` is `A` again.”

**Claim.** For A = K⟨T^(1/p^∞)⟩, freely adjoining another root system of T gives A as an A-algebra.

**Witness.** Take K = C₂. The new S_k may map to T^(1/2^k) or ζ_(2^k)T^(1/2^k). These give distinct A-algebra maps: S₁ maps to U or −U, with U ≠ −U.

**Exact repair, tested.** Replace the identity assertion by the evaluation retraction onto the chosen existing root system, and state that the free root algebra retains the other branches. If an identity example is wanted, restrict that example to characteristic p, where uniformization kills the nilpotents of S^(p^i) − U^(p^i) and Frobenius is injective. For the mixed-characteristic negative control, specializing T and its chosen roots to 1 at level 1 gives C₂[S]/(S²−1) = C₂ × C₂, with four idempotents, rather than C₂. ANDRE18A line 1331 defines the free tensor-product construction, not a selected branch. The general theorem must keep all primes and both characteristics.

## R04 (P1) — The dimension-zero Kummer tower need not be a field, and S need not equal its integral ring

**Location.** `packages/PerfectoidSpacesPartII/README.md:2200`: “a perfectoid field”; :2279–2281, :2335, :2375–2377, :2420–2423 and :2507–2510 repeat consequences. At :2375: “For `n = 0` and `g = p`, `S = Â°_∞∞`”.

**Claim.** The free normalized tower for n = 0, g = p is the field obtained by choosing compatible roots, with one residue field k; hence its lower-shriek-shriek model equals its integral ring.

**Witness.** Set p = 2, k = F₂, j = 3, l = 1. In K₃ = Q₂(ζ₈), u = ζ₈ + ζ₈⁻¹ satisfies u² = 2. Thus K₃[X]/(X²−2) = K₃ × K₃.

**Exact repair, tested.** Replace all listed field/valuation-ring descriptions by descriptions of the full free-root algebra and its integral closure; retain its two branches as a negative-control Check. The element e = (1 + X/u)/2 is a nontrivial idempotent, integral over Z₂ since e²−e = 0. It and 1−e have spectral norm 1. The isometric stage maps preserve them in the completed tower. Consequently that completion is not a field and its integral ring is not a valuation domain.

Also replace the equality Check for S by a strict-inclusion Check on this same instance. Choose two compatible evaluations into C₂ with X sent to u and −u, fixing K∞, and reduce the integral images to its residue field. They send e to (1,0). Every element of
`S = K∞° + K∞°°·Â°_∞∞`
has diagonal residue (a,a), because the second summand reduces to zero on both branches. Therefore e belongs to Â°_∞∞ but not to S. The correct general assertions remain the displayed formula for S, its faithful flatness and its almost isomorphism to Â°_∞∞. Do not repair this by excluding p = 2 or choosing a field branch. ANDRE18B line 327 explicitly uses the polynomial quotient retaining all roots.

## R05 (P2) — The envelope's integral model is identified exactly where only an almost comparison is proved

**Location.** `packages/PerfectoidSpacesPartII/README.md:1802`: “Its integral model is `B̃°`”; the envelope was defined at :1781 as `B̃^♮`.

**Claim.** The power-bounded ring of the perfectoid coreflection is exactly the integral closure B̃°.

**Witness.** ANDRE18A line 3175 calls B̃ almost perfectoid; lines 3181–3185 distinguish B̃ from B̃^♮. Theorem 0.3.1 at line 63 supplies an inclusion and almost isomorphism of integral models, not equality.

**Exact repair, tested against the source.** Write that the integral model of the envelope is `(B̃^♮)°`, with the natural inclusion `(B̃^♮)° → B̃°` an almost isomorphism in the stated ramified setup. Keep B̃° as the integral model of B̃. This agrees with §4.7(1) and the source. For g = 1 both rings equal the ordinary finite-étale perfectoid unit ball, so the positive control remains valid. The general equality would imply B̃ = B̃^♮ after inverting ϖ, an additional perfectoidness assertion the cited source does not make; compare ANDRE18A line 3215. This finding concerns an unsupported strengthening, not a claimed counterexample to that stronger assertion.

## R06 (P3) — The Frobenius-only negative control accepts Q_p

**Location.** `packages/PerfectoidSpacesPartII/README.md:1203`: “would still reject `ℚ_p`”.

**Claim.** Surjectivity of Frobenius on R°/p alone rejects Q_p.

**Witness.** Z_p/p = F_p and x^p = x. At p = 2 the values are 0,1; at p = 3 they are 0,1,2. Frobenius is surjective in both cases.

**Exact repair, tested.** Correct the Check to say that the Frobenius-only condition accepts Q_p as well as the stated square-zero example. The pseudouniformizer divisibility/nondiscreteness condition excludes Q_p, and uniformity excludes the square-zero algebra. If R02 removes this duplicate section, delete the erroneous Check with it or move only its corrected version to the supplier discussion.

## R07 (P3) — The annular strict-inclusion Check fails at j = 0

**Location.** `packages/PerfectoidSpacesPartII/README.md:1347–1348`: “power-bounded but does not lie in `K°⟨T^{1/p^∞}, ϖʲ/T⟩`”.

**Claim.** The element (ϖ^j/T)^(1/p) is outside the quotient-norm unit ball for every allowed j.

**Witness.** For j = 0, put U = 1/T. Then T^(−1/p) = T^(1−1/p)U belongs to K°⟨T^(1/p^∞),U⟩ and has quotient norm and spectral norm both 1.

**Exact repair, tested.** Qualify the strict-inclusion example by j ≥ 1, and add the boundary agreement at j = 0. For j ≥ 1 its quotient norm is |ϖ|^(−j(1−1/p)) > 1 while its spectral norm is 1; at j = 0 the former expression is 1. Keep the theorem itself for every j ∈ N, as in ANDRE18A formulas (3.12)–(3.16).

## R08 (P3) — The maximal-ideal witness fails at p = 2

**Location.** `packages/PerfectoidSpacesPartII/README.md:2147`: “`ζ_p − 1 ∉ pK°_∞`”.

**Claim.** This element witnesses strict inclusion of (p) in the maximal ideal for every prime.

**Witness.** ζ₂ = −1, so ζ₂−1 = −2 belongs to 2K∞°. Its normalized 2-adic valuation is 1, not less than 1.

**Exact repair, tested.** Use ζ_(p²)−1 instead. Its normalized p-adic valuation is 1/(p(p−1)), strictly between 0 and 1 for every prime: 1/2 for p = 2 and 1/6 for p = 3. The strict-ideal assertion is correct; only the witness changes.

## R09 (P3) — The non-nested-system Check is not a tower of algebras

**Location.** `packages/PerfectoidSpacesPartII/README.md:1517–1520`: “transitions multiplication by `ϖ^{1/p}`”.

**Claim.** This is a non-nested example in the category of unital algebras used in §3.9, showing that its hypothesis is unnecessary.

**Witness.** On K°/ϖ, multiplication by ϖ^(1/p) sends 1 to ϖ^(1/p) ≠ 1. It is not a unital algebra map. Also, after p steps the transition is zero, so its cokernel saturates at K°/ϖ.

**Exact repair, tested.** Replace it by the algebra tower R_i = (K°/ϖ)[X], with T acting as 1 and every successor transition evaluation X ↦ 0. These maps are unital. Since T = 1, the root localizations R_i[j] identify with R_i. The transition image is the constants and the cokernel contains [X], with ϖ^(1/p)[X] ≠ 0; it is not almost zero, so this tower is not nested. Its images stabilize after one step, hence lim¹ = 0 by Mittag-Leffler. This tests the intended sufficient-not-necessary assertion inside the stated category. If retaining the old module illustration separately, label it as such and write its cokernel as K°/(ϖ,ϖ^((i−j)/p)).

## R10 (P3) — Omitting separately adjoined coordinate roots does not always destroy perfectoidness

**Location.** `packages/PerfectoidSpacesPartII/README.md:2201–2202` and :2470–2471: “Without them Frobenius on the reduction is not surjective for `n ≥ 1`.”

**Claim.** Cyclotomic and g-roots without separately adjoined coordinate roots never give a perfectoid algebra in positive dimension.

**Witness.** For n = 1 and g = T₁, the g-roots are exactly the coordinate roots: X^(p^l)−T₁ identifies the finite integral model with W(k)⟦X⟧. The completed tower has all those roots.

**Exact repair, tested.** Say that coordinate roots cannot be omitted in general, and use g = 1, n ≥ 1 as the negative control. In that case T₁ has no p-th root modulo p: all coordinate exponents in a p-th power are divisible by p, even after the constant cyclotomic/root-of-unity extension. For g = T₁, n = 1, every T₁^(1/p^l) is present and has the next root. Keep the source correction concerning the missing coordinates, but remove its universal claim about failure for every g.

## R11 (P2) — Finite freeness is asserted without restricting the upper index to be finite

**Location.** `packages/PerfectoidSpacesPartII/README.md:2064`, repeated :2125: “`A°_{j0} → A°_{j′0}` are finite free”. Infinite indices were admitted at :2057.

**Claim.** This also applies to j′ = ∞.

**Witness.** For n = 0, k = F₂, j = 0, the finite cyclotomic stages have Q₂-dimensions 2^(r−1), r ≥ 1. Their union K∞ has infinite dimension, so K∞° is not finite over Z₂.

**Exact repair, tested.** State finite freeness for `0 ≤ j ≤ j′ < ∞`; state that the ∞ stage is the filtered union and is faithfully flat. Distinguish the completion assertion from finite freeness. This is the quantification of ANDRE18B lines 346–351. It gives ranks 1,2,4 at r = 1,2,3 in the counterexample and does not assert a finite rank for their union.

## R12 (P3) — Two source locators point to the wrong page or proof part

**Location.** `packages/PerfectoidSpacesPartII/README.md:595`: “Theorem 1.6, p. 2”; :2479: “Proposition 4.4.4, proof (2), p. 63”.

**Claim.** The introductory quantitative theorem is on preprint page 2; the problematic trace step is in proof part (2).

**Witness.** BHATT18 line 107 starts page 3 and line 111 states Theorem 1.6. ANDRE18A line 2989 starts proof part (3); line 2991 contains the uniform-limit embedding used by the trace argument.

**Exact repair, tested.** Change the first locator to Theorem 1.6, p. 3, and the second to Proposition 4.4.4, proof (3), p. 63. The cited mathematical passages then resolve directly; the underlying corrected arguments need no change for this finding.

## R13 (P2) — The no-regularity headline is statable but omitted

**Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:37–43` lists the “form without regularity” among unavailable statements; `packages/PerfectoidSpacesPartII/README.md:670–692` states §1.4 as an end theorem.

**Claim.** A bundled pro-object or assembled annular functor is required to state §1.4 at the pins.

**Witness.** Its kernel condition is `∀ m k n, ∃ c, (tg)^(1/p^k)·ker(f_(n+c)) = 0`. This uses one existing localization at a time. A scratch signature with these quantifiers elaborates with only `sorry` warnings.

**Exact repair, tested.** Add the kernel-without-regularity headline below, retaining the existing quantitative cokernel theorem: that theorem already has no regularity binder and supplies the other half of §1.4. Copy the first theorem's binders through `hden`, with R01's Finset annotation; omit `hgreg` entirely and replace the remaining binders/conclusion by:

```lean
    (m k n : ℕ) :
    ∃ c : ℕ,
    letI := locUniformSpace P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    letI := isUniformAddGroup_locUniformSpace P
      ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    letI := isTopologicalRing_locUniformSpace P
      ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    ∀ a ∈ powerBoundedSubring R,
    (∃ y ∈ completedPlusSubring P (powerBoundedSubring R)
        ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
        (Localization.Away (g 0)) (hden (n + c)),
      toCompletionLoc P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
          (Localization.Away (g 0)) (hden (n + c)) a =
        toCompletionLoc P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
          (Localization.Away (g 0)) (hden (n + c))
          (algebraMap K R (t 0) ^ m) * y) →
    ∃ b ∈ powerBoundedSubring R,
      (g k * algebraMap K R (t k)) * a = algebraMap K R (t 0) ^ m * b :=
  sorry
```

This is the definition of almost-pro-zero for the kernel tower: its transition into ker(f_n) is the inclusion of the smaller kernel, so the conclusion can be stated in R°/t^m. No missing carrier or free predicate is introduced. The quantifier c precedes a; it is allowed to depend on m,k,n. The corresponding cokernel offset is already p^k m. Enlarging offsets to their maximum gives the combined pro-isomorphism. BHATT18 lines 427–445 support this formulation.

The full signature, named `bhatt_kernel_without_regularity` in the scratch test, elaborated at the pins with exit 0; its `#check @` output has precisely the displayed quantifier order, with no regularity hypothesis. Update the docstring and name the new declaration in §1.4. Keep §1.3 and §1.5's distinct derived/limit carrier discussion. For the refuting-to-regularity product example g = (T,0), its kernel element (0,1) is sent to zero by g_k t_k, while t_k alone does not kill it; for g = 0 the multiplier is 0. Thus this is the general headline, not a substitute restricted to regular g.

## Verified sound

The review read all 51 numbered sections, their API bullets, Checks, examples, dependency lines, the conventions and corrections, all 24 named Lean declarations, metadata, the five source entries, the previous review and repair report. The 19 explicit definition/API blocks each have at least three Checks (counts range from three to seven); R03–R10 identify the Checks/examples that fail. Counts alone were not treated as mathematical validation.

The package extends the existing roadmap instead of replanning its end theorems. Its principal directions are quantitative principal-locus Riemann extension, uniform Banach limits and ramified almost purity, followed by the explicit normalized Kummer tower. The source order shared by Layers 2–5 is forced here by the stated construction dependencies: localizations and limits precede nested systems, which precede envelopes, which precede their Kummer applications. No computational algorithm, sorry'd data, `set_option`, unexplained arbitrary predicate standing for a missing carrier, copied source passage, or route-specific exclusion of primes was found. The erroneous examples in R03–R04 nevertheless contradict the required general constructions.

README shape was compared with `TauCetiRoadmap/PerfectoidSpaces/README.md` and `TauCetiRoadmap/DerivedModuleAlgebra/README.md` on main. The package has the required scope, conventions, supplier contracts, six layers, Examples and Dependencies, consumers and references. Its module has one docstring and the namespace required by the brief. `public import` is the module-system form of the required imports: one Mathlib import and five used Tau Ceti modules. There are no imports from another roadmap. The native-API drift is R02, not a missing import-object-file issue.

### Seeded source sample

All 15 seeded targets were checked against the legal cached text, including surrounding hypotheses and proof steps used to strengthen a statement. Source line numbers below are those of the service's extraction, and page numbers are the versions specified in the manifest. None of these texts was unavailable. The arXiv v1 text needed for the last source correction was fetched through the sources service under the existing ANDRE18B key; no second key was created and the author's entry was preserved.

| Target | Source passage opened | Outcome |
| --- | --- | --- |
| 0.1 | BHATT18 lines 309–324, Definition 3.2 and Example 3.3, p. 6; preceding paragraph p. 5 | Quantifiers allow n′ to depend on k and n; not the stronger zero pro-object in almost modules. Extension argument rechecked independently. |
| 0.2 | BHATT18 lines 355–370 and 418–426, Theorem 4.2(2), p. 6, Remark 4.3, p. 7 | Uniform offset is independent of n; annihilation is in t-almost modules. The definition is the roadmap's explicit packaging of these assertions. |
| 1.3 | BHATT18 lines 418–426 and 125–130, Remarks 4.3 and 1.8, pp. 7 and 3 | Derived tensor consequence retains the constant; regular-sequence hypothesis is used only for Koszul vanishing. |
| 1.4 | BHATT18 lines 427–445, Remark 4.4, p. 7 | Universal root-variable base change removes regularity for the pro-isomorphism, not for individual kernel vanishing. |
| 2.2 | ANDRE18A lines 591–724, Sorite 2.3.1, pp. 16–19, Corollary 2.3.2, p. 19 | Flat lattice, gauge separation, dense/discrete distinctions and spectral-unit-ball equivalences preserved. |
| 2.6 | ANDRE18A lines 1256–1281, §2.8.1, (2.27)–(2.28), examples and Lemma 2.8.1, pp. 31–32 | Bounded families, not arbitrary algebraic-limit families; reduction map is injective, not asserted surjective. |
| 3.4 | ANDRE18A lines 2163–2293, §3.6.3, (3.12)–(3.16), pp. 49–50 | Perfectoid annular localization and completed tensor comparison supported. Boundary Check needs R07. |
| 3.11 | ANDRE18A lines 2906–2966, Theorem 4.4.2, pp. 61–62 | `ulim` is left quasi-inverse and right adjoint; the statement does not claim essential surjectivity for arbitrary nested systems. |
| 4.1 | ANDRE18A lines 296–368, §§1.9.1–1.9.2 and Proposition 1.9.1, pp. 8–10 | Finite group, almost invariants, tensor map, trace and intermediate-extension clauses match; tensor convention checked below. |
| 4.2 | ANDRE18A lines 369–384, Lemmas 1.9.2–1.9.3, p. 10 | Constant positive rank for the S_r closure; intermediate G-Galois ring and invariant-base hypotheses for rigidity are present. |
| 4.6 | ANDRE18A lines 3171–3195, Proposition 5.3.1(1)–(2), pp. 67–68 | B̃ and its perfectoid coreflection are distinguished by the source. The API's exact integral-model identification is R05. |
| 4.7 | ANDRE18A lines 56–68 and 3171–3200, Theorem 0.3.1, p. 2, Proposition 5.3.1(3), pp. 67–68 | Regular g with chosen roots, mod-p^m conclusion and faithfulness for trace are present. Nonfaithful B′ is not incorrectly forced to contain A. |
| 4.8 | ANDRE18A lines 3201–3216, §5.4, pp. 68–69 | The chosen generically étale normalization is part of the data; perfectoidness is only asserted up to almostification. No separability claim is smuggled into Noether normalization. |
| 5.9 | ANDRE18B lines 551–562, Corollary 2.6.1 and proof, p. 82 | All finite/infinite Kummer indices, nonzero g, coherent finite-presentation descent and Krull detection agree. |
| 5.11 | ANDRE18B lines 589–599, §3.1, p. 83; GR03 lines 702–703 and 1888–1901, Definition 2.2.25/Remark 2.2.26 and Remark 3.1.3 | The lower-!! model, faithful flatness and formula A∞0° + K∞°°Â∞∞° are supported. The additional field/residue Check is not: R04. |

Additional proof inputs opened include BHATT18 Proposition 5.1 (lines 451–467), GR03 Proposition 2.4.35 (lines 1410–1417), Theorem 3.5.28 (lines 3365–3402), and Lemma 5.2.1 (lines 5263–5289). Their completion, nonzerodivisor, finite-presentation or reduction hypotheses were compared to the uses in Layers 3 and 5. No missing source request remains.

### Computed adversarial table

This table includes every sampled target, every headline, every target touched by a finding, and the repaired patterns. Other elementary API checks were also read against these constructions; no blanket “checked” row substitutes for the computed values below. Here q = |ϖ| lies strictly between 0 and 1; integral elements are tested inside their specified ambient algebra.

| Statement | Instances tried | Values computed on the two sides | Result; change |
| --- | --- | --- | --- |
| Root convention; 0.1 extension | p = 2,3; two successive annihilations | Product exponent 2/p^(k+1); requested exponent 1/p^k. Equal at p = 2, smaller at p = 3; multiplication by the remaining root power kills the image. | Repaired F04 is sound. |
| 0.1 almost-pro-zero | M_n = K°/ϖ^(1/p^n) | n′→n image generated by ϖ^(1/p^n−1/p^n′); after ϖ^(1/p^k), exponent ≥ 1/p^n iff n′ ≥ k. For k = n′+1 it is strictly smaller. | Correct quantifier distinction. |
| 0.1 constants/zero/unit | Constant K°, zero tower, t = 1 | Constant image 1 is sent to ϖ^(1/p^k) ≠ 0; zero image gives 0; multiplication by 1 gives the original transition. | Rejects constant nonzero tower; unit case is pro-zero. |
| 0.2 uniformity | Zero-transition K°/ϖ; p = 2, k = l = 2 | c = 1 gives image 0; c = 0 gives ϖ^(1/2)·1 ≠ 0 modulo ϖ. For Bhatt's tower and g = 1 choose l > n+c: exponent is below 1/p^n. | Distinguishes zero-step, one-step and nonuniform bounds. |
| 0.3–0.4 limits and linearity | Zero-transition tower; constant K°/m_K | Difference map on products is the identity, so lim = lim¹ = 0. Constant almost-zero tower has lim = K°/m_K, but each ϖ^(1/p^k) acts by 0; a linear functor sends scalar-times-zero map to 0. | Almost does not mean literally zero. |
| 0.5; 1.3 derived comparison | K = R[−i] ⊕ R[−i−1]; Koszul sequence (0) | Tensor cone comparison has the same scalar-zero map on both summands, not its square. Koszul differential is 0, hence H₀ = H₁ = R rather than H₁ = 0. | Constant independent of degree/amplitude; regularity needed for vanishing. |
| 1.1 annular direction | g = T; q = 1/2, n = 1,c = 1 | Annuli have lower radii 1/2 and 1/4. Smaller annulus is contained in larger; ring restriction goes from n+c to n. For g = 0 localization is the zero ring. | Matches Lean `hsub` and comparison-map convention. |
| 1.2 kernel headline | g = 1; g = (T,0); m = 0 | For g = 1 kernel is 0. In product example kernel includes (0,1), and t^(1/p^l)(0,1) ≠ 0 mod t^m for l large. At m = 0 quotient and kernel are 0. | Almost-regularity excludes the failing product example. Build issue R01. |
| 1.2 quantitative headline | k = 0; m = 1; monomial exponent e | c = 1. For e ≥ 1, t^(ce) is divisible by t; for 0 ≤ e < 1, g^(1−e)t^((n+1)e) is integral. At general k, c = p^k m gives c/p^k = m. | Source proof yields the stated bound; not a one-tactic theorem. |
| 1.2 boundary signatures | g = 0 or 1; m = 0 | g = 0 gives 0 = 0 in the localization; g = 1 takes a = t_l x,y = 0; m = 0 takes a = 0,y = g_k t_l ρ(x), with t^0 = 1. | Consistent boundaries, not substitutes for the general headline. |
| 1.4 no regularity | g = (T,0) in disc × K° | Kernel (0)×K° is not t-almost zero, but (t_k T_k,0)(0,a) = (0,0). For g = 0 the root ideal is 0. | Exact distinction from 1.2(1) survives; the omitted signature is R13. |
| 1.5 limit headline | Perfectoid disc, g = T | Negative coefficient a_(−r) satisfies ‖a_(−r)‖q^(−jr) ≤ C for all j only if a_(−r) = 0; remaining bounded series give A. | Bounded functions extend; unbounded 1/T does not. |
| 2.1; 3.6 closure headline | Perfectoid disc, g = T, b = 1 and b = 1/T | 1 belongs to both root saturation and finite-module power closure. For 1/T, T^(1/p^m−1) is nonintegral for m ≥ 1; powers T^(−r) cannot lie in a finitely generated A°-submodule with fixed denominator bound. | Both sides agree on positive and negative controls; native multiplier closure is not substituted. |
| 2.2 gauge dictionary | A = K° + K°°T K°[T], densely valued K | Gauge(T) = inf_{‖λ‖>1}‖λ‖ = 1, yet T ∉ A; A_* = K°[T]. For Z_p+pT Z_p[T], gauge(T) = p and unit ball is the lattice. | Distinguishes dense and discrete cases. |
| 2.2 spectral norm criterion | A = K°[T,ϖ⁻¹T²] | Gauge(T) = 1, gauge(T²) = q < 1; gauge(ϖ⁻¹/²T) = q⁻¹/² > 1 but its square is integral. | Correct negative control for spectrality/root closure. |
| 2.3 root saturation | Perfectoid disc versus A = K + closure(T₁^(1/p∞)P) in two-variable perfectoid P | In the disc, T^(1/p^m)/T is nonintegral. In the second ring, T₁^(1/p^m)T₂ ∈ A for every m, but T₂ ∉ A. | Saturation can enlarge the algebra; no implicit identity. |
| 2.4 source norm correction | K×K, g = (ϖ²,1), λ = ϖ, a = (1,ϖ²) | Localization keeps second factor, so quotient norm q². Proposed source infimum is inf_m max(q^m,q^(2−m)) = q, attained at m = 1. | README's corrected quotient norm is sound. |
| 2.4 restriction correction | Same g; λ = ϖ³, μ = ϖ | First localization is K×K, second K; restriction (x,y)↦y has kernel K×0. | No general injectivity assertion used. |
| 2.5 tube unit ball | B = K, f = 1; λ = ϖ | Relation ϖU−1 forces a topologically nilpotent unit with bounded inverse; completed tube is 0. For f = 0,λ ≠ 0, tube is K with U = 0. | Degenerate tubes agree with quotient construction. |
| 2.6 uniform limits | Annuli; expanding discs; empty diagram | Norm of 1/T at level j is q^(−j)→∞, so it is excluded from ulim. Coefficients q^(−floor√n) converge on each radius r<1 since r^n q^(−floor√n)→0, but are unbounded as r→1. Empty product is zero algebra, norm 0. | Boundedness and zero ring handled. |
| 2.7 repaired perfection | K = F_p(T) | Inverse Frobenius limit projects to ∩K^(p^n) = F_p. Direct perfect closure contains T^(1/p), absent from K. | Repaired F03 valid. |
| 2.8; Layer 2 example | Existing root system over C₂ | Two evaluation values U and −U at the new square root; after T = 1, four idempotents versus two. In characteristic p, (S−U)^(p^i) = 0 and uniformization kills S−U. | R03: distinguish free root algebra from its selected quotient. |
| 2.9 tube colimit | g = 0 or g = 1 | Uniformized zero-root algebra kills all S_k, yielding A; roots of 1 remain distinct in characteristic zero (level 1 over C₂ gives A×A). | Colimit is not selection of one root. |
| 3.0 native predicate | Q_p; C_p[ε]/ε² | On F_p, Frobenius is identity. All aε are power-bounded for arbitrary ‖a‖, so the dual-number power-bounded ring is unbounded. | R02 duplicate; R06 wrong Q_p Check. |
| 3.1 coreflection | Perfect characteristic-p A; nonperfect F_p(T) algebraically | In perfect A the inverse Frobenius system has unique roots and projects isomorphically to A; in F_p(T) projection image is F_p, not the perfect closure. | Direction correct; no direct-perfection substitution. |
| 3.2 repaired idempotents | Q_p at root level i = 0,1,2 | Irreducible-factor counts 1,2,3 give 2,4,8 idempotents. A nonzero idempotent has norm 1; differences satisfy u³ = u. | Repaired F05 valid; field example is explicitly finite-level. |
| 3.3 almost versus perfectoid | A = K + closure(T₁^(1/p∞)P); B = A+T₂A | T₂ ∈ B but T₂^(1/p) ∉ B by exponents. Multiplication by each T₁ root sends missing-root monomials into A. | Almost perfection is weaker than perfection. |
| 3.4 annular unit balls | j = 0,1; p = 2 | j = 0: U^(1/2) = T^(1/2)U, both norms 1. j = 1: quotient norm q⁻¹/², spectral norm 1. | R07. |
| 3.5; 3.9 limit bounds | T = 1; p = 2,3 | Root localization is identity. In §3.9, b_k−b_(k+1) = 12(p−1)/p^(k+1) ≥ 6/p^k; equality for p = 2. | Tail-lifting estimate works at the smallest prime. |
| 3.6; 3.7 extension and maximality | g = 1; disc g = T | Saturation at 1 is A°. For the disc, 1/T has unbounded powers and annular norms q^(−j), so it is outside the largest perfectoid bounded subalgebra A. | Headline and maximality use actual boundedness. |
| 3.8 uniform/perfectoid limits | Constant perfectoid A; zero diagram | Uniform limit A, coreflection A^♮ = A; zero limit and coreflection both 0. In a general almost-perfectoid example, unit-ball comparison is almost, not equality. | Correct distinction, needed by R05. |
| 3.9 negative control | Original scalar maps; replacement evaluation tower | Original f(1) = ϖ^(1/p) ≠ 1. Replacement has f(1)=1, f(X)=0, stabilized image constants, coker containing [X] not killed by ϖ^(1/p); lim¹ = 0. | R09 supplies an algebra example. |
| 3.10–3.11 nested systems | Standard annuli; zero system | Localizing A[i] further to j gives A[j], comparison identity. Uniform limit for the perfectoid disc is A; localization recovers A[j]. Zero localizes to 0 and has ulim 0. | Sampled adjunction is left quasi-inverse/right adjoint, not automatic essential surjectivity. |
| 4.1 Galois tensor convention | B=A×A,C₂; B=A^G,S₃ | For e₁⊗e₂, André gives swap component e₂, supplier convention e₁. For S₃, the delta pair (e_a,e_b) has its unique nonzero component at γ with γa=b; 36 basis pairs match 36 product coordinates. | Tensor swap explains both nonabelian and cyclic tests. |
| 4.1 ramified negative control | Z→Z[i], conjugation | Basis images (1,1),(i,i),(i,−i),(−1,1); integer determinant has absolute value 4, cokernel (Z/2)². Inverting 2 kills it. | Not Galois before inverting 2. |
| 4.2 Galois closures | ranks 0,1,2,3 | Rank 0 cannot be faithfully flat over nonzero R. Rank 1 gives T=R; split rank 2 gives T=R²; Q(cuberoot 2) gives degree 6 closure and subgroup order 2. | Positive rank and S_(r−1) convention correct. |
| 4.3 envelopes | B′=A[1/T] over perfectoid disc | Algebraic limit admits 1/T with coordinates norm q^(−j); uniform limit excludes it, but its localization restores 1/T. | Corrected proof uses algebraic limit for injectivity. |
| 4.4–4.5 ramified almost purity | Trivial and tame covers | g=1 gives ordinary almost purity. In tame cover Y^ℓ=T, derivative is ℓY^(ℓ−1); away from T it is invertible, at T=0 it vanishes. | Ramified root setup needed; no claim of ordinary étaleness at T=0. |
| 4.6 integral model | g=1; general coreflection | For g=1 both integral models coincide. Generally source supplies kernel 0 and almost-zero cokernel for (B̃^♮)°→B̃°, not zero cokernel. | R05: retain almost comparison. |
| 4.7 Abhyankar headline | B′=0; B′=A[1/g]×A[1/g]; tame ℓ≠p | Zero case structure map sends 1 to 0. Product trace is (a,b)↦a+b and hits 1 via (1,0), even p=2. Tame derivative calculation above excludes unramified interpretation. | Faithfulness needed for trace, not existence of the zero envelope. |
| 4.8 affinoid envelopes | B=A and B=A×A,g=1; zero/inseparable case | Models are P and P×P, ranks 1 and 2. Zero ring has no injective normalization from nonzero K⟨T⟩. A purely inseparable field extension has no g making it étale. | Stated input data excludes both invalid cases. |
| 5.1 pure maps | Z→Z² diagonal; Z→Q | For every P, diagonal P→P² has first projection as retraction. For P=Z/2, P⊗Q=0, so the second map is not pure despite being injective. | Module purity, not spectral universal injectivity. |
| 5.2 almost predicates | m=0; m=V | Every module/map is almost zero/pure in the first setup; in the second, scalar 1 forces ordinary zero kernels and ordinary flatness/faithfulness. | Simple elementwise formulation sound; duplicate zero predicate R02. |
| 5.3 Krull detection | DVR R, S=R; unit ideal excluded | ∩_n p^n R=0, so a finitely generated module killed by all these divisibility tests is 0. Taking ideal S instead makes every quotient test vacuous, while M=R remains nonzero. | Proper/idempotent-ideal hypotheses matter. |
| 5.4 finite/infinite stages | n=0,p=2; r=1,2,3,∞ | Finite cyclotomic ranks 1,2,4, then unbounded. ζ₂−1 has valuation 1; ζ₄−1 valuation 1/2. | R08 and R11. |
| 5.4; 5.6 free roots | n=0,p=2,g=2,j=3,l=1 | u²=ζ₈²+2+ζ₈⁻²=2; X²−2=(X−u)(X+u), e²=e with e=(1,0). Norm(e)=norm(1−e)=1 at every later stage. | R04: completed tower not a field. |
| 5.5 spectral transitions | Split stage K₃×K₃ | Norm(e)=1 and norm(e(1−e))=0 while norm(e)norm(1−e)=1. Power multiplicativity holds; full multiplicativity fails. | README's general spectral claim survives; field examples do not. |
| 5.6 coordinate roots | n=1,g=T₁ versus g=1 | In first tower X_l^(p)=X_(l−1) gives every coordinate root. In second, Frobenius coordinate exponents are multiples of p, so T₁ is not in its image. | R10. |
| 5.7 Noetherian tubes | Reduction of monic tube equation of degree p^d | Basis 1,X,…,X^(p^d−1) gives rank p^d; special fibre k[X,U]/(monic polynomial) contains 1≠0. | Flatness plus nonzero fibre yields faithful flatness; no affinoid assumption on A_j0 used. |
| 5.8 flatness headline | Module over K∞° in n=0 case; p=2 split stage | Integral stages are torsion-free: nonzero scalar acts injectively on both factors; e and 1−e are both retained. Almost ideal kills the prescribed tensor kernels, not arbitrary nonzero modules. | Statement retains full tower and correct ideal; R01 build, R04 examples. |
| 5.9 purity headline | n=0,j=0,l=1,g=p; p=2,g=1 | Integral basis 1,X,…,X^(p−1), projection onto 1 retracts Z_p. For g=1,p=2, diagonal Z₂→Z₂² retracts by first projection; tensor kernels both 0. | Purity valid for domain and split examples, all indices remain in statement. |
| 5.10 generic flatness | n=0,p=2,g=2 | Nonzero K∞-vector space remains faithfully flat regardless of nontrivial idempotents; multiplication by g=2 is invertible on generic fibre. | Field assumption unnecessary and false: R04. |
| 5.11 model S | Same split stage, two branch residues | e has residues (1,0); every a+m b in S has residues (ā,ā). Quotient B°/S is nonzero but multiplied by m becomes 0. | Correct almost isomorphism; exact equality refuted, R04. |
| 5.12 ramified mod-p^m headline | B=A×A; m=0,1 | Diagonal M→M² has zero kernel and first projection retracts; at m=0 both quotient rings are 0. At m=1 remains faithfully flat. | Mod-p^m and faithful hypotheses consistent; no stronger unreduced claim. |

### Lean acceptance test and padding

The pins read from `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The original acceptance file fails as recorded in R01. All five imported Tau Ceti object files existed; no broad build, update, cache fetch or option change was used.

On the scratch copy with only R01's changes, the default elaboration exits 0 with exactly five `declaration uses sorry` warnings. A second scratch copy probed **all five** admitted theorems with `rfl`, `simp` followed by `done`, and `infer_instance`, falling back to `sorry`. All five retained their `sorry` warnings. Near-matches were compared by object: ordinary closure lemmas require Noetherian/domain/fraction-ring hypotheses, and ordinary faithfully flat tensor lemmas require the very flatness under investigation; none directly proves these headlines. No admitted declaration was identified as padding. The two proved helper theorems supply inclusions/integrality needed by the real Kummer construction, rather than admitted boundary examples.

The same scratch run appended `#check @name` for all 24 named declarations. The elaborated signatures preserve the complete/Hausdorff/topological hypotheses for the perfectoid statements, the chosen root systems, the nonzerodivisor hypothesis in the closure equality, and `[CharP k p] [PerfectRing k p]`, `g ≠ 0` for both Kummer headlines. No lost section binder was found. All 24 own names occur in the README; the backticked names attributed to this roadmap resolve to declarations. R02 requires changing that inventory when native definitions replace local copies.

| README headline | Acceptance-file coverage |
| --- | --- |
| §1.2 quantitative theorem | Two substantive clauses at :110 and :158; R01 repairs elaboration. Pro-object clause listed in docstring. |
| §1.3 derived form; §1.5 limit form | Named in the docstring with missing assembled derived diagram/limit. No scalar stand-ins. |
| §1.4 no regularity | Incorrectly listed as not statable. R13 supplies a tested native-carrier kernel statement; the existing cokernel headline already covers arbitrary g. |
| §3.6 perfectoid Riemann extension | Complete-integral-closure equality at :223; uniform-limit clause named in docstring. |
| §3.11 nested-systems theorem | Named in docstring; missing category of compatible annular algebras and its limit. |
| §4.5 ramified almost purity | Named; almost-perfectoid and almost-finite-étale algebra structures are still the relevant obstacles. The additional claim that the almost-module category is absent needs R02. |
| §4.7 perfectoid Abhyankar lemma | Named; topological intermediate perfectoid algebras and almost-finite-étale structure are missing. The alleged missing finite-projective trace is corrected by R02. |
| §5.8 André flatness | `kummer_almost_faithfullyFlat` at :397, on the actual completed normalized tower; R01. |
| §5.9 purity of normalized extensions | `kummer_isPureHom` at :341, both indices in N∞. |
| §5.11 faithfully flat integral model | Construction/API target relying on the missing lower-!! algebra carrier; not replaced by an arbitrary ring with flatness assumed. |
| §5.12 ramified almost flatness modulo p^m | Named in docstring with missing completed-algebra/root-setup structure; no weaker substitute. |

### Pinned declarations and supplier resolution

The library audit searched constructions as well as chosen names: perfectoid predicates, almost Serre quotients and torsion predicates, projective traces, free-root presentations, integral closures, rational localization and comparison maps, completion modules and tensor-injectivity criteria. Besides the native duplicates in R02, the general Banach/root-tower headlines were not found already proved. Representative declarations actually opened, including the near-matches that matter:

| Pinned file and locator | Declaration/content and comparison |
| --- | --- |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27,32,126` | `IsAlmostIntegral` uses a nonzero-divisor multiplier; `completeIntegralClosure`; its equality with integral closure has Noetherian/domain/fraction-ring hypotheses. These do not state §3.6's perfectoid root-saturation theorem. |
| `Mathlib/RingTheory/Perfection.lean:39`; `Mathlib/FieldTheory/PerfectClosure.lean:68` | Inverse compatible sequences versus direct Frobenius quotient; F03 checked. |
| `Mathlib/Algebra/Module/Torsion/Basic.lean:214` | `Module.IsTorsionBySet`: all scalars in a set annihilate all elements; R02. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:171,269,324` | Completion carrier, submodule model and scalar-tower module instance; R01. Completion has module structure; this alone supplies no perfectoid algebra structure. |
| `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311` | `HasDenominatorPower` takes a Set; body is not exposed across module boundaries. |
| `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean:117` | `completedPlusSubring` takes a Finset; same presentation is required in its proof argument. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219` | `pairHomOfRationalSubsetSubset`: inclusion of rational subsets reverses direction on algebras. |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86,102,108,118,128` | Native predicate, uniformity, reducedness, surjective-Frobenius criterion and iff; R02. Completeness and T2 are explicit assumptions, not inferred from a bare topological ring. |
| `TauCeti/RingTheory/Perfectoid/Field.lean:68,200` | Native perfectoid field predicate/criterion; field nondiscreteness and Frobenius conditions are available. |
| `TauCeti/RingTheory/Almost/BasicSetup.lean:111,252,261` | Basic setup, almost-zero predicate and its elementwise law. A bare ideal is not automatically a basic setup. |
| `TauCeti/RingTheory/Almost/Module.lean:75,86` | Actual Serre-quotient category and almostification, not a placeholder category; R02. |
| `TauCeti/LinearAlgebra/Trace/Projective.lean:72` | `LinearMap.projectiveTrace`, for finite projective modules; R02. |
| `TauCeti/RingTheory/Etale/Torsor/Basic.lean:88` | Native finite étale torsor structure. The supplier's older name is explicitly mapped to this API, not an unowned prerequisite. |

Every cross-roadmap supplier in the README was checked at main or the allowed open head. Scope-only comparisons were distinguished from supply. The main PerfectoidSpaces P0/P1/P2/P3 targets cited in the exact contracts still resolve: basic setups, almost modules/algebras, adjoints, flatness, trace, descent, Nakayama and almost limits; perfectoid fields/tilts, completed colimits and perfected Tate algebras; rational localization, approximation/tensor products; and almost purity. Native implementations of some of these are now to be cited as in R02; their presence does not make the remaining supplier sections disappear.

Concrete resolution anchors include `TauCetiRoadmap/PerfectoidSpaces/README.md:879` (P0.1), :965 (P0.2), :1042 (P0.3), :2161 (P0.16), :3029 (P0.25), :3143 (P0.26), :3220 (P0.27), :3583 (P1.1), :5049 (P1.24), :5101 (P1.25), :5197 (P1.27), :5289 (P1.29), :5423 (P1.30), :6136 (P2.2), :6235 (P2.3), :6427 (P2.4), :7391 (P2.13), :7570 (P2.16), and :8628–8746 (P3.10–P3.13).

The other contracts resolve as follows:

- `TauCetiRoadmap/AdicSpacesPartII/README.md:1769,2270,4071`: R0.3, R0.4 and R0.9, including the affinoid normalization deferral to RigidAnalyticGeometry §1.2. `TauCetiRoadmap/AdicSpacesPartIII/README.md:10179,12470`: R3.5 and R3.9. The uniform Banach variants kept here have an explicit stronger/different scope.
- `TauCetiRoadmap/AdicEtaleGeometry/README.md:9246,9267,9376`: A4.2, its old `Algebra.galoisTensorMap` alias and A4.2a. The resolver's old-name lead is settled by the explicit alias, and the tensor-swap convention was recomputed above.
- `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649,794,1865`: Koszul complexes, derived tensor and derived limits; §1.T.1's module-tower contract, together with EnhancedDerivedSheaves E2:towers.2, supplies ordinary towers/pro-zero notions. Almost-pro-zero is the new variant here.
- DerivedDeRhamCohomology §1.10 supplies the complete Noetherian-base reduction criterion; DeformationAndDerivedPatchingAlgebra §1.13 supplies completion of flat algebras over a Noetherian base, faithful for an ideal in the Jacobson radical. Their statements were opened, not inferred from their titles. §5.7 uses the Noetherian finite stages before passing to the union.

The board package index was read before the ownership search. `roadmaps grep`, `roadmaps show` and the overlap inventory were used for open heads. The nearest heads were checked by scope/object: DirectSummandsAndBigCohenMacaulay (PR #1735) consumes this quantitative/principal Kummer theory and owns direct summands and big Cohen–Macaulay conclusions; PerfectoidQuotients (PR #1042) owns almost faithfully flat perfectoid root covers, distinct from the explicitly normalized tower; PerfectoidTowers (PR #816) owns quotient/descent constructions; RelativeFarguesFontaine (PR #1209) owns relative period rings/curves. PerfectoidSpaces (revision PR #1187) was compared for overlap, while supplier references were resolved against its main version, as required. No second owner of the package's quantitative or explicit normalized-tower headlines was found. The existing native predicate overlap is R02.

The overlap inventory has no conflicting head changing this package, no cited supplier id dropped at an open head, and no cited id defined only by an unacknowledged open revision. No old package id was deleted by this repair. DirectSummandsAndBigCohenMacaulay's pre-existing `RA.` vocabulary is a consumer-side citation problem already identified in the prior review, not a renumbering made by this package.

The dependency check was rerun using the prescribed command and returned:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every `*Needs:*` and layer dependency was read; no additional unowned prerequisite or upward supply was identified. `design/plan.json` has `gaps: []`, matching the absence of declared gaps in the README. The native-API drift and duplicate predicate are separately actionable under R02.

## Not verifiable

- No cited source needed for the seeded sample or the author's source corrections remained unreadable. The ANDRE18B arXiv v1 correction was checked at lines 738–745 against the published A.4 at lines 940–947.
- A successful elaboration of the submitted acceptance file cannot be certified: it fails as in R01. Success of the scratch repair is explicitly distinguished from success of the package.
- The stronger exact integral-model equality in R05 is not certified by the cited source. No explicit counterexample is claimed; the actionable issue is that the source and the package's own §4.7 support only an almost isomorphism.

## Source issues

- **Error** in ANDRE18A at Theorem 0.3.1(1), printed p. 2 (line 61): the source says the structure map into the envelope is an inclusion for every finite étale algebra; it should be a structure map, injective under faithfulness; affects a stated result.
- **Error** in ANDRE18A at §2.6.2 property list, printed p. 28, and Lemma 2.6.3 proof, printed p. 29 (lines 1158,1190): the source says the quotient norm equals the infimum of the rescaled powers; it should be the quotient Gauss norm, which can be q² when that infimum is q; affects a stated result.
- **Error** in ANDRE18A at Lemma 2.6.3 proof, printed p. 29 (line 1190): the source says that infimum is bounded below by one; it should be bounded below by the norm of the nonzero element under the stated size hypothesis; affects the proof.
- **Error** in ANDRE18A at Remark 2.6.4(1), printed p. 29 (lines 1193–1195): the source says restriction maps between the uniform localizations are injective without an additional restriction; it should be restricted appropriately, since a product algebra can lose a factor; affects a stated result.
- **Misprint** in ANDRE18A at formula (2.17), printed p. 26 (lines 1005–1008): the source says invert p in the middle integral model; it should be invert the pseudouniformizer ϖ, also in characteristic p; affects a stated result.
- **Misprint** in ANDRE18A at Lemma 2.5.3, proof of (2) implying (6), printed p. 27: the source says use condition (1) for the scaled elements; it should be condition (2), since those elements lie in B[1/g]; affects the proof.
- **Error** in ANDRE18A at Proposition 4.4.4, proof (3), printed p. 63 (line 2991): the source says A[1/g] embeds in the bounded uniform limit of the annuli; it should be the algebraic limit, since 1/T has unbounded annular norms; affects the proof.
- **Gap** in BHATT18 at §1.4 Notation, preprint p. 3 (line 146): the source says t has compatible roots and norm matching p in characteristic zero; it should be required to satisfy 0 < |t| < 1 in characteristic p as well; affects a stated result.
- **Misprint** in ANDRE18B at §1.2.1, formula (2), printed p. 77 (line 266): the source says the valuation condition with an erroneous conjunction; it should be the condition that the valuation is discrete; affects nothing.
- **Error** in ANDRE18B at §0.6, printed p. 74 (lines 142–150): the source says the completed root algebra is obtained from stages adjoining cyclotomic and g-roots alone; it should be the stages also adjoining coordinate roots as in §§2.2–2.3; affects a stated result.
- **Gap** in ANDRE18B at Theorem 2.5.2, proof (a), printed p. 81 (lines 485–497): the source says flatness over the localized power-series ring follows from flatness over affinoid polydiscs; it should be justified by a descent/completion argument or a direct integral flatness criterion; affects the proof.
- **Misprint** in ANDRE18B at Lemma A.2.1(4), printed p. 90 (line 888): the source says the dual consists of S-linear maps from S to R; it should be R-linear maps, Hom_R(S,R); affects the proof.
- **Gap** in ANDRE18B at Lemma A.2.1(4), printed p. 90 (lines 887–889): the source says a single evaluation equal to one produces the retraction without deriving such a pair; it should be a finite sum of evaluations equal to one and the corresponding sum of linear maps; affects the proof.
- **Misprint** in ANDRE18B at A.4, printed p. 92 (line 947): the source says the intermediate module maps almost injectively backwards to M; it should be the forward factorization M → M′ → N; affects a stated result.
- **Misprint** in ANDRE18B at arXiv v1 §5.5, preprint p. 14 (lines 741–744): the source says module almost purity tests P → P⊗S, with S unspecified; it should be P⊗M → P⊗N for every module P; affects a stated result; corrected in print at A.4, p. 92.
