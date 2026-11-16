<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6905122492 -->
Red team round 1 pass a (claude) of d5abbd4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Kato's two-dimensional principle (§1.5) has no route and its inputs are unowned

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:532`–`546`, §1.5: "Prove: … Then
   the sequence … of residue maps and the sum is exact (Kato, Corollary, p. 145; Pop 2017, Theorem 2.1,
   p. 2097)", with "*Needs:* 1.1; ClassFieldTheory Layer 10; KTheoryFiniteLocalFields §§3.0–3.0a;
   MotivesAndAlgebraicCycles §0.5b; Stacks …".

   **Claim.** The four-term sequence is a target proved from those inputs.

   **Witness.** §1.5 gives no route. Kato's proof is deduced from higher class field theory
   (kerz_saito line 125–126: the dimension-two case is obtained from the class field theory of Kato–Saito
   and of Saito). No layer, no named supplier and no pinned declaration provides it:
   `roadmaps grep -i` for "higher class field", "two-dimensional local field", "curves over local fields"
   returns no roadmap on main or at any open head. The only source for the statement, kato_hasse, is
   uncertified.

   **Repair.** Add a route to §1.5 that uses inputs the roadmap already has, and state only what it proves:

   - *Global function field `k` (constant field `𝔽`).* `𝒳` is a regular proper surface over `𝔽` and `n` is
     invertible on it; the sequence is the Kato complex of `𝒳` with `Λ = ℤ/n`, and its exactness is
     `KH_2 = KH_1 = 0`, `KH_0 = ℤ/n` (Kerz–Saito, Theorem 8.1, p. 37, first alternative; kerz_saito
     line 1852–1861). For this, §1.3 must be stated for `Λ = ℤ/n`, `n` a prime invertible on `R`, in every
     degree `a` (it is now stated for `ℤ/2` and `a = d` only). This covers `n = 3` in characteristic two.
   - *Number field `k`, `n = 2`, `μ₄ ⊆ K`.* Replace the exact sequence by the injectivity that §1.6(d)
     consumes: "every nonzero `α ∈ H³(K, ℤ/2(2))` is nonzero over the henselization at some `x ∈ 𝒳₁`".
     Route: §1.2 with `d = 2` gives a place `v` of `k` with `α_v ≠ 0` (no real place, `k ∋ √−1`); `v` is
     finite; `𝒳 ×_{O_k} O_v^h` is regular, projective and flat over the excellent henselian `O_v^h`, and
     Kerz–Saito, Theorem 8.1 with `a = 2`, gives a codimension-one point with nonzero residue: by the
     first alternative when `v` is non-dyadic (this is §1.3), and by the second alternative when `v` is
     dyadic (`X` projective and condition `(G)_{ℓ,a−2}`, which holds for `a ≤ 4`; kerz_saito line 1862).
     That point lies over a point `x ∈ 𝒳₁`, and `K_x^h` embeds in its henselization. State the dyadic
     case as a second item of §1.3 (projective `X`, `ℓ = 2` equal to the residue characteristic, `a ≤ 4`).
   - If §5.6(a) uses exactness in the middle of the sequence for a number field (Pop 2017, Lemmas 3.3
     and 3.6), keep that part as a separate target and name its inputs as targets of Layer 1 with
     locators (class field theory of two-dimensional local fields and of curves over local fields), or
     declare a supplier gap for it with a named supplier; the complex property (composite zero) is formal.

   Tested on the instance: `K = ℚ(i)(t)`, `α = (a) ∪ (b) ∪ (c) ≠ 0`. §1.2 gives a finite place `v` of
   `ℚ(i)`; at `v = (1 + i)` the first alternative of Theorem 8.1 does not apply (`2` is not invertible),
   the second does (`a = 2 ≤ 4`, `ℙ¹` over `ℤ[i]_{(1+i)}^h` is projective); no class field theory of
   two-dimensional local fields is used.

2. **F02** (P2) §1.4 in characteristic two, `d ≤ 3`: the cited theorem is conditional and the route does not cover the case

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:519`, §1.4: "every such `X`
   detects in degree `d + 1` … (… Jannsen, Theorem 0.6 of arXiv v2 …)" and "for `d ≤ 4` and a given smooth
   projective `X`, the vanishing is also known unconditionally (Jannsen, p. 5)". Consumers: Conventions
   (`H_d`, line 41), §§3.1, 5.3 (Check at line 1019), 5.7, 6.9, 7.6, 8.5 and the three Lean headlines with
   `ringChar K ≠ 2 ∨ d ≤ 3`.

   **Claim.** For `char K = 2` and `d ≤ 3` the detection statement is unconditional, by Jannsen's theorem
   and route.

   **Witness.** Jannsen's Theorem 0.6 assumes resolution over the field (jannsen_hasse line 191–192), and
   that hypothesis is `(RS1)` and `(RS2)` for all varieties, with no bound on the dimension
   (jannsen_hasse line 1889–1897); the route quoted from the proof of Theorem 5.10 runs under it
   (line 2176–2178). The unconditional statement appears there only as a one-sentence report of another
   paper (line 195–197), which the manifest does not record. Dittmann–Pop attribute dimension two to
   Kato and dimension three to Suwa, p. 270 (dittmann_pop line 213–214). Instance: `K` of characteristic
   two with `δ(K) = 3`, `X` the Cossart–Piltant model: `(RS2)_{𝔽₂}` is not known, so Theorem 0.6 does not
   apply to `X`.

   **Repair.** In §1.4 split the statement by dimension:

   - "For `d ≤ 3` the vanishing is Kerz–Saito, Theorem 8.1, p. 37, under its second alternative: `X`
     regular connected and projective over the finite field, `Λ = ℤ/2` with `ℓ = 2` the characteristic,
     and condition `(G)_{2,a−2}`, which holds for `a ≤ 4` (kerz_saito line 1852–1862; for `ℓ` equal to the
     characteristic the coefficients are the logarithmic de Rham–Witt groups, line 784 and 1846). With
     `a = d ≤ 3` it gives `KH_d(X, ℤ/2) = 0` with no resolution hypothesis beyond the existence of the
     projective regular model. Dittmann–Pop (p. 5) attribute `d = 2` to Kato and `d = 3` to Suwa."
   - "For `d > 3`, under `RS(𝔽₂)`: Jannsen, Theorem 0.6 of arXiv v2 …" with the present route.
   - Delete "for `d ≤ 4` and a given smooth projective `X`, the vanishing is also known unconditionally
     (Jannsen, p. 5)".
   - Add to the *Needs:* of §1.4, for `d = 3`, the input of that alternative: `(G)_{2,1}` (kerz_saito
     line 1562–1566), a prime-to-2 alteration, or a sequence of blow-ups, of a regular projective
     threefold over `𝔽₂` after which a given closed subscheme of dimension at most one becomes an
     admissible simple normal crossings divisor; state it as a target of Layer 1 or request it from a named
     supplier as a gap. For `d = 2` the subscheme is a finite set of closed points and blowing them up
     suffices. Add the Kerz–Saito locator "Theorem 8.1, second alternative; condition `(G)`, §6, p. 30" to
     the References entry.

   Tested on the instance: `K` of characteristic two with `δ(K) = 3`, `X` projective regular over `𝔽₂`
   (Cossart–Piltant, cossart_piltant line 162–167): `a = 3 ≤ 4`, the second alternative applies, and
   `H⁴(K) → ⊕ H³(κ(x))` is injective without `RS(𝔽₂)`.

3. **F03** (P3) Poonen's Theorem 1.2 is listed in the References but is no target

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1448`: "poonen_uniform — …
   Theorems 1.1–1.4, 2.2, 2.3 …".

   **Claim.** The roadmap uses Theorems 1.1–1.4 of that paper.

   **Witness.** Theorem 1.2 there (poonen_uniform line 49–50: one formula defines the prime field in
   every infinite finitely generated field) is cited by no section of the README; §§0.10, 0.13 and 0.14
   state Theorems 1.1, 1.3 and 1.4 only.

   **Repair.** Either change the entry to "Theorems 1.1, 1.3, 1.4, 2.2, 2.3", or add the target after §0.13:
   "### 0.13a The prime field. Prove: there is one formula defining, in every infinite finitely generated
   field, the prime field (Poonen, Theorem 1.2, p. 2, and its proof, p. 11): in characteristic zero the
   fraction field of the `ℤ` of 0.7(3) inside `κ`; in characteristic `p` the intersection, over the
   members `L` of 0.12(d) and `x ∈ L ∖ κ`, of the rings `𝔽_p[x]` of 0.7(5), which is `𝔽_p`. Check: in
   `𝔽₉` no formula uniform in `q` defines `𝔽₃`, which is why finite fields are excluded. *Needs:* 0.7, 0.12,
   0.13." If the target is added it is statable at the pins (`x ∈ (⊥ : Subfield K)` under `[Infinite K]`).

Three findings: one P1, one P2, one P3. Both blocking findings are in Layer 1 and concern proof inputs,
not the truth of the headline statements. No finding of the last repair report was marked
`not actionable in this package`, so nothing is re-raised.

Dependency check (run on the head, unchanged files):

```text
depcheck: 239 roadmaps, 2265 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Adversarial pass: record

Lean declarations (10). Elaborated types were read from the worker's `signatures.md` (no Lean was run
in this pass, as the brief forbids builds; the file was not changed, so no `#check` rerun was needed);
each was compared with its README statement and no binder is lost.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `kroneckerDimension` | `𝔽₉`, `ℚ`, `ℚ(s,t)`, `𝔽₂(s,t,u)`, `ℚ̄` | `0+0`, `0+1`, `2+1`, `3+0`, `0+1` (not `Field.FG`) | agrees with README §0.1 |
| `IsGeometricPrimeDivisor` | `ℤ_(p) ⊂ ℚ`; `t`-adic in `ℚ(t)`; arc valuation on `ℚ(s,t)`; `⊤` | residue char `p ≠ 0`; `1+1 = 2`; `1+1 ≠ 3`; not a DVR | excludes each wrong model |
| `exists_sentence_kroneckerDimension_eq` | `n = 0` (`𝔽_q`); `n = 1` (`ℚ`, `𝔽₃(t)`) | `m = 0`: `⟨1,−b⟩` anisotropic; `m = 1`: 4 > 2 and 6 > 3 variables, isotropic by `C₁`; `𝔽₉(t)`: `(1+i)⁴ = −1`, `t̄⁴⁰ = −1` | true |
| `exists_sentence_charZero` | odd `p`, `p = 2`, empty `Z` | `s = 2·((p+1)/2)s`; `2 = 0`; `∅ = 2∅` | false in every positive characteristic; second conjunct needs no `Field.FG`, as in poonen_uniform line 47–48 |
| `exists_formula_isAlgebraic_primeField` | `𝔽₉`, `𝔽₉(t)`, `ℚ(t)` | empty intersection `= K`; `𝔽₉`; `ℚ` | true |
| `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1`; `(s, s²)` | empty tuple independent, formula `⊥`; same set as constants; dependent | true |
| `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `d = 1` number field and `𝔽_q(t)`; `d = 2`, `ℚ(t)` with `ℤ_(p)[t]_{(p)}`; `d = 2`, `k₁` not smooth | no DVR; no geometric divisor (residue char `p`) and all places; residue `𝔽_p(t)`, char differs; a proper valuation ring containing `k₁` is still a place of `K/k₁` | true; rests on R02 for `char 2`, `d = 3` |
| `exists_formula_arithmeticNormalization` | `(d,e) = (1,0)` `ℚ`; `(1,1)` `𝔽_q(t)`; `(0,0)` `𝔽₄`; `𝔽₂(t)`, `T = (t²)`; mismatched `e` | `ℤ`; `𝔽_q[t]`; `𝔽₄`; `𝔽₂[t]`; hypothesis false | true |
| `exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain` | `B = 𝔽₉`; `B = ℤ` against `ℤ[i]`, `ℤ×ℤ`, zero ring | `θ₉`; not isomorphic, sentence fails | true (akns line 959–961) |
| `exists_sentence_realize_iff_nonempty_ringEquiv` | `K = 𝔽₄`; `K = ℚ`; `char 2`, `δ = 4` | `θ₄`; `inv`-expansion generated by `∅`; excluded by `hK` | true; hypothesis equals dittmann_pop line 44–46 |

README targets (all 74 numbered sections read; rows for those with computed instances):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.2 Abhyankar bound | mixed and equal characteristic | `trdeg(Kv/𝔽_p) + rr(vK/vℚ) ≤ δ − 1`; equality forces `vK ≅ ℤ` | sound |
| 0.5 Check (inseparable residue) | `t² = s` over `𝔽₂(s)` | a coefficient field would give `(t − ρ)² = π`, value `1/2` | sound |
| 0.6(a) cubic descent | `X³ + sY²Z`, `P = (r,1,r)` | `r³ + sr = 0`; `f = Y(Y² + sX²)`; `q(0,1,0) = 0` | sound |
| 0.6(c) | finite, `n = r+1`; number field, `n = r+2`; `ℚ` without `√−1` | `2n_k^{r+1} > n_k^{r+1}`; `(r+3)`-fold Pfister, `cd₂ ≤ r+2`; `8⟨1⟩` anisotropic | sound |
| 0.6(e) Check | `π = u² + s`, `X³ + r²Y³` | `3 ∤ 2`; block values `0,1,2 mod 3` | sound |
| 0.10(b) | `ℚ` without `√−1` | positive slots, definite at `ℝ` | hypothesis needed, stated |
| 0.11 Checks | `y² + xy = x³ + 1`, `y² + y = x³` over `𝔽₂` | 4 points, trace `−1`; 3 points, trace `0` | sound |
| 0.12 Checks | `y² = x³ + x + 1` over `𝔽₅`; `t = s²`, `b = 0`; `P₀ = (2,1)` | 9 points, trace `−3`; `4s² + s² = 0`; `z(P₀) = 3`, `b = 1`, derivative `2` | sound; the two corrections to the source are needed |
| 1.1 Check | `(−1,−1)` over `ℚ(√5)` | `2` inert, invariant `2·½ = 0`; two real invariants `½` | sound |
| 1.3 Check | `F = 𝔽₃(t, b³)` | `b` purely inseparable over `Frac(R)`, in the completion | sound |
| 2.1 Check | `(21,−1)`, `(7/3,−1)` | `21 ≡ 5 mod 8 = 1 + 4`; `v₃(7/3) = −1`, odd, not a norm from `ℚ₃(i)` | sound |
| 2.4 Check | `a₀ = 3`, `a₁ = 145` | `145 = 5·29 = 2·72 + 1`; `3` nonsquare mod `5` | sound |
| 2.5 separability | purely inseparable top | `e = 1` from `w(u_d) = 1`, `f = 1` from separable residue, so `p^m = 1` | sound |
| 3.5 | `w̃(a_d) < 2w̃(θ_N)` | `a_d = (α_Nθ_N)²(1 − 1/α_N)` | sound |
| 3.7, 3.4, 3.2 use of the dimension theorem | folds `2`, `d`, `d+1` over fields of dimension `1`, `d−1`, `d` | each is `r + 1` as QuadraticFormInvariantsPartII §6.5 requires | sound |
| 4.2, 4.7 | `Stab({1})`, `Stab(ℤ ∪ ℤ√2)` | `{1}`; contains `√2` (`√2·ℤ√2 = 2ℤ`) | sound |
| 4.6 | `2w_L(τ) ≤ w_L(a_d)` | `(a_dβ/τ)²(1 − 1/β) = a_d` | sound |
| 5.1 Checks | `⟨1,−3,−5,15⟩` | `(5,3)₂ = 1`, `(5,3)₃ = (2/3) = −1` | sound |
| 5.5 | `𝔽₂(t)`, `n = 3` | `v_t(3) = 0`, threshold `0`; printed `2v(6) = ∞` | correction needed, made |
| 5.6 Check | `𝔽₅(s)`, `b′ = 2s` | `a(Q) = −1/3 = 3 ≠ 0` | sound |
| 6.5 | flags | each rank-one step drops `trdeg` by exactly one, total `e` | "equivalently" sound |
| 7.3 Check | `ℤ[√5, t]` | core `ℤ[√5]`, conductor contains `2` | sound; source gap confirmed |
| Conventions, `c = (1 − a₀)/4` | `x² + xy + cy²` | `(x + y/2)² − a₀(y/2)²` | sound |

## Verified sound

- Declarations read: 10 of 10 in `Suggested.lean` (2 definitions with real bodies, 8 `sorry`'d theorems);
  single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, a docstring on each, module
  docstring names the two not-statable groups. No declaration is padding: each is an end theorem of a
  cited paper. The Layer 1 principles and Rumely's definitions are inputs of the route, not end theorems;
  their statable content (ring of integers of a number field, places of a global function field) is the
  `d = 1` case of two stated headlines.
- Targets read: all 74 numbered sections of the README, with Conventions and supplier contracts.
- Pinned declarations checked at the pins (20): `Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`,
  finite subset with subfield closure `⊤`; no finiteness over a base is included), `Algebra.trdeg`,
  `FirstOrder.Ring.CompatibleRing`, `compatibleRingOfRing`, `FiniteField.ringEquivOfCardEq`,
  `ValuationSubring.ofPrime`, `LocalSubring.exists_le_valuationSubring`, `QuadraticMap.Anisotropic`;
  Tau Ceti `Scheme.Hom.exists_finite_isSeparable_comp_eq`, `ValuationSpectrum.patchTopology`,
  `compactSpace_patchTopology`, `isClopen_patchTopology_basicOpen`, `Place` (surjective `ℤᵐ⁰`-valued,
  trivial on `k`), `Place.integers`, `Place.ord` (`ord_zero : P.ord 0 = 0`),
  `Place.exists_ne_zero_forall_mem_ord_eq`, `Place.exists_forall_mem_valuation_sub_le`
  (`≤ exp (r P)`, no function-field hypothesis), `Place.exists_ord_eq_neg_and_forall_ne_ord_nonneg`
  (`IsFunctionField`, `IsIntegrallyClosedIn`, `2g ≤ n`),
  `Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers`, `AbelianVariety.IsAlbanese`.
- Sibling citations checked at main or at the open heads (27 roadmaps; every section citation of the Scope and supplier-contract lists, and 12 names):
  every cited section exists, including LocalFieldsRamificationPartII §1.3 and §5.2 (bold run-in
  headings) and AdicCoefficientsAndComparisonsPartII §§PA.6.8, PA.6.10 (headed 6.8, 6.10 in Layer PA.6).
  Names found where cited: `anisotropic_extendScalars_of_odd_finrank`,
  `ModuliDescent.polarizedDescentComparison`, `arithmetic_normalization_genericallyEtale`,
  `ArithmeticCoefficients.valuation_prolongation_integrality`, `…root_coefficient_descent`,
  `field_cohomological_dimension_transcendence`, `NaturalIntegration.properAlbanese_exists`,
  `SieveLangWeil.lang_weil_uniform`, `hasDirichletDensity_frobeniusPrimeSet`, `cyclicHasseNorm`,
  `weakApproximation_denseRange`, `denseRange_algebraMap_finiteAdeleRing`. The five names of
  `scratch/citations.md` are roadmap targets, found in their roadmaps. QuadraticFormInvariantsPartII
  §§6.3, 6.5, 7.2 and LefschetzPencilsAndVanishingCycles §3.5 say what the contracts say.
- Declared gaps (4): same slugs in `design/plan.json` and in the README; each names a supplier and a
  section; none asks for something present (LogicAndDefinabilityInNumberTheory has no homotopy or
  bi-interpretation; ArithmeticGaloisDuality §R02.3.2 states no Hasse norm theorem for function fields;
  the descent theorem of LefschetzPencilsAndVanishingCycles §3.5 gives a finite extension only).
- Ownership: no roadmap on main or at an open head states bi-interpretability with `ℤ`, Rumely's or
  Poonen's uniform definitions, the Kerz–Saito or Kato principles, or the Albanese torsor of a variety
  over a general field (`roadmaps grep`, by object). JacobianChallengePartII §§2.1, 2.6 own only the
  section-free Abel map of a curve. The Kronecker dimension is QuadraticFormInvariantsPartII §5.7's and
  is cited as such.
- Locators verified against the cached texts (37): dittmann_pop line 44–46, 52–54, 59–63, 66–77,
  143–159, 177–225, 674–683, 694–732; poonen_uniform line 47–57, 153–170, 323–327, 383–386, 420–469,
  594–602; akns line 92–96, 581, 903, 931, 959–961, 1074–1082; pop_eei2 line 120–127, 258–266, 475, 734;
  kerz_saito line 95–96, 105–116, 699, 1562–1566, 1852–1862; jannsen_hasse line 180–197, 1889–1897,
  2176–2178; cossart_piltant line 162–167; rumely line 22–32; wittenberg_albanese line 1030–1037;
  achter_casalaina_vial line 46–77; stacks line 2112–2114 (tag 056V).
- Checks tested: all 244 Check bullets read; those carrying an explicit computation (about 60) were
  recomputed, and the table above shows the values; none false, none vacuous; every definition has at
  least three.
- Policy: the pull request changes only the package folder; no pull-request number or process word in
  the README or the Lean file; every target has a locator; no machine path in `sources.toml`.

## Not verifiable

- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: uncertified, cited by locator only.
- Stacks, Commutative Algebra and Resolution of Surfaces (tags 00NP, 00NQ, 00PD, 00TT, 031T, 032A, 0C0S,
  0BGP, 0ADX): the cached text of `stacks` is the Varieties chapter only, so these section numbers were
  not read.
- Published numbering of jannsen_hasse and of poonen_uniform: only the arXiv versions were read; whether
  the published Lemma 4.8 of Poonen corrects the two points below is unknown.
- Whether §5.6(a) needs exactness in the middle of Kato's sequence (R01): Pop 2017, Lemmas 3.3 and 3.6
  were not read line by line.
- waterhouse Theorem 4.1 and serre_albanese Théorème 5: the scans were not matched to the statement.
- Truth of the Lean statements beyond the instances above: no Lean was run.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, pp. 9–10 (arXiv v1): the source takes the sums of two values of `y/x` inside `K` and tests the form over `K`; it should take them in the quadratic extension `K_u` and test there, since in odd characteristic only `0` lies in `K`; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10 (arXiv v1): the source says the pullback of `x` by a separable endomorphism has a simple pole at a kernel point; it should be a double pole, so `y/x` is the function to use; affects the proof.
- **Misprint** in pop_eei2 at Notation/Remarks 3.5, p. 2102, and Recipe 5.1(1), p. 2109: the source bounds `v_s(β − 1)` below by twice the value of `2n`; it should use `n` when the characteristic is two (`n = 3`), where `2n = 0`; affects a stated result.
- **Misprint** in dittmann_pop at proof of Proposition 5.1, p. 16: the source indexes the composite valuations by the rank-one set of geometric prime divisors containing `T`; it should be the set of geometric prime `e`-divisors; affects nothing.
- **Gap** in akns at proof of Theorem 3.1, p. 23: the source says the definable one-dimensional subring, being finitely generated, is a Dedekind domain; it should first be localized at a conductor element (`ℤ[√5]` in `ℤ[√5, t]`); affects the proof.
- **Gap** in jannsen_hasse at Theorem 0.6 and p. 5: the source reports the unconditional vanishing in degrees at most four as a result of another paper; it should be cited from a text that proves it (R02); affects nothing.

Source independence: 20 passages compared with 8 sources (dittmann_pop, poonen_uniform, akns, pop_eei2, kerz_saito, jannsen_hasse, cossart_piltant, achter_casalaina_vial), none shared beyond forced mathematical phrases (longest run 6 words, "is a simple normal crossings divisor", dittmann_pop line 209); largest share dittmann_pop, 59 of 157 locators; contents compared with dittmann_pop (§§1–5): independent — Layer 0, §§5.4–5.6 and §§7.1–7.4 have no counterpart there, its §3 is split over Layers 2–3 and its §4 over Layers 4–5, and the order of Layers 1 → 8 is forced by the *Needs:* lines (3.1 needs 1.2–1.4; 4.6 needs 3.8; 5.2 needs 4.7; 6.4 needs 5.7; 7.6 needs 6.9; 8.5 needs 7.6); no table, figure or list is taken over.

## For the human reviewers

- **Licence.** `sources.toml` records `achter_casalaina_vial` with year 2026 (Annales de l'Institut Fourier 76); only arXiv:2210.05017v3 was read, and its numbering was not compared with a published version.
- **Not tested.** The Stacks chapters Commutative Algebra and Resolution of Surfaces, 11 of 21 Stacks locators, are not in the cached text of `stacks`; wording and numbering were not compared for them.
- **Scope.** §1.4 for `d ≤ 3` and §1.5 depend on results whose proofs lie in works the manifest does not hold (Suwa 1995; Kato 1986, uncertified); R01 and R02 propose routes through kerz_saito instead.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d5abbd4d133e896c70ac70295d8790b5d2d6bf45", "job": "RT-LogicAndDefinabilityInNumberTheoryPartII~1a", "model": "fable", "worker": "chris-x79"} -->
