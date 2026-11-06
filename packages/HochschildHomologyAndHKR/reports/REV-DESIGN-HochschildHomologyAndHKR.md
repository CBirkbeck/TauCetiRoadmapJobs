<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6915#issuecomment-6675280460 -->
Review (claude) of 917778b

Verdict: needs_changes

1. **F01** (P2) The pinned Tau Ceti has Hochschild cochains, braces and the Gerstenhaber bracket

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 287 (From Tau Ceti):
   "The pinned Tau Ceti contains no Hochschild cochain or brace declarations; those are imported
   from DGAInfinity Layers 0 and 8 by section." Also line 87 (the list "Already in the pinned
   libraries") and the `*Needs:*` lines of §6.1 (line 943) and §6.2 (line 975).

   **Claim.** No Hochschild cochain or brace declaration exists at the pinned Tau Ceti, so §§6.1–6.2
   cite DGAInfinity Layer 0 and Layer 8 by section for the suspended cochains, the brace, the
   Gerstenhaber bracket and the Hochschild differential `[m,−]`.

   **Witness.** At the pinned Tau Ceti:
   `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75`
   `TauCeti.AInfinityAlgebra.hochschildDifferential` (`[m, F]`), `:86`
   `hochschildDifferential_eq_brace_sub` (`[m,F] = m{F} − (−1)^q F{m}`), `:166`
   `hochschildDifferential_gerstenhaberBracket` (Leibniz rule), `:183`
   `brace_brace_sub_brace_brace_eq_hochschildDifferential` (pre-Lie identity, degree zero);
   `Hochschild/Complex.lean:49` `cochains`, `:87` `complex`, `:103` `bracket`;
   `Hochschild/Cohomology.lean:80` `Cohomology`, `:197` `cohomologyBracket`;
   `Hochschild/Normalized.lean:311` `normalizedCochains`;
   `TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean:94` `TauCeti.brace` (docstring: inserts `g`
   into every block with the Koszul sign of moving `g` past the letters before the block, the
   rule the README assumes of DGAInfinity Layer 0), `:160` `gerstenhaberBracket`
   (`F{g} − (−1)^{pq} g{F}`, the README's bracket), `:330` `gerstenhaberBracket_swap`, `:354`
   `leibniz_gerstenhaberBracket`. What the pin does not include is stated in
   `Hochschild/Cohomology.lean` lines 24–25: arity-zero cochains and the cup product; there are
   no Hochschild chains and no multiple brace `m{F,G}`.

   **Repair.** (1) Replace the sentence at line 287 by the list above with files, and add these
   declarations to the "Already in the pinned libraries" list at line 87, saying what they do not
   include (arity-zero cochains, the cup product and the multiple brace, Hochschild chains).
   (2) §6.1: state the dictionary for arities `n ≥ 1` against the pin: `Θ` is a `k`-linear
   isomorphism from `C^n(A,A)` onto the arity-`n` part of `TauCeti.AInfinityAlgebra.cochains 𝒜 (n−1)`
   for `𝒜` the `A∞` algebra `TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra` of `A` in degree
   zero (suspension `TauCeti.AInfinity.IsSuspension`, sign-free on degree-zero inputs by
   `TauCeti.MultilinearMap.suspend` with `suspExp = 0`), with
   `Θ(δf) = (−1)^{n+1} 𝒜.hochschildDifferential (n−1) (Θf)` and
   `Θ(f ∘ g) = TauCeti.brace _ (Θf) (Θg) (q−1)`, `Θ{f,g} = TauCeti.gerstenhaberBracket _ (p−1) (q−1) (Θf) (Θg)`;
   keep DGAInfinity Layer 8 by section only for arity zero (`C⁰ = A`, where the witnesses at
   `n = 0` and `(p,q) = (1,0)` live), for the cup product and the multiple brace
   `m{Θf,Θg}`, and for the chains of §6.3. (3) §6.2: cite
   `TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket` and the brace identities
   of `Brace.lean` where the route uses them, and DGAInfinity Layer 0 only for the multiple-brace
   relation. (4) `plan.json` 6.1 and 6.2: add the `tauceti:` prerequisites. Tested on the instance
   that refuted the original: the `n = 1` witness `[m,Θf](sa ⊗ sb) = s(f(a)b + af(b) − f(ab))` is
   `hochschildDifferential_eq_brace_sub` at `q = 0` with `m{Θf} = s(f(a)b + af(b))` and
   `Θf{m} = s f(ab)`, which matches the pinned definition.

2. **F02** (P3) §6.3 cites the wrong supplier for "flat ⟹ classical equals derived"

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 995: "For `A` flat as a
   `k`-module these chains are the derived Hochschild chains of KTheoryFiniteLocalFields §4.0".

   **Claim.** The identification of the underived cyclic bar complex of a `k`-flat algebra with the
   derived Hochschild chains is supplied by KTheoryFiniteLocalFields §4.0 or DGAInfinity Layer 8.

   **Witness.** KTheoryFiniteLocalFields §4.0 (open head, "Cyclic homology foundations") uses
   DGAInfinity Layer 8's derived chains and says nothing about flat algebras. RefinedTraceMethods
   §1.1 (open head, "The cyclic enhancement of supplied derived Hochschild chains") states it:
   for `k`-flat DG `A` the derived object is the direct-sum totalization of its cyclic DG bar, and
   for non-flat `A` (`k = ℤ`, `A = 𝔽_p`) the two differ.

   **Repair.** Add RefinedTraceMethods §1.1 to §6.3's `*Needs:*` line and to the RefinedTraceMethods
   supplier contract (it is already a supplier, earlier in the merge order), and attribute the flat
   identification to it; keep KTheoryFiniteLocalFields §4.0 for `HH_n(A/k)` and its check
   `HH₀ = A/[A,A]`. `plan.json` 6.3: add `roadmap:RefinedTraceMethods §1.1`.

3. **F03** (P3) §6.4(a)–(c) carry an unused flatness hypothesis

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 1016: "For a commutative
   `k`-algebra `R` flat over `k`, prove: (a) … (b) … (c) …".

   **Claim.** The classical maps `ε^cl_n`, `π^cl_n` and the identity `π^cl_n ∘ ε^cl_n = n!` are
   stated for `R` flat over `k`.

   **Witness.** Flatness enters only the comparison clauses ("§6.3 carries it to `ν_n ε_n`",
   "corresponds to `ν_n π_n`"). The antisymmetrised chain is a cycle for every commutative `R`: in
   `b(Σ_σ sgn σ r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)})` the inner terms cancel in pairs `σ, σ∘(i i+1)`, and the
   first term of `σ` cancels the last term of its cyclic shift `σ′` (sign
   `sgn σ′ = (−1)^{n−1} sgn σ`, against `(−1)^n`). `π ∘ b = 0` and `π ε = n!` are the same
   computation for every `R` (Ginz05 lines 2142–2156 make no flatness assumption; RefinedTraceMethods
   §1.9 says "flat over `k`, or replace `C_•` by the derived HH"). §8.4 and §7.6 only use flat or
   projective `R`, so no consumer is affected.

   **Repair.** State (a)–(c) for every commutative `k`-algebra `R`, and put "if `R` is flat over
   `k`" on the two comparison clauses and on (d); update `plan.json` 6.4 hypotheses accordingly.

4. **F04** (P3) Locators whose hypotheses are narrower than the targets (§8.4, §8.5)

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 1317 "(HKR62 Theorem
   3.1, line 210; …)" and line 1330 "(Ginz05 §9.2; HKR62 Theorem 5.2)".

   **Claim.** HKR62 Theorem 3.1 supports the polynomial computation of §8.4 "over any commutative
   `k`", and HKR62 Theorem 5.2 supports the Jacobian statement of §8.5.

   **Witness.** HKR62 line 210: Theorem 3.1 assumes `S` and `R` Noetherian, `R` regular and `S_M`
   regular, none of which holds for `k[X₁,…,X_m]` over an arbitrary `k`. HKR62 line 548: Theorem
   5.2 is for a regular affine algebra over a perfect field. The route of §8.4 (Koszul resolution
   of §§8.1–8.3) is the construction inside the proof of Theorem 3.1, HKR62 lines 268–279, which
   needs only a regular sequence; the Jacobian formula of §8.5 is the determinant of §7.5 at the
   derivations `g∂₁, ∂₂, …, ∂_m`, with the class identity from §7.5 and HKR62 line 495.

   **Repair.** §8.4: cite HKR62 lines 268–279 (and Loday98 §3.2 for symmetric algebras over any
   `k`, uncertified) in place of Theorem 3.1; keep Ginz05 §9.3. §8.5: cite §7.5, HKR62 line 495
   and Ginz05 §9.2 lines 2142–2156, and drop Theorem 5.2 or mark it as the perfect-field case.
   Same in `plan.json` 8.4 and 8.5 locators.

One blocking finding (P2) and three non-blocking notes (P3). The mathematics of the 37 targets
survived the adversarial pass; the blocking finding is a false claim about the pinned Tau Ceti
in the supplier contracts, which changes what Layer 6 imports by section and what the package
can state at the pin.

## Verified sound

**Principles.** No route-specific shortcut: the ground ring is an arbitrary commutative ring
throughout, the HKR theorem is stated for the canonical map with the determinant map identified
as `n!` times it, and the polynomial case is unconditional. No Tau Ceti roadmap is re-planned:
Layer 8 of DGAInfinity, §4.0 of KTheoryFiniteLocalFields, §1.9 of RefinedTraceMethods and
§0.K.1 of DerivedModuleAlgebra are imported by section (resolved below); the kept variants
(bimodule coefficients on Mathlib's complexes, normalisation for ordinary algebras, `HH²` without
deformation parameter, `HH₁ ≅ Ω¹` on the classical complex for non-flat `R`) each differ in one
stated respect. No copied passage (all source citations are locators). No algorithm. No
`Suggested.lean` yet (design stage).

**Dependency check.** Output of the gate with the candidate README and the board merge order:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2365 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: DGAInfinity and DerivedModuleAlgebra on main;
KTheoryFiniteLocalFields (merge order 70) and RefinedTraceMethods (312) earlier than the
placement. Scope citations resolved: BanachAlgebras Layer 6 (main, line 1379),
NoncommutativeGeometry N1 (main, line 84), ZigzagPreprojective Layer 7 (main, line 380),
LanglandsParameterStacks §1.17 (open head, line 525), DerivedDeRhamCohomology Layer 2 (open
head). DerivedModuleAlgebra §0.K.1 (main, line 516): `K(x)_k = ⋀^k Aⁿ`, degree `−1` derivation
with `e_i ↦ x_i`, acyclic for weakly regular `x`; with this derivation `d(e₁ ∧ e₂) = x₁e₂ − x₂e₁`,
which is the sign §8.2 uses and §8.3's `j = 2` Check needs (recomputed below). RefinedTraceMethods
§1.9 (open head, line 404): `ε_n` with `σ⁻¹`, `π_n`, `π_n ε_n = n!`, `ε` multiplicative, `ε₁` an
isomorphism, hypotheses "flat over `k`, or derived"; its Checks (`k[x,y]`, `k[x]/(x²)`) agree
with §6.4's. §1.10 (line 445): `HH₂(𝔽_p/ℤ) = 𝔽_p`, as §6.3's Check cites. KTheoryFiniteLocalFields
§4.0 (open head, line 639): derived chains from DGAInfinity Layer 8, `HH₀ = A/[A,A]`, smooth HKR
`HH_n(A/k) ≅ Ω^n` without naming the map, as the gap says. DGAInfinity (main): Koszul tensor-map
rule and degree `−1` suspension (lines 70–80), the sign-free square `b_n ∘ s^{⊗n} = s ∘ m_n` and
`m₂(a,b) = ab` with no twist (lines 93–110), Layer 0 braces with "the exact Koszul sign for
substituting a degree-`q` operation after the first `r` inputs" (line 263), Layer 1 (line 293),
Layer 8 (line 520: chains and cochains of DG algebras, cup product, braces, Gerstenhaber bracket,
`[m,−]`). The README's suspension dictionary is derived from exactly these conventions.

**Declared gap.** `smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods §1.9): precise
(the map, the quantifiers, the identification with §4.0's comparison), minimal (§1.9 proves
`π_n ε_n = n!`, which in characteristic `p ≤ n` does not give bijectivity; §4.0's isomorphism is
unnamed, and the route of §7.6 needs the named map to identify `Ψ_n` with `τ_n`), declared with
the same slug in `plan.json` and the README. The acceptance is conditional on it.

**Pinned declarations opened** (Mathlib `f6090c70`, Tau Ceti `358314d4`, the manifest pins):
`exteriorPower.pairingDual` and `pairingDual_ιMulti_ιMulti`
(`Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64,71`, value `det(f_j(v_i))`),
`bijective_pairingDual` (`.../Basis.lean:182`, section `FiniteFree`: `[Module.Free R M]
[Module.Finite R M]`, as the README says), `instFinite`, `instFree` (`Basis.lean:29,162`), no
`Module.Projective` instance in `ExteriorPower/*.lean`; `subsingleton_of_span_eq_top_of_card_lt`
(`Basic.lean:418`), `zeroEquiv`, `oneEquiv`, `map`, `alternatingMapLinearEquiv`, `ιMulti`;
`Algebra.Smooth` (`Mathlib/RingTheory/Smooth/Basic.lean:539`, formally smooth and
`FinitePresentation` as an algebra), `Smooth.flat` (`Smooth/Flat.lean:57`, an instance),
`FormallySmooth.projective_kaehlerDifferential` (field, `Smooth/Basic.lean:71`);
`KaehlerDifferential.linearMapEquivDerivation` (`Kaehler/Basic.lean:355`),
`span_range_derivation` (`:251`); `Module.FinitePresentation S Ω[S⁄R]`
(`Extension/Cotangent/Basic.lean:521`); `Derivation` requires `CommSemiring` and its header lists
bimodules as future work (`Derivation/Basic.lean:33,45`), so no bimodule derivation exists at the
pin; no `Koszul` definition in Mathlib (only comments in `LocalCohomology.lean` and
`RegularSequence.lean`); `Tor` only in `CategoryTheory/Monoidal/Tor.lean:44` (monoidal) and
`Rep.Tor` (`GroupHomology/Basic.lean:97`); `ChainComplex.linearYonedaObj`
(`CategoryTheory/Abelian/Ext.lean:56`, a plain `mapHomologicalComplex` of the linear Yoneda
functor, so precomposition with no sign, as §4.3 says); `HasExt.{v} (ModuleCat.{v} R)` for
`[Small.{v} R]` (`ModuleCat/Ext/HasExt.lean:27`, trivially satisfied in one universe);
`extMk`, `extMk_eq_zero_iff`, `extMk_surjective`, `extMk_comp_mk₀`
(`CategoryTheory/Abelian/Projective/Ext.lean:139,209,224,234`); `Ext.comp`
(`DerivedCategory/Ext/Basic.lean:128`); `Ext.eq_zero_of_projective`
(`Ext/EnoughProjectives.lean:97`); `Functor.leftDerived`, `isoLeftDerivedObj`
(`Abelian/LeftDerived.lean:105,109`); `DegeneraciesVanish`, `degeneraciesVanish_iff_QInfty_f_comp`
(`DoldKan/Degeneracies.lean:148,180`: `f` vanishes on degeneracies iff `QInfty.f n ≫ f = 0`, which
in `ModuleCat` identifies `im QInfty` with the degenerate submodule, as §2.1's route needs),
`PInfty`, `QInfty` (`DoldKan/PInfty.lean:53,59`),
`homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`
(`DoldKan/HomotopyEquivalence.lean:81`), `alternatingFaceMapComplex`,
`alternatingCofaceMapComplex` (`AlternatingFaceMapComplex.lean:161,343`),
`ExtraDegeneracy` (`ExtraDegeneracy.lean:74`); `Module.Projective.tensorProduct`
(`Module/Projective.lean:240`, `M ⊗[R₀] N` projective over `R` for `M` `R`-projective and `N`
`R₀`-projective); `TensorProduct.Algebra.module` (`TensorProduct/Basic.lean:565`, a `def`, not an
instance); `TrivSqZeroExt.algebra'` (`TrivSqZeroExt/Basic.lean:853`); `ModuleCat.Algebra.instLinear`
(scoped, `ModuleCat/Basic.lean:437`); `ModuleCat.restrictScalars` (`ChangeOfRings.lean:85`);
`ComplexShape.embeddingDownNat` (`Embedding/Basic.lean:226`, `n ↦ −n`); `MvPolynomial.pderiv`
(`PDeriv.lean:61`); `TensorPower.mulEquiv` (`TensorPower/Basic.lean:75`); `groupCohomologyIsoExt`
(`GroupCohomology/Basic.lean:202`). Tau Ceti: `BalancedTensorProduct` and `tmul`, `induction_on`,
`hom_ext` (`Balanced/Basic.lean:55,92,147,160`), `lid`, `rid` (`Balanced/Unit.lean:48,122`),
`outerFactors` (`Balanced/OuterFactors.lean:88`); `ChainComplex.kronecker`, `kronecker_homologyπ`,
`kronecker_naturality`, `kronecker_surjective_of_isSplitMono` (`Kronecker.lean:106,113,124,274`);
`extToHomology`, `exact_extToHomology_kronecker` (`UniversalCoefficient/Basic.lean:121,180`,
hypotheses `[Projective (X.cycles j)] [IsSplitMono (X.iCycles j)]` and `j + 1 = i`, as the README
states); `derivationLieAlgebra`, `innerDerivation` (`z ↦ LieAlgebra.ad z = ⁅z,−⁆`),
`derivationEquivDerivationLieAlgebra` (`Lie/Derivation/Basic.lean:118,272,352`);
`AInfinity.IsSuspension` (`AInfinity/Coderivation.lean:74`, through `MultilinearMap.suspend`,
`Graded/Shift.lean:369`, sign `(−1)^{suspExp}` with `suspExp = Σ (k−1−i) d_i = 0` on degree-zero
inputs: the README's "no sign" is right); `IsNonUnitalDGAlgebra.toAInfinityAlgebra`
(`AInfinity/Algebra/DG.lean:143`); and the Hochschild declarations of R01.

**Sources: the seeded sample and the Conventions**, each read at its line in the cache.
Conventions: Ginz05 line 404 (`ad m : a ↦ ma − am`, opposite sign to `δm`), 752 (`(a₁ ⊗ a₂ᵒᵖ)m = a₁ m a₂`),
965–966 (`m ⊗ (a₀ ⊗ ⋯ ⊗ a_n) = a_n m a₀ ⊗ ⋯`, the right structure `m·(a ⊗ op b) = b m a`),
973–976 (the boundary `b` with the three groups of terms and signs as displayed), 1055–1062
(`bm(a) = am − ma`, `bf(a₁,a₂) = a₁f(a₂) − f(a₁a₂) + f(a₁)a₂`, the general `δ`), 1339–1341 (cup
product), 1359–1363 (Gerstenhaber composition with sign `(−1)^{(i−1)(q−1)}`; index misprint,
Source issues), 1368 (identity (6.6.3), sign error, Source issues), 1373 (bracket
`f∘g − (−1)^{(p−1)(q−1)} g∘f`). 2.1: Ginz05 894–931 (reduced bar complex over a field, `Triv_n`,
`Ā = A/k`, Corollary 4.5.2). 3.1: Ginz05 941–953 (`HH₀(M) = M/[M,A]`), 1001–1030 (the matrix
commutators `[E_ij(a),E_jj(1)] = E_ij(a)`, `[E_ij(a),E_ji(1)] = E_ii(a) − E_jj(a)`). 3.2: 1066–1069
(`HH⁰ = {m | am = ma}`, `= Z(A)` for `M = A`). 3.6: 1088–1106 (product
`(a₁ ⊕ m₁)(a₂ ⊕ m₂) = a₁a₂ ⊕ (a₁m₂ + m₁a₂ + β(a₁,a₂))`, associative iff `dβ = 0`, isomorphic
extensions iff `β₁ − β₂` a coboundary, over a field so every extension is split), Remark 5.5.1 at
1107–1111 (unital extensions classified by the reduced complex). 4.1: 751–752, 934–947. 4.3:
1033–1062 (`Hom_{Aᵉ}(A^{⊗(n+2)},M) ≅ Hom_k(A^{⊗n},M)` through `ϕ(1 ⊗ a ⊗ 1)`), HKR62 284–298
(`Hom_S(X,A) = Hom_R(R ⊗_S X, A)`; a secondary cite, the commutative case). 4.4: Ginz05 984–988
(`HH^•(M) := Ext^•_{Aᵉ}(A,M)`), HKR62 337–351 (`T_R(A) ≅ Ext¹_S(R,A)` through `ζ ↦ ζ*`). 5.1:
Ginz05 1335–1341, HKR62 479–484 (the product on `Hom_S(Y,R)` induced by `γ`, value
`x₀ α(1 ⊗ x₁ ⊗ ⋯ ⊗ x_p ⊗ 1) β(1 ⊗ ⋯ ⊗ 1) x_{p+q+1}`). 5.3: HKR62 425–431 (the product on
`Ext_S(R,·)` through `X ⊗_R X`, independent of the resolution). 5.4: Ginz05 1348–1350 (cup product
identified with the Yoneda product, stated without proof), HKR62 479–484, 495. 7.1: HKR62 284–298
(the map `h` on cycles), 352–364 (`h₁` transported to `ζ ↦ (Σ x dy ↦ Σ x ζ(y))`, the README's
`h₁(D)(r₀dr₁) = r₀D(r₁)`). 7.5: Ginz05 2101–2156 (`alt` and `π`, `π∘alt = p!`), HKR62 509–521
(`A_p(T_R)`, the weak alternating condition), AV20 237–243 (`Ω^t → Ω^t` is `t!`). 7.6: HKR62 522
(Theorem 5.1: `K` a commutative ring, `R` a `K`-projective commutative `K`-algebra, `h*` an
`R`-algebra homomorphism), 301 (Lemma 4.1: `Tor_i` projective for `i < k` gives `h_i` bijective
for `i ≤ k`; its proof at 311–330 uses that `R ⊗_S X_i` is `R`-projective, which is where
`k`-projectivity of `R` enters), 495, 528–546, 548 (Theorem 5.2), AV20 70–74 (Proposition 1.2:
smooth `R` over any `k`, formality from projective homology), Ginz05 2086 (Theorem 9.1.3). 8.4:
HKR62 210 and 268–279, Ginz05 2187 (Lemma 9.3.1) — see R04. 8.5: see R04. Stacks: Definition
137.1 is Tag 00T2 (line 16920), Proposition 138.13 is Tag 00TN (line 17399). The locators the
README marks for the uncertified texts (Loday98, Weibel94, CE56, Ger63, Mat86) are section-level
and were not read; every statement that cites one of them also cites a certified source or is
proved by the stated route.

**Duplication by object.** `roadmaps grep` over main and the 459 open heads: "polyvector",
"Hochschild-Kostant", "HKR", "determinant cocycle", "antisymmetrisation" match nothing;
"Hochschild cohomology" matches only DGAInfinity, BanachAlgebras, ZigzagPreprojective Layer 7
(bimodule resolutions for zigzag algebras) and CStarAlgebras (bounded cohomology of Banach
algebras); "Yoneda product" matches ArithmeticGaloisDuality and ClassicalAdicEtaleCohomology
(Galois and étale cohomology, not the computation of `Ext.comp` on resolutions); "bar resolution"
and "square-zero extension" match only other objects (group cohomology, deformation theory).
Mathlib and Tau Ceti: no Hochschild complex of an algebra with bimodule coefficients, no bimodule
derivation, no Koszul complex, no `Tor` over a noncommutative ring, no `Module.Projective`
instance for exterior powers (grep at the pins above). The board packages index lists
AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory, none
related. Ownership against open pull requests whose files the brief does not give was not
checked.

**Shape.** 8 layers each with `### Examples` and `### Dependencies`; every definition has an API
list and at least three Checks; every theorem states its hypotheses in the sentence and has a
locator; no LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no
backticked name of this roadmap's own (`roadmaps resolve`: none found nowhere). `plan.json`:
8 layers, 37 targets, 4 suppliers, 1 gap with `needs`, `supplier`, `section`; every `target:`
reference points to an earlier target. Note (no change required): the plan's API names carry the
prefix `HochschildHKR.`; the package's namespace is `TauCetiRoadmap.HochschildHomologyAndHKR`.

**Elaboration.** Not applicable at the design stage (no `Suggested.lean`); this lane does not
elaborate. For the package stage: with R01 repaired, §6.1's dictionary for arities `n ≥ 1` and
§6.2's formula are statable against the pinned `TauCeti.AInfinityAlgebra.hochschildDifferential`
and `TauCeti.gerstenhaberBracket`; the headlines of §§2.1, 3.4, 3.6, 4.4, 7.6 and 8.4 are statable
on Mathlib carriers once the complexes of §§1.1–1.2 are defined with real bodies.

### Adversarial table

| Statement | Instances tried and values computed | Result | Change |
| --- | --- | --- | --- |
| Convention `b` | `A=M=k`: all faces identity, `b_n = Σ_{i=0}^n (−1)^i` = `1` (`n` even ≥ 2), `0` (`n` odd); `HH₀=k`, `HH_n=0`. `Mat₂(k)`: `b(E₁₂⊗E₂₁)=E₁₂E₂₁−E₂₁E₁₂=E₁₁−E₂₂`; with `m a_n` instead: `0`. Ginz05 973–976 agrees. | holds | — |
| Convention `δ` | `δm(a)=am−ma`; `δδm(a,b)=a(bm−mb)−(abm−mab)+(am−ma)b=0`; wrong last sign: `2(mab−amb)`; `m=E₁₁,a=E₁₂,b=E₂₂`: `mab=E₁₂`, `amb=0`, value `2E₁₂`. `A=M=k`: `δ^n = Σ_{i=0}^{n+1}(−1)^i` = `1` (`n` odd), `0` (`n` even); `HH⁰=k`, `HH^n=0`. | holds | — |
| `ad` versus `δ` | Ginz05 404 `a↦ma−am`; `δE₁₁(E₁₂)=E₁₂E₁₁−E₁₁E₁₂=−E₁₂`; `innerDerivation E₁₁ = ⁅E₁₁,−⁆: E₁₂↦E₁₂` (pin: `LieAlgebra.ad`) | opposite signs, same image | — |
| Cup product | `(∂_x∪∂_y)(x,y)=1`, `(∂_y∪∂_x)(x,y)=0`; reversed product is associative (`(x⋆y)⋆z = z(yx) = x⋆(y⋆z)`), its Leibniz defect at `x=E₁₁`, `g=id`, `(a,b)=(E₂₁,E₁₂)`: `g(b)ax=E₁₁`, `g(b)xa=0`, `g(a)bx=0`, `g(a)xb=E₂₂`, defect `E₁₁−E₂₂≠0` | holds | — |
| Suspension dictionary `Θ(δf)=(−1)^{n+1}[m,Θf]` | `n=0`: `m{Θx}(sa)=s(xa)+(−1)^{(−1)(−1)}s(ax)=s(xa−ax)`, `Θx{m}=0`, `Θ(δx)=s(ax−xa)` → sign `−1`. `n=1`: `m{Θf}=s(f(a)b+af(b))`, `Θf{m}=sf(ab)`, `[m,Θf]=m{Θf}−Θf{m}=Θ(δf)` → `+1`. `n=2`: `[m,Θf]=m{Θf}+Θf{m}=s(f(a,b)c−af(b,c)+f(ab,c)−f(a,bc))=−Θ(δf)` → `−1`. DGAInfinity square sign-free, `suspExp=0`. | holds at `0,1,2` | — |
| `Θ(f∪g)=(−1)^{p(q−1)}m{Θf,Θg}` | `(1,0)`: sign of `Θy` (deg `−1`) past `sa`: `−1`. `(0,1)`,`(1,1)`,`(2,1)`: `+1`. `(1,2)`: `Θg` (deg `1`) past `sa` (deg `−1`): `−1` = `(−1)^{1·1}`. | holds | — |
| Brace = Gerstenhaber composition | `Θf{Θg}` sign `(−1)^{|Θg|(i−1)|sa|}=(−1)^{(q−1)(i−1)}` = Ginz05 (6.6.2) | holds | — |
| 1.1 chains | `A=M=k`: without `d_n`, `b₁=id`, `HH₀=0`; `k[x]`: `b₁=0` | discriminating | — |
| 1.2 cochains | `Mat₂`: `Z⁰` = scalars (`E₁₁E₁₂−E₁₂E₁₁=E₁₂`) | holds | — |
| 1.3 functoriality | identity map gives identity; composition `ψφ` on pure tensors | holds | — |
| 1.4 long exact sequences | `A` flat: `−⊗A^{⊗n}` exact; `A` projective: `Hom(A^{⊗n},−)` exact; `k`-split: both | sufficient | — |
| 1.5 `R`-linearity | `b(rm⊗a)=(rm)a−a(rm)=r(ma−am)` needs `a(rm)=r(am)`; `Mat₂`: `E₁₁b(E₁₂⊗E₂₁)=E₁₁`, `b(E₁₂⊗E₂₁)=E₁₁−E₂₂`; first-factor action: `b(1⊗x⊗1)=x⊗1`, `x·b(1⊗1⊗1)=1⊗x`, `x⊗1≠1⊗x` | holds; commutativity needed | — |
| 2.1 normalised chains | `b(m⊗1⊗1)=m⊗1−m⊗1+m⊗1=m⊗1`; kernel of `M⊗A^{⊗n}→M⊗Ā^{⊗n}` = `Σ_j im(M⊗A^{⊗j}⊗k⊗A^{⊗(n−1−j)})` by right exactness = `Σ im s_j`; `A=k`: `Ā=0`; `b(1⊗x⊗x)=2x⊗x−1⊗x²` | holds, no flatness | — |
| 2.2 normalised cochains | `D(1)=2D(1)`; `δm(1)=0`; `g(1)=1`: `δg(1,1)=1−1+1=1` | holds | — |
| 3.1 `HH₀` | `Mat₂`: trace-zero spanned by the two commutator types; `HH₀≅k` | holds | — |
| 3.2 `HH⁰` | `Mat₂`: centre `k·1`; commutative: `A` | holds | — |
| 3.3 derivations | `k[x]`: `D↦D(x)` bijective, `Inn=0`; `Mat₂`: all inner; `id(1)=1≠0`; `TrivSqZeroExt` product `(a,m)(a′,m′)=(aa′,am′+ma′)` at the pin | holds | — |
| 3.4 `HH₁≅Ω¹` | `b(1⊗a⊗c)=a⊗c−1⊗ac+c⊗a` gives Leibniz for `a↦[1⊗a]`; inverses: `db↦[1⊗b]↦db`, `[a⊗b]↦a db↦a[1⊗b]=[a⊗b]` (§1.5 action); `k[x]/(x²)`: `Ω¹=R dx/(2x dx)`, dim `2` over `𝔽₂`, `1` over `ℚ`; `𝔽_p/ℤ`: `b₂=1`, `HH₁=0=Ω¹` | holds for all `R` | — |
| 3.5 twisted extension | cocycle at `(1,1,a)`: `f(1,a)=f(1,1)a`; at `(a,1,1)`: `f(a,1)=af(1,1)`; `(1,−f(1,1))(a,m)=(a,m)` both sides; `k[x]/(x²)`, `f(x,x)=1`: cocycle checked at `(x,x,x),(1,x,x),(x,1,x),(x,x,1)`, `t²=(0,1)`, `t³=(0,1·x)=0`, section `x↦t+ct²` squares to `t²≠0`; `k[x]`, `f(x,x²)=1`: `δf(x,x,x)=1`, `(x³,0)` vs `(x³,1)`; `f=δg`, `g(1)=1`: `f(1,x)=x`, `(1,0)(x,0)=(x,x)` | holds | — |
| 3.6 classification | section `a↦(a,g(a))` multiplicative iff `f=−δg`; `ℤ/4→𝔽₂` over `ℤ`: `C^n=𝔽₂`, `δ¹=1`, `δ²=0`, `HH²=0`, extension not `ℤ`-split; `HH²(k,M)=M/M=0` | `k`-split needed | — |
| 4.1 `Aᵉ` | `(E₁₂⊗op E₂₁)E₂₂=E₁₂E₂₂E₂₁=E₁₁`, other order `E₂₁E₂₂E₁₂=0`; `M⊗_{Aᵉ}A→M/[A,M]` balanced: `b(maa′)−(maa′)b∈[A,M]` | holds | — |
| 4.2 bar resolution | `b′h+hb′=id` on `B_n` (`n≥1`): `b′(1⊗a₀⊗⋯)=a₀⊗⋯−h(b′(a₀⊗⋯))`; on `B₀`: `b′(1⊗a₀⊗a₁)+hμ=a₀⊗a₁`; `h(x·(1⊗1))=1⊗x⊗1≠x⊗1⊗1`; `Aᵉ⊗_k A^{⊗n}` projective by `Projective.tensorProduct` | holds | — |
| 4.3 `Hom(B,M)≅C^•` | `(φ∘b′)(1⊗a₁⊗⋯⊗a_{n+1}⊗1)=a₁f(a₂…)+Σ(−1)^i f(…)+(−1)^{n+1}f(a₁…a_n)a_{n+1}=δf`; `linearYonedaObj` is signless at the pin | no sign | — |
| 4.4 `HH≅Ext` | `k=ℤ`, `A=ℚ`: `Aᵉ=ℚ`, both sides `0` in positive degrees (hypothesis sufficient, not necessary); degree one `a₀⊗a₁⊗a₂↦a₀D(a₁)a₂` = HKR62 489 | consistent | — |
| 4.5 Tor | `m⊗(a₀⊗⋯⊗a_{n+1})↦a_{n+1}ma₀⊗a₁⊗⋯⊗a_n` transports `b′` to `b` (`i=0`: `m′a₁`, `i=n`: `(−1)^n a_n m′`); left action as right action fails: `E₂₁E₁₂=E₂₂` vs `E₁₁` | holds | — |
| 5.1 cup | see Convention row; `(∂∪∂)(x,x)=1` though `[∂∪∂]=0` | holds | — |
| 5.2 Leibniz | `p=q=1`: `δ(f∪g)(a,b,c)=af(b)g(c)−f(ab)g(c)+f(a)g(bc)−f(a)g(b)c=(δf∪g−f∪δg)(a,b,c)`; `p=0`: `δ(x∪g)=δx∪g+x∪δg` | holds | — |
| 5.3 Yoneda via lifts | `q=0`: `extMk_comp_mk₀`, `s(p,0)=1`; the strict lift as a map to `Q[p]` needs the shift sign, so `s(p,q)` depends on `(p,q)` only | precise as stated | — |
| 5.4 cup = Yoneda | `p=1`, unsigned `F_i(a₀⊗⋯)=a₀f(a₁)⊗a₂⊗⋯`: `F₀b′=−b′F₁` on `a₀⊗a₁⊗a₂⊗a₃`, both `±(a₀f(a₁)a₂⊗a₃−a₀f(a₁)⊗a₂a₃)`; general `p`: inner terms collapse by `δf=0` to `(−1)^p a₀f(a₁…a_p)a_{p+1}⊗⋯`, so `F_i d=(−1)^p dF_{i+1}` and `f̃_i=(−1)^{pi}F_i` commutes strictly; `f̃_q≫g=(−1)^{pq}f∪g` | holds | — |
| 6.1 dictionary | rows above; `{f,g}` on `C¹` is `fg−gf`; `gerstenhaberBracket = F{g} − (−1)^{pq} g{F}` at the pin | holds | R01: cite the pin |
| 6.2 homotopy formula `g∪f−(−1)^{pq}f∪g=δf∘g+(−1)^q(δ(f∘g)−f∘δg)` | `(1,1)`: `δf∘g−δ(f∘g)+f∘δg=g(a)f(b)+f(a)g(b)`; `f=g=∂` on `k[x]`: `2∂a∂b=−δ(∂²)(a,b)`, Ginz05 (6.6.3) gives `−2∂a∂b`. `(1,0)`: both sides `yf(a)−f(a)y` (ten terms cancel). `(0,1)`: `x∘g=0`, both `g(a)x−xg(a)`. `(2,0)`: both `yf(a,b)−f(a,b)y` (eleven pairs cancel). `∂∪∂=−δ(∂^{[2]})`: `C(i+j,2)−C(i,2)−C(j,2)=ij` | holds | — |
| 6.3 chain comparison | `A=k`: both complexes `k` with alternating `0`/iso; `𝔽_p/ℤ`: classical `HH₂=0`, derived `𝔽_p` (RTM §1.10) | flatness needed | R02 |
| 6.4 antisymmetrisation | cycle for all commutative `R`: inner terms cancel in pairs, first term of `σ` against last of its shift (`sgn σ′=(−1)^{n−1}sgn σ`); `k[x,y]`: `ε₂(dx∧dy)=1⊗x⊗y−1⊗y⊗x`, `π₂ε₂=2dx∧dy`, over `𝔽₂` zero while pairing with `∂_x∪∂_y` is `1−0=1`; `k[x]/(x²)`: `Ω²=0`, `HH₂⊇ann(2x)≠0` | holds for all `R` | R03 |
| 7.1 duality | `F∘b` vs `r₀δf`: wrap term `(−1)^{n+1}r_{n+1}r₀f(…)` vs `(−1)^{n+1}r₀f(…)r_{n+1}`, equal for symmetric `M`; non-symmetric `k` (`x` acts `1` left, `0` right): `δm(x)=m≠0`, transpose of `b₁=0` is `0`; `h₁(∂_x)([1⊗x])=1` | symmetric needed | — |
| 7.2 duality lemma | `ℤ→2→ℤ`: `H¹(Hom)=ℤ/2`, `Hom(H₁,ℤ)=0`; induction: `Z_i` proj. and `H_i` proj. ⟹ `B_i` summand ⟹ `Z_{i+1}` summand of `X_{i+1}`; UCT with `Ext¹(H_{i−1},M)=0`; degree `0`: `Hom(X₀/B₀,M)` | holds | — |
| 7.3 `pairingDual` | `R²`: `det(e_j*(e_i))=1`; `P=0`: `⋀⁰=R`; `R^{(ℕ)}` over a field: `Σ e*_{2i}∧e*_{2i+1}` has infinite rank, finite sums `Σ f∧g` have rank `≤2m`; retract squares on `ιMulti`: `det((f_j∘p)(v_i))=det(f_j(pv_i))` | holds; finiteness needed | — |
| 7.4 polyvectors | `k[x,y]`: `τ₂(∂_x∧∂_y)(dx∧dy)=det I=1`; `𝔽₂[x]`: `∂∧∂=0`; `𝔽₂(u)[a]/(a²−u)`: `D(a²−u)=2aD(a)=0`, `Der=R∂`, `T²=0`; `n>d`: `⋀^n` of a `d`-generated module is `0` (`subsingleton_of_span_eq_top_of_card_lt`) | holds | — |
| 7.5 determinant cocycle | `⟨∂_x,∂_y⟩(x,y)=1`, `(y,x)=det[[0,1],[1,0]]=−1`; multiderivation ⟹ cocycle: the middle sum telescopes to `−a₁f(a₂…)+(−1)^n a_{n+1}f(a₁…a_n)`; `δ(D₁D₂)(a,b)=−(D₁aD₂b+D₂aD₁b)`, in char `2` equal to `det`; `h_n[D₁∪⋯∪D_n](ε^cl(…))=Σ_σ sgnσ Π_j D_j(r_{σ(j)})=det(D_j(r_i))`, `h_n[⟨D⟩]=Σ_σ sgnσ·sgnσ det=n!det`; `[⟨D⟩]=n![D₁∪⋯∪D_n]` by anticommutation of degree-one classes; injectivity from `τ_n` injective and `dr_i` generating `Ω¹` | holds | — |
| 7.6 HKR | `Ψ_n` well defined under the hypotheses because `h_n∘(ε^cl)^*` is injective and `det` is alternating (not from `2[D∪D]=0`, vacuous in char `2`); `𝔽₂[x,y]`: `[∂_x∪∂_y]≠0` (pairs to `1`), `[⟨∂_x,∂_y⟩]=0`; `ℤ[1/2]`: `ℤ[1/2]⊗ℤ[1/2]=ℤ[1/2]`, `C^n=ℤ[1/2]`, `δ` alternates `0`/`id`, `HH^n=0`, `Der=0`, not `ℤ`-projective (divisible by all `2^k`); inseparable: `Rᵉ=R[t]/(t²)` with `t=a⊗1−1⊗a` (`t²=2u=0`), resolution `⋯→Rᵉ→t→Rᵉ`, `Hom(−,R)` has zero differential, `HH²=R≠0`, `T²=0`; `k[x]`: `HH²=0`, `[∂∪∂]=0`; (5) from `⋀^n Ω¹=0` for `n>d` | holds; both hypotheses exercised | — |
| 8.1 regular sequence | `m=0`: `Rᵉ=k`, kernel `0`; `m=1`: `X−Y` nonzerodivisor in `k[X,Y]` (also for `k=0`); `k[x]/(x²)`: `t(x⊗1+1⊗x)=x²⊗1−1⊗x²=0`, `x⊗1+1⊗x≠0` | holds | — |
| 8.2 Koszul resolution | `m=1`: `0→Rᵉ→t→Rᵉ→R→0`; `d(e₁∧e₂)=t₁e₂−t₂e₁` from the degree `−1` derivation of §0.K.1; `R⊗_{Rᵉ}K` and `Hom(K,R)` have zero differential since `t_i↦0` | holds | — |
| 8.3 comparison `ι` | `j=1`: `b′(1⊗X_i⊗1)=X_i⊗1−1⊗X_i=t_i`; `j=2`: `b′(1⊗X₁⊗X₂⊗1−1⊗X₂⊗X₁⊗1)=X₁⊗X₂⊗1+1⊗X₁⊗X₂−X₂⊗X₁⊗1−1⊗X₂⊗X₁` and `t₁·(1⊗X₂⊗1)−t₂·(1⊗X₁⊗1)` gives the same four terms (outer action); `m=0`: identity | chain map | — |
| 8.4 polynomial basis | `ι*(∂_{i₁}∪⋯∪∂_{i_n})(e_J)=Σ_σ sgnσ Π ∂_{i_l}(X_{j_{σ(l)}})=det(δ_{i_l j_r})=δ_{IJ}`; `k[X]`: `HH₁=R[1⊗X]`, `HH¹=R[∂]` | dual bases | R04 (locator) |
| 8.5 Jacobian | `m=2`, `(X₁²,X₂)`: `det[[2X₁,0],[0,1]]=2X₁`, normalised `gX₁`; `m=1`: `g∂`; `𝔽₂`: `⟨∂₁,∂₂⟩=δ(∂₁∂₂)` coboundary | holds | R04 (locator) |

## Not verifiable

- Loday98, Weibel94, CE56, Ger63, Mat86: settled uncertified; cited by section-level locators,
  not read. Every target citing them also cites a certified source or gives its route.
- The closed form of the sign `s(p,q)` of §5.3 in Mathlib's `Ext.comp`: §5.3 states only that it
  is universal in `(p,q)` with `s(p,0) = 1`; tracing it needs the shift conventions of
  `Cocycle.equivHomShift`, which this review did not do.
- The general brace relation and the general-arity chain-differential signs `ν_n` of DGAInfinity
  Layers 0 and 8 are stated there in prose only (no pinned declaration for the multiple brace or
  the chains); the README records both as assumptions of its supplier contract.
- Ownership against open pull requests whose files the brief does not provide.

## Source issues

- **Error** in Ginz05 at identity (6.6.3), line 1368 (printed p. 29): the source says the graded
  commutator of the cup product equals `d(f∘g) − df∘g − (−1)^{deg f} f∘dg`; it should be the
  README's form `δf∘g + (−1)^q(δ(f∘g) − f∘δg)` (at `f = g = ∂` on `k[x]` the printed right side
  is `−2∂a∂b` against the left side `2∂a∂b`); affects a stated result.
- **Misprint** in Ginz05 at (6.6.2), line 1363 (printed p. 29): the source says the inserted
  argument block is `g(a_i, …, a_{i+q})`, which has `q + 1` entries; it should be
  `g(a_i, …, a_{i+q−1})`; affects nothing.
- **Misprint** in Ginz05 at the Hochschild boundary display of §5.2, lines 1049–1053 (printed
  p. 22) as it appears in the cached text: the middle sum carries no sign `(−1)^j`, while the same
  formula at lines 756–760 has it; it should read with `(−1)^j`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "917778b8983fb9dc9b760ff8cb69dd08cd723b0b", "job": "REV-DESIGN-HochschildHomologyAndHKR", "model": "fable", "worker": "chris-x19"} -->
