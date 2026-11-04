# GATE-HopfologicalAlgebra~5: answers to the review of 1cf5b3d

All eleven points come from one review comment (CBirkbeck, 2026-10-28, findings F01–F11 = H01–H11). Repairs are in commit 48f2f48.

## H01 (CBirkbeck) — applied differently
The zero-integral witness is right: with `Λ = 0`, `IsIntegralNull` reads `f = 0`, so `id` on `k` over `H = A = k` is not null although `C(k,k) = 0`. `IsIntegralNull`, together with `SmashModule` and `HomActionFormula`, is deleted from `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean`, because no headline used it (H08); README §4.1 now defines the null ideal for a **nonzero** left integral, says rescaling `Λ` leaves it unchanged, and gives `Λ = 1` (null) against `Λ = 0` (excluded) as a Check. The Conventions also say that `LeftIntegral` contains `0` and that "a left integral" means a nonzero one.

## H02 (CBirkbeck) — applied
"Canonical embeddings" (old README l.189, l.277 `H ↪ A#H`) → "algebra maps". README §3.1 now says `a ↦ a # 1` is always injective (`H ≠ 0`, since `ε(1)=1`), while `h ↦ 1 # h` is injective only for `A ≠ 0`, with kernel `H` when `A = 0`. Restriction uses the algebra map. Checks were added for `A = 0` and `A = k`. The Lean `SmashProduct` already used `includeH : H →ₐ[k] Carrier` with no injectivity claim; its docstring now says so.

## H03 (CBirkbeck) — applied
`NakayamaData`, which carried the winding formulas as fields, is deleted, along with `stableNakayama`, the `rfl` bridge and `stableNakayama_unique` (the last is Tau Ceti's `coe_nakayamaAut_eq`). It is replaced by `nakayamaAut_symm_eq_winding`: for a nonzero right cointegral `φ` with `hφ : φ.IsFrobeniusFunctional`, a nonzero left integral `Λ` and `Λh = α(h)Λ`, `hφ.nakayamaAut.symm h = Σ α(h₁) S²(h₂)`. The source is Fischman–Montgomery–Schneider Lemma 1.5, p. 4862. That lemma uses the stable convention and a right integral, and `α' = α⁻¹`. Two calculations check the statement. In `H₄`, `ν_H(g) = −g` and `ν_H(x) = x`, computed directly from `φ = x*`. In the Taft algebra with `N = 3`, `ν_H(K) = qK` and `ν_S(K) = q⁻¹K`; this README Check separates the two orientations. The cointegral theorem now concludes Tau Ceti's `IsFrobeniusFunctional` instead of a private `mulPairing` (renamed `isFrobeniusFunctional_of_isRightCointegral`).

## H04 (CBirkbeck) — applied
QuantumGroups (main) Q8 item 5 does state `FiniteHopfModuleCat` with tensor over `k` via `Δ`, the counit unit, and duals through `S` and `S⁻¹`. README §2.1 now consumes it. That section owns only the extension to all modules, the fully faithful monoidal comparison, the projective tensor ideal and the descent to `H-StMod`. The citation appears in Scope and in the supplier contracts. The old "no competing implementation" paragraph is gone.

## H05 (CBirkbeck) — applied
The "construct the Hopf structure on `H*`" target is deleted. README §3.3 and the contracts cite `TauCeti.ConvolutionDual.instHopfAlgebra` and `TauCeti.ConvolutionDual.antipode_apply` (`TauCeti/Algebra/HopfAlgebra/FiniteDual/Basic.lean:510, 538`, commutative ring, finite projective). The Lean comparison is stated on that carrier.

## H06 (CBirkbeck) — applied differently
The docstring claim that the pins lack graded `H_n`-modules was false and is replaced. The new text says graded modules exist as `TauCeti.GradedModuleCat`, with its abelian structure and shift. What is missing is the braided monoidal structure, its stable descent, `O_n` and a ring-valued triangulated `K₀`. The private graded replacements (`InternalGrading`, `GradedModuleDatum`, `GradedLinearMap`, `BraidedHopfObject`, …) are deleted rather than ported. Their only consumer, Laugwitz–Qi Proposition 4.16, is a step on the route to the not-statable `K₀(O_n)` headline, not a headline itself. It stays a README target (§8.2), with graded modules in `TauCeti.GradedModuleCat` and the shift convention `(M{r})_p = M_{p−r}` stated in the Conventions.

## H07 (CBirkbeck) — applied
`coactionFromFiniteDual_independent_of_basis` is replaced by `exists_leftModuleAlgebra_equiv_rightComoduleAlgebra`. It states an equivalence between `LeftModuleAlgebra k H A` and `{c : TauCeti.Comodule k (ConvolutionDual k H) A // IsRightComoduleAlgebra … c}`. The forward coaction is `Σ (bᵢ·a) ⊗ toConv(bᵢ*)` for every basis `b`, which makes it basis-independent. The inverse is `h·a = (id ⊗ ev_h)(ρ a)`, written with `evalConv`. Hand checks: the unit of `H*` is `ε`, so the module-algebra law `h·1 = ε(h)1` becomes `ρ(1) = 1 ⊗ 1`. Convolution turns `h(ab) = Σ (h₁a)(h₂b)` into multiplicativity of `ρ`, and module associativity becomes coassociativity. In the sign example on `k[x]`, `ρ(x) = x⊗δ₁ − x⊗δ_g`. `RightComoduleAlgebra` (an instance-bound structure) becomes the predicate `IsRightComoduleAlgebra` on a comodule structure.

## H08 (CBirkbeck) — applied
The following are deleted: `ExteriorOddPrimitiveDatum`, `OrdinaryDGDatum`, `PDGDatum`, `QNComplexDatum`, `Bicharacter` and the graded/braided records, `SweedlerDatum` and `TaftDatum` with their equation records, `CyclotomicFactorization`/`RootData`/`BraidedDatum`/`BosonizationDatum`/`ModuleAlgebraEquations`, `SmashModule`, `HomActionFormula`, `ASplitConflation`, `PropertyPData`, `IsCompactObject`, the LQ cell/ideal structures and the two LQ theorems (see H06). All of this material stays in the README as targets and Checks. The truncated-primitive record shrinks to `TruncatedPrimitive` (primitive `d`, `d^p = 0`, monomial basis); `d^p = 0` must stay, because `k[d]/(d^p − d)` in characteristic `p` is a Hopf algebra with a primitive generator and a monomial basis that is semisimple. Prime and characteristic become `[Fact p.Prime] [CharP k p]` on the slash theorem.

## H09 (CBirkbeck) — applied
The following are deleted: `prime_relation_eq_cyclotomic` and the three relation definitions (the README cites `Polynomial.cyclotomic_prime`), `odd_primitive_cross_terms_cancel`, `mem_leftIntegral_iff`/`mem_rightIntegral_iff`, the reflexive Nakayama identity, `pure_mul_assoc`, `smashMulPure_one_left/right`, `smashOne`, `primitive_square_coproduct_binomial`, `primitive_square_zero_forces_two_tmul`, `self_tmul_ne_zero`, `no_nonzero_square_zero_primitive`, `primitive_pow_coproduct_prime`, `dgIntegralNullHomotopy(_degree_neg_one)`, `pNullHomotopy(_two)`, `pNullHomotopyDegree(_one/_two)`, the factorization arithmetic lemmas, `slashDenominator_le_cycles` and `moduleDifferential_pow`. Each survives as README prose or a Check: §7.1 has the obstruction, §7.2 the null formula and degrees, §8.1 the root orders. `SlashHomology` no longer carries the `let`-bound hypotheses, and the slash theorem states its hypotheses itself.

## H10 (CBirkbeck) — applied
Every theorem paragraph now ends with a `*Needs:*` line and a locator at the claim. Laugwitz–Qi: Theorem 5.5 (thick tensor ideal), Definition 5.6 (`O_n`), Lemma 5.8 (descended functors), Lemma 5.14, and Theorem 5.15 (arXiv v4 pp. 27–28), the last attached to the `t ≥ 3` discussion. Qi: Definitions 2.4, 5.1, 6.1, 6.3, 7.1, 9.1, 9.3, 9.4; Lemmas 2.3, 2.6, 5.2, 9.6; Corollaries 5.5, 6.5, 6.8, 6.9, 6.10, 7.15, 9.9; Theorems 3.5, 4.2, 6.6; Propositions 7.6, 9.8, 9.10; §4.3 p. 19. Khovanov: Propositions 1, 2, 5, 7. Khovanov–Qi: §2 p. 14, (18)–(20). Qi–Sussan 2017: Theorem 5.5. FMS: Lemma 1.5. ESW: §2 p. 4 and Theorem 2.2(b),(c). I read each locator myself in the fetched open texts (`LaugwitzQi2022`, `Qi2014`, `Khovanov2016`, `KhovanovQi2015`, `QiSussan2017`, `ErdmannSolbergWang2019` as arXiv:1710.11558, `FischmanMontgomerySchneider1997` from the AMS open archive). The page numbers I quote are those of the arXiv versions read, as the References note. I could not verify the reviewer's printed page numbers (p. 569, p. 570, pp. 574–575) against the published journal, so I cite theorem numbers instead. The module reference `.Exact.Stable` → `TauCeti.CategoryTheory.Exact.Stable.Triangulated`.

## H11 (CBirkbeck) — applied
The README is rewritten in house shape. It has `# Roadmap: hopfological algebra`, a **Summary**, then Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, QuantumGroups, StablePeriodicCurved, DGAInfinity, GrothendieckEulerForms), and How to read the build. Layers 1–8 have `### k.n` subsections with API bullets and **Checks** (at least three per definition block), and every layer ends with Examples and Dependencies. Downstream consumers and References close it. The source-to-layer table and the "implementation order" section are folded into the layers. The integral Checks are the reviewer's three plus `H₄`'s cointegral `x*`, and a nontrivial Nakayama example is included (H03). The Taft-algebra integral line is given as unequal left/right lines in `H₄`.

## Mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `finrank_leftIntegral` | `k`; `k[C₂]` char 2; `H₄` | `∫=k·1`; `k·(1+g)`, `ε=0`; `k·(1+g)x` | true; normalized-integral model refuted | `[Nontrivial H]` dropped: `ε(1)=1` forces `H ≠ 0` |
| `isFrobeniusFunctional_of_isRightCointegral` | `H₄`, `φ=x*`; `k[C₂]` | Gram entries `x*(1·x)=1`, `x*(g·gx)=1`, `x*(gx·g)=−1`, rest 0 ⇒ det ±1; `ε` fails cointegral at `g` | true | carrier → Tau Ceti `IsFrobeniusFunctional` |
| `antipode_bijective` | `H₄`; `k[G]` | `S²(x)=−x` (order 4); `S²=id` | true; `S⁻¹=S` model refuted | none |
| `nakayamaAut_symm_eq_winding` | `H₄`; Taft `N=3`; `k[G]`; `Λ=0` | `α(g)=−1`, `ν_H(g)=−g`, `ν_H(x)=x` (direct check via `x*`); `α(K)=q`, `S²d=q⁻¹d`, `ν_H(K)=qK`, `ν_S(K)=q⁻¹K`; `ν=id`; `Λ=0` makes `α` arbitrary | true; `hΛ0` necessary | new statement |
| companion `a⁻¹(…)a` formula (README) | `H₄` | `a=g`, gives `ν_H(g)=−g`, `ν_H(x)=x` | agrees | Check added |
| symmetric criterion | `k[G]`, `k[d]/(d^p)`; `H₄` | unimodular & `S²=id` ⇒ symmetric; `S²=Ad g` inner but `α≠ε` ⇒ not symmetric | consistent both ways | none |
| `hMod_abelian_isFrobenius` | `k`; `k[d]/(d²)` char 2 | all projective; `k` not projective, `H` proj-inj | true | locator added |
| `smashProduct_nonempty`, `lift_unique` | `A=k`, `A=0`, sign action on `k[x]` | `k#H≅H`; `0#H=0`, `includeH` kernel `H`; `(1#g)(x#1)=−x#g` | true; injectivity only for `A≠0` | README fixed (H02) |
| `IsRightComoduleAlgebra` | `k[G]`-graded; trivial; `ρ(a)=a⊗g` | comodule algebra; yes; comodule but `ρ(1)=1⊗g` | discriminates | new |
| finite-dual equivalence | trivial action; sign action | `ρ(a)=a⊗ε`, unit ✓; `ρ(x)=x⊗δ₁−x⊗δ_g`, eval at `g` = `−x`, basis `{1±g}` same | true; `S`-twisted formula fails for `H₄` | new |
| `slashHomology_subsingleton_iff_projective` | `p=2`; `p=3` with `M=k`, `k[d]/(d²)`, `H₃` | ordinary homology; `(k,0)`; `(kd,k)`; `(0,0)` | iff holds on each; `d^p=0` needed (`k[d]/(d^p−d)` counterexample) | hypotheses explicit |
| `IsUnimodular`, `AntipodeSquareIsInner` | `H₄` | `∫^l≠∫^r`; `S²=Ad g` | discriminate | none |
| integral null ideal (README) | `H=A=k` with `Λ=1`, `Λ=0` | `id=Λ·id` null; `Λ=0` gives `f=0` | needs `Λ≠0` | H01 |
| K₀ relations (README) | `p=2,3`; `k[d]/(d⁴)` char 2; Taft `N=4`; `n=4,6,12,30` | `1+q`, `1+q+q²`; `1+q+q²+q³=Φ₂Φ₄≠Φ₄`; LQ Checks as before | consistent with §8.2 | Checks kept/added |

## Binder check

All 26 declarations of `Suggested.lean` were elaborated with `#check @name`. The `#check` lines were appended to the file temporarily, run through the permitted `lake build`, and then removed. No elaborated type differs from its README statement. `FiniteDimensional k H` appears on every finite-Hopf theorem and on the finite-dual theorem. `[Fact p.Prime] [CharP k p] [FiniteDimensional k M]` appear on the slash theorem. Definitions that do not need finite dimension (`IsUnimodular`, `evalConv`, `SlashHomology`) do not carry it, and nothing depends on a dropped binder.

## Ownership and suppliers

Search was by object, using `roadmaps grep` across main and the open heads. Integrals of Hopf algebras, Larson–Sweedler, smash products, Nichols/Taft algebras and bosonization have no other owner. The only overlaps are QuantumGroups Q8 item 5 (H04) and QuantumEnvelopingAlgebras' root-datum bosonization, which is not a general construction. McKaySkewGroup's skew group algebra is the finite-group special case. No declaration name collides. No supplier comes from later in the merge order, and nothing was moved down.

Depcheck output: `depcheck: 199 roadmaps, 1275 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

## Sources

The texts read are listed under H10, together with the Erdmann–Solberg–Wang journal record (NTNU institutional repository). Larson–Sweedler (JSTOR) and Montgomery (AMS CBMS) cannot be read legally here. The README cites Larson–Sweedler only through FMS and ESW, which recall it, and cites Montgomery without a locator. No statement depends on unread text, so no `needs-references.toml` request is made. This job may not edit `sources.toml`, so the fetched sources are not recorded in a manifest.

## Build and gate

`lake build TauCetiRoadmap.HopfologicalAlgebra.Suggested`: Build completed successfully (9002 jobs); the only warnings are 10 `declaration uses 'sorry'`.

Gate: `gate HopfologicalAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
