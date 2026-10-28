# GATE-AlgebraicCurves~1: answers to human review

Reviewed head `8add475`. The review repairs are in commit `d4d0d954` (README). Commit `61e02087` repairs the gate failures in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` and the README lines that cite it; see "Gate repairs" below.

The roed-math review was written against `1c8f360`. Its points H01–H04 are already repaired in the text at `8add475`. The line numbers below refer to the README after this round's commit.

## H01 (roed-math) — applied

Separable generation is no longer identified with conservation of genus. The Standing hypotheses (`TauCetiRoadmap/AlgebraicCurves/README.md` l.130–141) and Layer 8 items 1–3 (l.833–855) separate three conditions: generic separable generation, regular field extension (separable generation plus exact constants), and a smooth regular projective model, which is the only one that conserves genus. The `y² = x^p − t` acceptance example (l.930–936 and Worked examples) now has to prove separable generation and exact constants as well as the genus drop. Verified at p = 3: with `a³ = t`, `u = y/(x − a)` satisfies `u² = x − a` and `u³ = y`, so the normalized constant extension is rational.

## H02 (roed-math) — applied

The Layer 12 introduction (l.1370–1378) now says that smoothness of a locally finite-type k-scheme is equivalent to geometric regularity. It also says that regularity plus geometric reducedness is weaker, and names the Layer 8 cusp as the counterexample (Stacks 038S, Lemma 33.12.6 / Example 33.12.7). 12B.0b (l.1414–1418) keeps geometric regularity as model input over imperfect k.

## H03 (roed-math) — applied

The statements that `G₀/G₁` is cyclic of prime-to-p order and that `d = Σ_{i≥0}(|G_i| − 1)` now sit in the "Classical residue-separable branch" (l.950–958), which requires a finite separable residue extension. The general branch (l.940–949) gives `|D/I| = f_sep` and `|I| = e·f_ins` and computes the different from the trace dual. Completion (l.986–993) and the LocalFieldsRamification sibling paragraph carry the same restriction. The `F₂(s,u)` V₄ example is a required regression (l.975–985). Rechecked: e = 1, G₀ = V₄, G₁ = 1; each quadratic step has different `(t)`, so d = 2, while the unrestricted sum gives 3. The trace-matrix determinant is `t⁸`, so f·d = 4·2 = 8.

## H04 (roed-math) — applied

Layer 2 (l.494–500) now says the poles of x are the primes of `R_{1/x}` over the base ideal `(x⁻¹)`. It keeps `(x⁻¹ − 1)` on `k(x)` as a finite-chart prime with `ord_P x = 0`, and takes finiteness from the normalization fibre rather than from the whole chart.

## H05 (CBirkbeck) — applied

Layer 8, "Unramified constant extensions" (l.879–902), changes from "unramified at P when K/k is separable **or** κ(P)/k is separable" to two separate statements:
- When K/k is separable, every Q over P is unramified in the full sense: e = 1 and κ(Q)/κ(P) separable.
- When only κ(P)/k is separable, the fibre `κ(P)⊗[k]K` is reduced, so e(Q/P) = 1 and κ(Q) is the matching factor of the fibre. In this branch κ(Q)/κ(P) is separable iff K/k is separable, because separability is transitive through κ(P)/k. Full unramifiedness therefore never follows from separability of κ(P)/k alone.

The suggested rational-place regression is added next to the existing `P = (t^p − a)` one: k = 𝔽_p(a), P = (t), K = k(a^{1/p}). There the fibre is K, `Con(P) = Q`, e = 1 and deg_K Q = deg_k P = 1, but κ(Q)/κ(P) = K/k is purely inseparable of degree p. It is also added to the Worked examples entry (l.1610–1615). The Layer 7 definition of unramified (l.758) is unchanged.

## H06 (CBirkbeck) — applied

Layer 10, elliptic function fields (l.1110–1146), changes from "genus 1 + degree-1 divisor ⇒ the nonsingular normal forms" to the following:
- **Over arbitrary k:** the Weierstrass equation (Prop. 6.1.2) holds with no discriminant condition, and so do the normal-form shapes. In char ≠ 2 the shape is `y² = f(x)` with f a squarefree cubic in `k[X]`, and conversely every such cubic gives genus 1. In char 2 the shapes are Mathlib's `IsCharTwoJNeZeroNF` and `IsCharTwoJEqZeroNF`.
- **`W.IsElliptic` holds iff the regular projective model is smooth** (Layer 8 item 3, 12B.0b). This is automatic over perfect k. In the normal forms the condition reads: f separable, a₆ ≠ 0, a₃ ≠ 0 respectively.

The reviewer's char-2 counterexample `y² = x³ + a` over 𝔽₂(a) is now a required negative control, with its genus computation. Over k(y): the place `y² + a` (degree 2) and the place at infinity each have e = 3, f = 1 and d = 2, so 2g − 2 = 3·(−2) + 2·2 + 2·1 = 0. The curve has Δ = a₃⁴ = 0, and over k(√a), u = (y + √a)/x gives x = u² and y + √a = u³. The char-3 cubic `y² = x³ − t` is the squarefree-but-inseparable control (Δ = −27b₆² = 0). Both are also in Worked examples (l.1616–1625).

The phrase "retain both characteristic-2 normal forms and their nonsingularity hypotheses" in the Diff paragraph (l.1145) now says the weighted computation is made for the nonsingular normal forms of the smooth branch. The forward theorem (W.IsElliptic ⇒ genus 1) and the group law on degree-one places keep their arbitrary-k scope. The pinned `TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one` (Weierstrass coordinates over arbitrary exact constants) and the `IsCharTwoNF`/`IsCharNeTwoNF` theorems (`TauCeti/FieldTheory/FunctionField/Elliptic/NormalForm.lean` l.66, l.81) assert no discriminant condition, which agrees with this split.

## H07 (CBirkbeck) — answered

Checked at Tau Ceti pin `a91d3aa`:
- `TauCeti.IsFunctionField` (`FieldTheory/FunctionField/Basic.lean` l.49) has the same body as this roadmap's `IsFunctionField`.
- `TauCeti.Place` is at `FieldTheory/FunctionField/Place/Basic.lean` l.100, with the order lemmas from l.144 on.
- `TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField` is at `FieldTheory/FunctionField/SeparablyGenerated.lean` l.44.

The README's "Existing formalizations" section (l.336–347) now cites these carriers and says that new targets are stated on them. The companion target `exists_isSeparatingElement` in `ConstantExtensionSuggested.lean` restates the third theorem with finiteness added. That file was not edited this round, and moving it onto the pinned carrier remains open. `Suggested.lean` still declares its own `IsFunctionField` and `Place`. Re-basing the acceptance test on the Tau Ceti carriers is a separate rewrite that this review did not request. Note for that rewrite: the pinned Tau Ceti already has `FieldTheory/FunctionField/{Divisor,Repartition,RiemannRoch,Elliptic,Hyperelliptic}` and an `isDedekindDomain_intermediateRing` theorem (`AlgebraicGeometry/EllipticCurve/Isogeny/IntermediateRing/Dedekind.lean` l.98). Several headline theorems may therefore already be proved at the pin on the Tau Ceti carriers. This round's gate repair is restricted to the gate findings, so that overlap is not checked here.

## Gate repairs (Suggested.lean)

- **sorry-data** (`principalDivisor`, l.167). The sorry'd `def principalDivisor : Additive Fˣ →+ Divisor k F` was replaced by:
  - `Divisor.IsPrincipal D := ∃ f ≠ 0, ∀ P, D P = P.ord f`, which has a real body;
  - `Divisor.principalSubgroup k F := AddSubgroup.closure {D | IsPrincipal D}`.

  `classGroupZero k F` (formerly `classGroupZero k F hF`) now quotients by `principalSubgroup`. The homomorphism `div` stays a README target (Layer 3), because constructing it needs the finiteness of zeros and poles.
- **sorry-examples=30**: each admitted `example` became a named `theorem` or was deleted.
  - Became named theorems (each name is now cited at its README bullet): `isFunctionField_iff_trdeg_eq_one`, `Place.isDiscreteValuationRing_integers`, `Place.finite_residueField_and_degree_pos`, `weak_approximation`, `exists_place_infty`, `exists_place_of_irreducible`, `finite_setOf_valuation_ne_one`, `Divisor.degree_eq_zero_of_isPrincipal`, `riemannRochSpace_zero`, `finiteDimensional_riemannRochSpace`, `riemann_theorem`, `riemann_roch`, `dim_eq_of_two_mul_genus_sub_one_le_degree`, `clifford_of_infinite`, `clifford`, `finite_classGroupZero`, `genus_ratFunc`, `genus_eq_one_of_weierstrassCurve`, `isDedekindDomain_coordinateRing`, `genus_eq_two_of_sq_eq_pow_five_sub_one`.
  - Deleted, because they restate the library or a definition, are a one-step consequence of a kept theorem, or compute a value. Each stays a README target or Check:
    - the two `IsIntegrallyClosedIn` reformulations;
    - `IsFunctionField k (RatFunc k)`;
    - the `principalDivisor` coefficient law;
    - the `Finsupp` repackaging of finiteness of zeros and poles;
    - monotonicity of `adeleFiltration`;
    - `adeleFiltration D ≤ repartitionSpace`;
    - `ℓ(n·P_∞) = n + 1`;
    - `ℓ(0) = 2` for `ℂ(x)/ℝ`;
    - the genus-one ladder `ℓ(n·[0]) = n` (the `deg ≥ 2g − 1` theorem at g = 1).

  The proved `0 ∈ adeleFiltration D` example is kept. The docstrings that pointed at deleted examples were reworded (`riemannRochSpace_zero`, `adeleFiltration`, and the section header "Layers 3 and 10: genus of explicit function fields").
- **readme-ids-missing=2.** README l.340–346 now cites the two Tau Ceti theorems by short name and namespace: `exists_transcendental_and_isSeparable_adjoin_of_perfectField` of namespace `TauCeti.IsFunctionField`, and `exists_isWeierstrassCoordinates_of_genus_eq_one` of namespace `TauCeti.Place`. Both exist at the pin (`SeparablyGenerated.lean` l.44, `Elliptic/WeierstrassEquation.lean` l.213). The gate read the dotted names as this roadmap's own because their prefixes `IsFunctionField` and `Place` are also declared here.
- **build warnings.** `Set.mem_setOf_eq` was replaced by `Set.mem_ofPred_eq` at l.217 and l.224. The deprecation alias is in Mathlib `Data/Set/Operations.lean` l.80.
- **Signatures.** Every declaration (31) was checked mechanically. The `#check @name` lines were appended temporarily to `Suggested.lean`, elaborated by the allowed `lake build`, and then removed.
  - Every elaborated type carries exactly the binders of its README statement. In particular, `[Algebra.EssFiniteType k F]`, `[Infinite k]`, `[Finite k]` and `[W.IsElliptic]` are present, and `hF`/`hex` appear where the README states them.
  - The product formula and `finiteDimensional_riemannRochSpace` carry no `hex`. The README bullets now say so (the earlier README left the product formula inside Layer 3's exact-constants standing hypothesis).

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `IsPrincipal` | f = 1; f = c ∈ kˣ; f = X ∈ k(X); D = P_∞ | ord 1 = −log 1 = 0 ⇒ D = 0; v_P c = 1 ⇒ D = 0; D = P_X − P_∞ (ord_∞ X = −intDegree X = −1); deg P_∞ = 1 ≠ 0, so not principal under the product formula | defines the intended set | new def |
| product formula without `hex` | k(X)/k, f = X; ℂ(x)/ℝ, f = x − i | 1·1 − 1·1 = 0; places x − i and ∞ have ℝ-degree 2: 2 − 2 = 0 | holds without exact constants | README bullet now says so |
| `principalSubgroup` = set of principal divisors | f, g ≠ 0 | ord(fg) = ord f + ord g (`WithZero.log_mul`, nonzero values); ord f⁻¹ = −ord f; 0 = div 1 | closure adds nothing | new def |
| `finite_classGroupZero` | k = 𝔽_q, F = 𝔽_q(X) | Cl⁰ = 0 (genus 0, rational place) ⇒ finite; signature `[Finite k] … Finite (classGroupZero k F)` | holds | `hF` dropped from the type's arguments |

## Adversarial pass on the changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| K/k separable ⇒ every Q over P unramified | K = k; k = ℚ, K = ℚ(i), F = ℚ(t), P = (t²+1) | fibre ℚ(i)⊗ℚ(i) ≅ ℚ(i)×ℚ(i): two Q, each e = 1 with κ = ℚ(i) separable; Σ deg_K Q = 2 = deg_k P | holds | stated |
| κ(P)/k separable ⇒ e = 1 (only) | k = 𝔽_p(a), K = k(a^{1/p}), P = (t); P = (t²−a), p odd | fibre K (field), e = 1, [κ(Q):κ(P)]_ins = p; fibre K(√a), e = 1, κ(Q)/κ(P) inseparable of degree p | e = 1 holds; unramified fails | old "or" disjunct split off |
| hypothesis failing: κ(P)/k inseparable | P = (t^p − a) | fibre K[x]/(x−b)^p, length p, e = p | conclusion fails without the hypothesis | kept as regression |
| κ(Q)/κ(P) separable ⇔ K/k separable (when κ(P)/k separable) | K = k; K = k(a^{1/p}) | K = k: both sides separable; K = k(a^{1/p}) at P = (t): K/k and κ(Q)/κ(P) = K/k both inseparable | holds both ways | stated |
| char ≠ 2: genus 1 + rational place ⇔ y² = f, f squarefree cubic | f = x³ − x / ℚ; f = x²(x−1); f = x³ − t / 𝔽₃(t) | deg Diff = 4 ⇒ g = 1; y/x gives (y/x)² = x−1, g = 0; deg Diff = 3+1 ⇒ g = 1 | holds; non-squarefree is excluded | stated |
| W.IsElliptic ⇔ smooth regular model | y² = x³ − x / ℚ; y² + y = x³ / 𝔽₂; y² = x³ + a / 𝔽₂(a); y² = x³ − t / 𝔽₃(t) | Δ = 64; Δ = a₃⁴ = 1; Δ = 0 and genus 1 → 0 over k(√a); Δ = −27b₆² = 0 and genus 1 → 0 | holds in all four | stated |
| normal-form discriminants | char-2 j ≠ 0; j = 0; char ≠ 2 | Δ = a₆; Δ = a₃⁴; Δ = 16·disc f | conditions a₆ ≠ 0, a₃ ≠ 0, f separable | stated |
| genus of y² = x³ + a over 𝔽₂(a) | F/k(y), degree 3, separable | e = 3, d = 2 at y²+a (deg 2) and at ∞ (deg 1); others: x³ = unit is étale; 2g−2 = −6+4+2 = 0 | g = 1 | negative control |
| rationality over k(√a) | v = y+√a, u = v/x | v² = y²+a = x³; u² = x, u³ = v | rational | negative control |

## Checks done

- Ownership: these repairs add no new carriers. The Tau Ceti carriers are cited, and no declaration copies a name from a readable roadmap.
- Citations: `roadmaps resolve` reports no cross-roadmap citations or Lean names that cannot be found.
- Signatures: re-checked with `#check @name` after the gate repairs (31 declarations); see "Gate repairs".
- Sources: no source text was copied into any file.

## Build and gate

- `lake build TauCetiRoadmap.AlgebraicCurves.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are `declaration uses 'sorry'`; the two deprecation warnings are gone.
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
- Gate summary line, run after commit `61e02087`:
  `gate AlgebraicCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
