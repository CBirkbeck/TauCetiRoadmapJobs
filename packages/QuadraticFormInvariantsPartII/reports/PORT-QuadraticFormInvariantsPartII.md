# PORT-QuadraticFormInvariantsPartII

- Branch: `roadmap/quadratic-form-invariants-part-ii`, head `04296f6a` (one commit on `3b51055`,
  message `QuadraticFormInvariantsPartII: roadmap (README, Suggested.lean, metadata)`). Files:
  `TauCetiRoadmap/QuadraticFormInvariantsPartII/{README.md,Suggested.lean,metadata.toml}`; nothing
  outside the folder.
- Build: `lake build TauCetiRoadmap.QuadraticFormInvariantsPartII.Suggested` ends with
  `Build completed successfully (9156 jobs).` (`⚠ [9156/9156] Built TauCetiRoadmap.QuadraticFormInvariantsPartII.Suggested (12s)`).
  19 warnings, every one `declaration uses \`sorry\``; 0 errors; 0 other warnings.
- Gate: `gate QuadraticFormInvariantsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`gate --depcheck … --movable`), full output: `depcheck: 230 roadmaps, 2177 edges, 0 problem(s)`.
  It shows no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap continues QuadraticFormInvariants beyond the point where it stops: that roadmap works
throughout with `2` invertible, has Pfister roundness only up to fold two, and has Galois cohomology
only in degrees one and two. Starting from Tau Ceti's Witt ring, Pfister classes, Kummer classes and
all-degree cup products, and Mathlib's quadratic maps, it builds the rest. That means, in every
characteristic: nonsingular forms and the quadratic Witt group as a module over the bilinear Witt
ring with its filtration `I_qⁿ`, quadratic Pfister forms, roundness, and isotropy equivalent to
hyperbolicity. It then proves Cassels–Pfister, the representation theorem, Springer's theorem, the
similarity theorems, the function field of a quadric, the subform theorem and the Arason–Pfister
Hauptsatz. Next come the graded invariants: the Milnor conjecture for the Witt ring (Morel) when `2`
is invertible, Kato's comparison with logarithmic differential forms in characteristic two, the
invariant `eₙ` of a Pfister form, and the criterion that `eₙ(ρ) = 0` exactly when `ρ` is isotropic.
The last part applies this to henselian valued fields of finite Kronecker dimension: unit
reduction, the principal-unit and independent-value criteria, `C_i` fields with the Tsen–Lang and
Lang–Nagata theorems, coefficient fields, the uniqueness of real closures and Jannsen's Hasse
principle in the degree needed. It ends with Dittmann–Pop's theorem that a unit Pfister form of
fold `dim K + 1` over a henselian field is isotropic once it is isotropic at the real closures of
the constant field, and with the patch openness of henselian isotropy loci. These are the
quadratic-form inputs of Dittmann–Pop's characterization of finitely generated fields, consumed by
LogicAndDefinabilityInNumberTheoryPartII; RealSurfacePeriodIndex consumes the Tsen–Lang theorem.
`Suggested.lean` states the 19 headline theorems that are statable at the pinned Mathlib and Tau
Ceti, each with `sorry`, together with the six definitions they need. Its module docstring names the headlines that are not statable at the pins (the
characteristic-two Hauptsatz and Kato's theorem, Milnor's original form of the Milnor conjecture,
and Jannsen's Hasse principle) and what each lacks.

(Count, for the worker's validation paragraph: 25 declarations, namely 6 definitions
`quadraticPfister`, `extendScalars`, `kummerSymbol`, `IsCi`, `kroneckerDimension` and
`constantField`, and 19 theorems, each admitted with `sorry`.)

## Roadmaps this one depends on that are still pull requests

GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories, K2SymbolsBrauer,
KTheoryFiniteLocalFields, MotivesAndAlgebraicCycles, ClassicalAdicEtaleCohomology,
AdicCoefficientsAndComparisonsPartII, DeligneWeightsAndPurity, ArithmeticGaloisDuality.
All of them are earlier in the merge order. LocalFieldsRamificationPartII (§§GF.1, GF.4, GF.5) is
also a supplier. It is earlier in the merge order, but it is neither on main nor an open pull
request: it exists only as a board design package, whose `design/README.md` I read to resolve the
three sections. The suppliers on main are QuadraticFormInvariants, ProfiniteCohomology,
ClassFieldTheory and SchemeAndStackFoundations, plus the completed AdicSpaces and
RealAlgebraicGeometry. The README also names three roadmaps without depending on them.
GeometryOfNumbersAndQuadraticArithmeticPartII appears in a Scope deferral only (later in the
order, an open pull request). LogicAndDefinabilityInNumberTheoryPartII and RealSurfacePeriodIndex
appear as downstream consumers (board packages).

## What moved from the Lean to the README, and what moved into the Lean

Nothing moved out of the Lean. The package's 24 declarations are its headline theorems plus the six
definitions they need, with real bodies on native carriers. None is padding or sorry'd data, so all
are kept with unchanged statements. One headline that is statable at the pins was absent, and is
added:

- `isOpen_setOf_forall_henselian_not_anisotropic` (README 7.2, Dittmann–Pop Lemma 3.9(2)). The
  package's docstring listed patch openness as not statable because there is no henselization.
  But isotropy over `F_w^h` is equivalent to isotropy over every henselian valued field `(L, O)`
  extending `F` whose valuative relation pulls back to `w`. `F_w^h` is one such field, in the
  universe of `F`, and by its universal property (LocalFieldsRamificationPartII §GF.1) it embeds
  over `F` into every other. This is the same device the file already uses for the residue fields in
  `quadraticSimilarity_tfae` and the function field in the subform theorem. The carriers exist at
  the pins: `TauCeti.ValuationSpectrum`, `TauCeti.ValuationSpectrum.comap`,
  `TauCeti.ValuationSpectrum.patchTopology`, Mathlib's `ValuativeRel.ofValuation`, `ValuationSubring`
  and `HenselianLocalRing`. Its import, `TauCeti.AlgebraicGeometry.AdicSpace.PatchPresentation`,
  exists at the pinned Tau Ceti. The docstring's not-statable list drops the patch-openness bullet,
  and its Jannsen bullet now says precisely what is missing: Tau Ceti's `galoisRes` covers finite
  extensions only.

Signature check, done mechanically: I appended `#check @…` for all 25 declarations to the module,
built it once with the allowed `lake build` command, saved the output, and then removed the lines
and rebuilt. Every elaborated type carries the binders its README statement has: `Invertible 2` on
the Witt-ring and Kummer statements, `FiniteDimensional`, `Nontrivial V` and `Nondegenerate` on the
Hauptsatz, `HenselianLocalRing O` on every valuation statement, `CharZero κ` on the section theorem,
and `O ≠ ⊤` with `kroneckerDimension K = r` on the dimension theorem. No section variable is used
(the file declares only universes). Nothing changed for the 24 kept declarations; the new
declaration's elaborated type is exactly the README 7.2 statement.

## Supplier replacements and duplication removals

1. **A gap declared on an archived roadmap is now a target here.** The package consumed the
   uniqueness of real closures as "What RealAlgebraicGeometry must provide
   (gap:real-closure-uniqueness)". RealAlgebraicGeometry is now under `Completed/`. Its Layer 1
   states only existence (`exists_realClosure`), and an archived roadmap takes no new targets, so the
   gap could never be filled. `roadmaps grep` finds no owner of real-closure uniqueness on main or in
   any open roadmap pull request. K3BlochGroups uses real closures inside a quantifier-elimination
   proof but states no uniqueness theorem. The pinned Tau Ceti has existence only
   (`TauCeti.RealClosure.exists_realClosure`, `FieldTheory/RealClosure/Basic.lean`). So the notion
   moves down as the new target **6.0 Real closures**. It covers the extension of order-preserving
   embeddings to a real closure, uniqueness up to a unique `k`-isomorphism, the real closure inside a
   real closed field, and the count of extensions by orderings (Kuhlmann, lecture notes 08,
   Proposition 1.3 p. 1, Proposition 2.1 and Theorem 2.2 pp. 2–3, Corollaries 2.3–2.6 pp. 3–4; read
   at the author's course page, a new `kuhlmann` entry in References, the same notes
   RealAlgebraicGeometry cites). Its route uses Tau Ceti's Sturm theorem
   `TauCeti.Sturm.card_roots_toFinset_univ` (`Algebra/Polynomial/Sturm/Infinity.lean`), and it comes
   with four Checks. The RealAlgebraicGeometry contract now cites the Tau Ceti declaration for
   existence; 6.4's route and *Needs*, 6.5's *Needs*, the Layer 6 Dependencies, Scope and "How to
   read the build" are updated to match.
2. **Restriction along arbitrary field maps.** The package said "restriction along a field extension
   is Tau Ceti's `TauCeti.galoisRes`" and used it in 3.1 and 3.8, and through them in 6.3 and 6.4,
   for infinite extensions (composita, `F → F_v`). At the pin, `galoisRes`
   (`FieldTheory/GaloisCohomology/Restriction.lean:84`) requires `[FiniteDimensional K L]` and a
   chosen `σ : L →ₐ[K] SeparableClosure K`. 3.1 now defines restriction along every field
   homomorphism as the pullback `TauCeti.trivialF2Map` along `G_E → G_F`, obtained from an extension
   `Fˢ → Eˢ` (Mathlib `IsSepClosed.lift`). It proves independence of the extension by
   `TauCeti.ContinuousCohomology.map_eq_id_of_inner` (inner automorphisms act trivially in every
   degree, `ContCohomology/InnerConjugation.lean:297`), agreement with `galoisRes` on finite
   extensions, and compatibility with Kummer classes (`TauCeti.galoisRes_kummerClass` in the finite
   case). 3.8 now uses `TauCeti.trivialF2Map_cup`. The Tau Ceti contract lists all five
   declarations with their files and says that `galoisRes` covers finite extensions only. The
   ProfiniteCohomology contract adds conjugation (Layer 10).
3. **Nullstellensatz.** 5.2 invoked "the homogeneous Nullstellensatz", which the pinned Mathlib does
   not have. The route now derives the needed form from Mathlib's
   `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`: if the origin were the only common zero, the
   radical would be the irrelevant ideal, of height `N > r`. The Mathlib contract names this
   declaration.
4. **Duplication sweep.** I searched by object with `roadmaps grep`, on main and at the heads of all
   446 open roadmap pull requests, and also searched the earlier board package
   LogicAndDefinabilityInNumberTheory. The objects searched were: Cassels–Pfister, Springer's
   theorem, Arason–Pfister/Hauptsatz, subform theorem, similarity and norm principles, Milnor
   conjecture, Kato's group or comparison, Ojanguren–Panin purity and unramified Witt groups,
   `C_i`/quasi-algebraically closed fields, Tsen–Lang/Lang–Nagata, Chevalley–Warning, Kronecker
   dimension, coefficient fields, Jannsen and Kato's conjecture, patch openness, quadratic Witt
   groups, real-closure uniqueness and Rost cycle modules. Every hit is either a cited supplier
   (HermitianKTheoryOfPoincareCategories' `W^q`, SchemeAndStackFoundations' `tsen_theorem`,
   MotivesAndAlgebraicCycles' Gersten complexes, ArithmeticGaloisDuality's duality) or an unrelated
   use of the same word. There were no duplicates, so nothing was removed and "Scope and ownership"
   records no new deferral.
5. **Ownership.** This roadmap is the owner of 6.0 because no roadmap on main, no open roadmap pull
   request, no board package I could read, and nothing at the pins states real-closure uniqueness,
   while 6.4 needs it. Ownership against open pull requests was checked through the `roadmaps` tool
   (all 446 heads) and the sibling checkouts the brief lists. No declaration of `Suggested.lean`
   takes the fully qualified name of a declaration in another roadmap.
6. **Citations.** The resolver (`roadmaps resolve … --packages` with the pinned Lake packages) finds
   every cross-roadmap citation. Its one Lean lead, `IsCi.exists_common_zero`, is this roadmap's own
   declaration (elaborated by `#check`): a false positive. I checked by hand the following, against
   main, the open heads, or the board design for LocalFieldsRamificationPartII:
   - HermitianKTheoryOfPoincareCategories §§3.4, 3.5, 4.5(iii) and 7.9(c);
   - GeometryOfNumbersAndQuadraticArithmetic §6.4 `ExactW0`;
   - K2SymbolsBrauer §§5.4–5.8, 5.12, 10.5–10.9 and 10.32;
   - KTheoryFiniteLocalFields §§3.0 (`blochGabberKato`) and 3.0a (`motivicToK`);
   - MotivesAndAlgebraicCycles §§0.5b, 4.1–4.6 and 4.14;
   - ClassicalAdicEtaleCohomology §11.2 `field_cohomological_dimension_transcendence`;
   - AdicCoefficientsAndComparisonsPartII §6.9;
   - DeligneWeightsAndPurity §§7.12 and 7.15;
   - ArithmeticGaloisDuality §§R02.4.2, 4.3, 4.5 and 4.6;
   - GeometryOfNumbersAndQuadraticArithmeticPartII §0.1;
   - ClassFieldTheory Layer 6 `cd_p_absoluteGaloisGroup_eq_two` and Layer 10 `eq_zero_of_localInv_eq_zero`;
   - SchemeAndStackFoundations §§0.12–0.14, 2.11, 2.15 and 2.16 with the named declarations;
   - AdicSpaces Layer 1 §§1.1–1.3;
   - LocalFieldsRamificationPartII §§GF.1 (valued henselization), GF.4 (rank-one decompletion) and
     GF.5 (`abhyankar-and-rank`).

   The parent's sublayers 7A and 7B are now cited as "Layer 7A" and "Layer 7B", as the parent itself
   names them. Every Tau Ceti and Mathlib name in the README was grepped at the pins (Tau Ceti
   `358314d4`, Mathlib `f6090c7`).

## Fixes from the upstream-reviewer read

- The gap on the archived RealAlgebraicGeometry is now target 6.0 (item 1 above).
- `galoisRes` was used beyond its finite-extension scope; restriction is now defined in 3.1 (item 2).
- The homogeneous Nullstellensatz was cited without a supplier (item 3).
- The patch-openness headline was statable but absent from the Lean (above).
- The 16 bare `API:` field labels are removed; the API bullets follow their paragraphs, as in the
  roadmaps on main.
- In the new 6.0 I first wrote a Check that was wrong: complex conjugation fixes the real algebraic
  numbers pointwise, so it is no example of a non-preserving automorphism. It now uses the
  automorphisms of `ℚ̄` sending `∛2` to a non-real cube root.
- The review's two non-blocking notes (F01: the redundant `ha₀` in the principal-unit criterion;
  F02: the monic lifting in 4.1) were already applied in the package. I verified both: the Lean
  statement has no `ha₀`, and 4.1 uses `y + x` to make the lifting quadratic monic. The review's
  decisions, including the conditional gap `rost-cycle-modules`, are kept.

## Adversarial mathematics pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `quadraticPfister` (def) | `m = 0`; `m = 2` with `2` invertible; first weight | `m = 0`: `x² + xy + a₀y²` on `F²`; `pfisterForm a 0 = 1` (recursion `1·1`), so it represents `1`; `m = 2`, `a₀ = (1 − b)/4`: `[1, a₀] ≅ ⟨1, −(1 − 4a₀)⟩ = ⟨1, −b⟩`, tensor `⟨1, −a⟩` gives `⟨1, −a, −b, ab⟩` = `pfisterForm_two` | holds | none |
| roundness `quadraticPfister_smul_equivalent_of_represents` | singular `m = 0`, `a₀ = 1/4`, `c = 4`; `𝔽₂`, `m = 0`, `a₀ = 0` | `(x + y/2)²` at `(2x, 2y)` gives `4(x + y/2)²`, so `4φ ≅ φ`; `𝔽₂` has only `c = 1` | holds without nonsingularity, as stated | none |
| `not_anisotropic_quadraticPfister_iff_equivalent_dualProd` | char 3, `a₀ = 1`; `a₀ = 1/4` with `2 ≠ 0`; dimensions | char 3: `1 − 4 = 0`, `x² + xy + y² = (x − y)²` singular, so excluded; `(x + y/2)²` isotropic at `(1, −2)`, not hyperbolic, so excluded; `dim dualProd = 2·2ᵐ = 2^{m+1}` | holds | none |
| `extendScalars` (def) | `[1, a]`; `L = K` | mixed term `x₀x₁` kept, value `x₀x₁` not `0`; `extendScalars Q K = Q` coefficientwise | holds | none |
| Cassels–Pfister | `n = 0`; `x²` on `ℚ²`; `⟨1, 1⟩`, `h = t² + 1` | `n = 0`: `h = 0`, `w = 0`; `h = v₁²` is a square in `ℚ(t)` and so in `ℚ[t]`; `(t, 1) ↦ t² + 1` | holds for arbitrary `Q` | none |
| representation theorem | `m = 0`; `n = 0` with `m ≥ 1`; `q = ℍ` | `m = 0`: both sides true; `n = 0`: LHS false, RHS false at `E = K`, `c = ψ(e₁) ≠ 0`; `ℍ` excluded by anisotropy | holds, matches EKM 17.12 (both anisotropic) | none |
| Springer | `[1, 1]`: `𝔽₈` vs `𝔽₄`; char 3, `⟨1, t⟩` over `𝔽₃(s)`, `s³ = t` | `x² + x + 1` irreducible over `𝔽₈`, split over `𝔽₄`; `−t = s²(−s)`, and `−s` is not a square | holds, inseparable case included | none |
| similarity norm principle | `k = 0`; `E = 𝔽₂(s)`, `s² = t`, `q = [1, 1]` | `k = 0` trivial; `N(c) = c²`, and `c = N(x, y)` gives `c² = [1, 1](x², y²)` with `x², y² ∈ F` | holds | none |
| `quadraticSimilarity_tfae` | `f = c` constant; `n = 1`, `f = t`, `q = [1, 1]` over `𝔽₂`; lex order | constant: (3) vacuous, `c·c ∈ G`, `a = c⁻¹`; `t ∉ D(q)` by degree parity and the residue field `𝔽₂` is not split, so all three are false; `f = 2t₁ + t₂²`: `(1, 0) > (0, 2)` in Mathlib's `Finsupp` lex (first index decides), so `f* = 2` = EKM p. 77 | holds | none |
| subform theorem | `m = 0, 1`; `ψ = [1, 1]`, `q = [1, 1] ⊥ t[1, 1]` | `ψ(T) = 0` and `cT₁²` are not irreducible, so vacuous; `L = 𝔽₄(t)(x)`, where `q` is hyperbolic, giving `ψ ⊆ q` with `a = b = 1` | holds | none |
| Hauptsatz (`2` invertible) | `n = 0`; `⟨1, 1⟩` over `ℚ`; `⟨1, 1, 1, 1⟩` | `n = 0`: `dim ≥ 1` by `Nontrivial V`; signed discriminant of `⟨1, 1⟩` is `−1`, a non-square, so it is not in `I²`, consistent; `⟨⟨−1, −1⟩⟩`: dimension `4 = 2²` | holds | none |
| `kummerSymbol` (def) | `n = 0`; degree bookkeeping | `kummerClass (a 0)`; `cup (n+1) 1` lands in degree `n + 2` (elaborated) | holds | none |
| Milnor conjecture `exists_addEquiv…` | `n = 0`; `n = 1` over `ℝ` | `⟨1, −a⟩ ↦ (a)`, and the signed discriminant of `⟨1, −a⟩` is `(−1)(−a) = a`; `⟨1, 1, 1, 1⟩ ↦ (−1) ∪ (−1)`, Hamilton quaternions, nonzero | holds | none |
| invariant-zero criterion | `n = 0`; `n = 1` over `ℚ` | `⟨1, −a⟩` isotropic iff `a` is a square iff `(a) = 0`; `⟨1, 1, 1, 1⟩` anisotropic and `(−1)² ≠ 0` | holds | none |
| principal-unit criterion | `ℚ₃`, `ε = 4`, `a₀ = 1/4`; trivial valuation; `ℤ_(3)`, `ε = 7` | `(x + y/2)² − 4(z + w/2)²` at `(2, 0, 1, 0)`: `4 − 4 = 0`; `O = K`, `ε = 1`, `(v, v)` gives `wq − wq = 0`; non-henselian `⟨1, 1, −7, −7⟩` is anisotropic over `ℚ` because `7 ≡ 3 mod 4` | holds; henselianity needed | none |
| independent-value TFAE | `𝔽₂((t))`, `π = (t)`; `π = (t²)`; trivial valuation | block orders even and odd, so anisotropic; `⟨⟨t²⟩⟩_b ≅ ⟨1, 1⟩_b`, so isotropic, and `hπ` fails since `v(t²)` is a square; trivial `Γ` forces `s = 0` | holds | none |
| `IsCi` (def) | `i = 0`; `𝔽₂`, `x² + xy + y²`; `Xᵈ` | `C₀`: `N ≥ 2` gives algebraic closedness; no zero over `𝔽₂`, so `𝔽₂` is not `C₀`; `N = 1 = d⁰` excluded | holds | none |
| Tsen–Lang | `t = 0`; `𝔽_p(t)` | `t = 0` reduces to algebraic extensions (EKM 97.5); `𝔽_p` is `C₁`, so `𝔽_p(t)` is `C₂` | holds without finite generation | none |
| Lang–Nagata | `r = 0, 1`; two quadrics over `𝔽_q` | `r = 0`: `N ≥ 1` gives a nonzero vector; `r = 1` is the definition; `N = 5 > 2·2` | holds | none |
| `kroneckerDimension`, `constantField` | `𝔽_p, ℚ, 𝔽_p(t), ℚ(t)`; `𝔽₄(t)`, `ℚ̄` | dimensions `0, 1, 1, 2`; constant fields `𝔽₄` and `ℚ̄`, versus the prime fields `𝔽₂` and `ℚ` | holds | none |
| `exists_residueSection_of_charZero` | `ℚ((t))`; `ℚ₂` | `σ = ℚ ↪ ℚ[[t]]`; residue char 2 is excluded by `CharZero κ` | holds | none |
| `quadraticPfister_equivalent_residueSection` | `m = 0`, `a₀ = t` over `ℚ((t))`; `a₀ = (1 − t)/4`; char 2, `𝔽₂((t))`; mixed `(0, p)` | `1 − 4t` is a square, so `[1, t] ≅ [1, 0]`; `1 − 4a₀ = t` is a nonunit, so excluded (`[1, 1/4]` singular); `z = t + t² + t⁴ + ⋯`, `z² + z = t`; mixed: `σ(p) = 0 ≠ p` in `O`, so no section, vacuous | holds | none |
| dimension theorem | `ℚ(x)^h`, `ε = (−1, −1)`, `a₀ = 1/2`; `r = 0` | `1 − 4a₀ = −1`, form `8⟨1⟩` anisotropic over the formally real `K` and over `K·ℝ_alg`, so hypothesis and conclusion both fail; `r = 0` forces `O = ⊤`, vacuous | consistent | none |
| `isOpen_setOf_forall_henselian_not_anisotropic` (new) | `q = ⟨1⟩`; isotropic `q`; `⟨1, 1⟩` over `ℚ`; trivial `w` | `⟨1⟩`: empty set, open; isotropic: all of `Spv F`; `⟨1, 1⟩`: contains `p ≡ 1 mod 4`, omits the 3-adic and trivial valuations (`ℚ^h = ℚ`); the universal property gives the equivalence with `F_w^h` | holds | added |
| 6.0 real closures (new) | `ℚ(√2)`; `ℚ(∛2)`; `ℝ` over `ℚ` | two orderings; the two real closures are not `k`-isomorphic (`√2` is a square in one only); `x³ − 2` has 1 real root, so 1 ordering; `ℝ` is not algebraic over `ℚ`, so not a real closure | holds (Kuhlmann 2.2–2.6) | added |
| 3.1 restriction (revised) | `F → E` finite vs infinite; change of extension `Fˢ → Eˢ` | finite case: `galoisRes_eq_map` is `trivialF2Map` along the subgroup, so they agree; two extensions differ by `g ∈ G_F`, which is inner, so `map_eq_id_of_inner` applies | holds | rewritten |
| 5.2 (revised) | `N = r`, `x, y`; `r = 0` | `x, y` have only the zero common zero (excluded); `r = 0`: the zero ideal, every point a zero | holds | rewritten |
| 4.1 lifting Check | `[1, t] ⊥ (1 + t)[1, t]`, `x = (1, 0, 1, 0)`, `y = (1, 1, 1, 0)` | `q(x) = t`, `q(y) = t + (1 + t) = 1`; `x + sy = (1+s, s, 1+s, 0)` gives `(1 + s + ts²) + (1 + t)(1 + s²) = s² + s + t` | holds | none |
| 0.x, 1.x, 2.x Checks | each value recomputed | e.g. `[1, 1]` over `𝔽₂` takes values `1, 1, 1`; `x² + xy + y² + z²` over `𝔽₂` has 4 zeros; `s_*⟨x⟩_b` Gram `[[0, −a], [−a, −aτ]]` is metabolic, so `s_*⟨⟨x⟩⟩_b = ⟨⟨a⟩⟩_b`; `3x² + 6y² = 1` at `(1/3, 1/3)`; `⟨⟨2, −1⟩⟩` and `⟨⟨−1, 2⟩⟩` vanish at `(1, 1, 1, 0)` | all hold | none |
| 3.x, 6.x, 7.x Checks | each value recomputed | `ℚ₂`: `8⟨1⟩` isotropic and `H³ = 0`; `cd₂(E′ℚ_p^h) ≤ 1 + 2 = 3 < 4`; `p(3) = 7`, `p′(3) = 6`; `(1 − 4s)/(1 − 8s)` not a square in `ℚ(s)` | all hold | none |

## Unresolved

- **gap:rost-cycle-modules.** MotivesAndAlgebraicCycles, at its open head, still has no Rost cycle
  modules (no heading or mention), and no roadmap owns them (`roadmaps grep "Rost cycle|cycle
  module"`). The review accepted the package conditional on this gap, so it is kept as declared.
- **Merge-order inversion with RealSurfacePeriodIndex.** RealSurfacePeriodIndex is line 219 of the
  merge order and this roadmap is line 370, yet its design consumes this roadmap's Tsen–Lang theorem
  (5.6) through "What QuadraticFormInvariantsPartII must provide (gap:q2-tsen-lang)". This roadmap
  does not depend on RealSurfacePeriodIndex: it only names it as a consumer and as the owner of the
  real-function-field applications, and the depcheck shows no problem. So the defect is in the
  order. The board should either move RealSurfacePeriodIndex after this roadmap, or move ownership
  of Tsen–Lang. I have not edited the merge order.
- LocalFieldsRamificationPartII is an accepted earlier supplier that is neither on main nor an open
  pull request. Its three cited sections were resolved in its board design copy.
- No suspicious instructions were found in any data read (package, reviews, supplier roadmaps,
  sources).


Pull request: #1834 (roadmap/quadratic-form-invariants-part-ii at 04296f6)
