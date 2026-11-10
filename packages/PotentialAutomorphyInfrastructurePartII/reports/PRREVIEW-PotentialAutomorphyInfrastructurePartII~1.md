# Review of PotentialAutomorphyInfrastructurePartII (pull request #2135 at 7c77575)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` (2361 lines) and `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/Suggested.lean` (78 lines). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty).

## R01 (P2) — §10.2 weakens LTXZZ's hypothesis (D0) from `>` to `≥`

**Location.** `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` line 2224: "(D0) `ℓ ≥ (b_ξ − a_ξ) + 2`;" with the attribution "This is LTXZZ, Theorem 3.6.3, p. 30."

**Claim.** §10.2 states LTXZZ's integral `R = T` theorem under (D0)–(D4).

**Witness.** LTXZZ line 1445 (Theorem 3.6.3, (D0)) and the standing hypothesis at LTXZZ line 1371 both require `ℓ > (b_ξ − a_ξ) + 2`. Take `N = 2`, `ξ_τ = (0, 4)`, `ξ_{τc} = (−4, 0)`. Then `a_ξ = −4`, `b_ξ = 5` and `(b_ξ − a_ξ) + 2 = 11`, which is prime. The README admits `ℓ = 11`; the source needs `ℓ ≥ 13`. (D1) gives only `ℓ ≥ 7`.

**Repair.** Restore `ℓ > (b_ξ − a_ξ) + 2` in (D0). For fidelity, also write (D1) as `ℓ > 2(N + 1)`; for odd `ℓ` this is equivalent, since `2(N + 1)` is even. If the boundary case is wanted, state it as a separate target with its own argument for the Fontaine–Laffaille step at weight length exactly `ℓ − 2`. Tested on the instance: with the strict inequality, `ℓ = 11` is excluded and `ℓ = 13` is allowed, as in LTXZZ.

## R02 (P2) — Two owners for the BLGGT, NT23 and ANT20 theorems: this roadmap and ModularityAndLanglandsExtensions

**Location.** README line 21: "ModularityAndLanglandsExtensions §§2.1–2.2, 2.9–2.16, 4.1–4.2 uses the local criteria and lifting statements owned here". README line 74: "ModularityAndLanglandsExtensions consumes this roadmap, so these two statements come after it". The last paragraph of the `Suggested.lean` docstring says the same: "which comes after this roadmap".

**Claim.** This roadmap owns potential diagonalizability and the BLGGT, NT23 and ANT20 lifting statements, and ModularityAndLanglandsExtensions consumes them.

**Witness.** ModularityAndLanglandsExtensions (open PR, merge-order line 196; this roadmap is line 282) cites no section of this roadmap. It states BLGGT14 Lemmas 1.4.1–1.4.3, Theorems 2.3.1, 2.4.1, 3.1.2 and 4.2.1, Proposition 3.2.1, NT23 Theorem A and ANT20 Theorem 6.1 as its own targets.

**Repair.** Each theorem needs exactly one owner. The double statements are:

| ModularityAndLanglandsExtensions | This roadmap |
|---|---|
| §2.1, potential diagonalizability and its criteria (BLGGT14 Lemmas 1.4.1–1.4.3) | §§1.4, 1.5, 1.7 |
| §2.2(1)–(2), BLGGT14 Theorems 2.3.1 and 2.4.1, with 2.3.2 and 2.4.2 | §5.1 (BLGGT14's form), §§5.5–5.7 |
| §2.14, BLGGT14 Theorem 3.1.2 | §6.2 |
| §2.15, BLGGT14 Proposition 3.2.1 | §6.3 |
| §2.16, BLGGT14 Proposition 4.1.1 and Theorem 4.2.1 | §§6.4–6.5 |
| §4.1, NT23 Theorem A | §9.7 |
| §4.2, ANT20 Theorem 6.1 | §§8.8, 8.17 |

ModularityAndLanglandsExtensions precedes this roadmap in the merge order, so by default it is the owner. Choose one of two options:

- **(a)** Replace the right-hand column by citations of the left-hand sections. Keep here only what that roadmap does not state: Thorne's and Geraghty's unitary-group forms, the 2-adic, GHT and relaxed-adequacy forms, and Layers 2–4, 7 and 10.
- **(b)** Keep the theorems here and make that ownership real. ModularityAndLanglandsExtensions's pull request must then replace its sections by citations of this roadmap, and the merge order must place it after this roadmap. This pull request must say which option applies.

In either case, rewrite line 21, the paragraph at line 74 and the matching paragraph of the `Suggested.lean` docstring. As written, they assert a consumer relation and an order that the merge order contradicts. Under the present order, ModularityAndLanglandsExtensions §2.32 (change of weight and level) is an available earlier supplier, not a later roadmap.

## R03 (P2) — §§3.1–3.3 restate the definite unitary forms owned by CompletedCohomologyAndLocalGlobalCompatibility §0.7

**Location.** README §3.1 (line 725): "Construct `unitary group G` …". §3.2 (line 753) defines `S_{λ,{χ_v}}(U, A)` with restriction, trace and the double-coset decomposition. §3.3 (line 775) defines `T_w^j` and `𝕋^T`.

**Claim.** This roadmap builds the rank-`n` definite unitary group, its algebraic modular forms and their split-place Hecke algebra.

**Witness.** CompletedCohomologyAndLocalGlobalCompatibility §0.7 (open PR, merge-order line 252, before this roadmap) constructs the rank-`n` compact-at-infinity unitary group with `ι_{w^c}(g) = c(ᵗι_w(g)⁻¹)`. It also constructs the forms `S(U, A)` with class-set evaluation, restriction and trace, and the split-place operators `T_w^{(j)}` with the tame Hecke algebra. It says that no fixed rank replaces this construction. The README never cites it.

**Repair.** Add CompletedCohomologyAndLocalGlobalCompatibility to the supplier contracts. Cite its §0.7 for the group, the forms, their level maps and the split-place operators. Keep in §§3.1–3.3 only what §0.7 lacks:

- the `S(B)` division-algebra variant;
- the `χ_v`-twisted coefficients at `R`, as an instance of its type `τ`;
- the existence and parity discussion, if §0.7 does not cover the `S(B)` case;
- `O`-freeness and reducedness of `𝕋`.

There is no cycle: §0.7 cites nothing from this roadmap.

## R04 (P2) — Three declared gaps are compound, and one partly asks for what its supplier already states

**Location.** README line 202 (`gap:brochard-ultrapatching`), line 229 (`gap:unitary-shimura-integral-cohomology`) and line 176 (`gap:semistable-stable-category`). The same slugs appear in `design/plan.json`.

**Claim.** Each `needs` sentence names one missing result.

**Witness.** DeformationAndDerivedPatchingAlgebra §5.8 already states characteristic-zero patching from NT23 Lemmas 4.16–4.17, Proposition 4.18 and Lemma 4.19; its §8.1 supplies the ultrafilter germs. Each of the other two gaps bundles separate results.

**Repair.**

- `gap:brochard-ultrapatching`: narrow it to Brochard's criterion (NT23 Theorem 4.27). Cite DeformationAndDerivedPatchingAlgebra §5.8 for ultrapatching; README line 198 already uses §5.8.
- `gap:unitary-shimura-integral-cohomology`: split it into three gaps:
  - the integral étale cohomology of `Sh(V, K)` with `L_ξ`, Hecke and Galois actions and Taylor–Wiles levels;
  - the base change of its constituents with local–global compatibility;
  - rank-one monodromy at inert non-split places for `N` even.
- `gap:semistable-stable-category`: split it into two gaps:
  - the Wake–Wang-Erickson stable condition and its determinant quotient (NT23 Proposition 2.14);
  - Liu's theorem on limits of torsion semistable representations.

The package stage may add slugs to `gaps`. Keep the existing slug for one of the parts and add new slugs for the others, in both `plan.json` and the README.

## R05 (P3) — Consumers cite design ids `PL.k` that the README never maps; the one mapping sentence is process narrative

**Location.** README line 65: "These replace the geometric construction formerly numbered §6.1; Layer 6.1 is now supplied by those sections." Layer 6 starts at §6.2 (line 1341).

**Claim.** Former numbering is mapped for anyone who cites it.

**Witness.** Three open roadmaps cite this one in the design numbering:

- AbelianSurfacesModularity README line 122 cites `PL.0`, `PL.4` and `PL.4/relaxed-adequacy`;
- HilbertModularVarietiesAndShimuraCurvesPartII README line 120 cites `PL.1/potentially-barsotti-tate-diagonalizable`;
- GSp4NonregularModularityLifting README line 192 cites `PL.4`.

None of these ids occurs in this README.

**Repair.** Add a table whose header names the design numbering, mapping each cited id to its place here:

- `PL.1/potentially-barsotti-tate-diagonalizable` → §1.6;
- `PL.4` "Strong residual oddness at a real place" → §5.2;
- `PL.4/relaxed-adequacy` → §5.4;
- `PL.0` soluble base change and descent → §0.9;
- `PL.0` soluble and cyclic CM extensions → not owned here (PotentialAutomorphyInfrastructure §2.5).

Delete the "formerly … now" sentence. No roadmap cites §6.1.

## R06 (P3) — The `merge-order` block omits the unmerged supplier PotentialAutomorphyDworkMotivesPartII

**Location.** The PR description's generated `<!-- merge-order -->` block, which ends: "It depends on no other author's open pull request."

**Claim.** Every prerequisite of this pull request is listed.

**Witness.** README §6.2 and the contract at line 281 depend on PotentialAutomorphyDworkMotivesPartII (merge-order line 243). That roadmap is on neither main nor any open PR; it exists only as a board package. The citations tool reports it "found nowhere".

**Repair.** Name PotentialAutomorphyDworkMotivesPartII in the merge-order paragraph as a supplier that is not yet merged, and hold this pull request until that roadmap's pull request merges. All 21 cited sections exist in the board package, so only the order needs stating.

## R07 (P3) — §§7.4, 7.14 and 7.15 carry no locator

**Location.** §7.4 (line 1460), §7.14 (line 1618) and §7.15 (line 1632) state theorems with no source locator. Unlike §§7.3 and 7.12, they do not say that the result is not in the sources.

**Claim.** Every target has a locator.

**Witness.** The sources use these facts: Tho15, proof of Theorem 7.1, p. 67 (Tho15 line 3247), "use that ρ̄ is primitive, and ρ̄(G_F) = ρ̄(G_L)"; and ANT20 Lemma 5.2, p. 16 (ANT20 lines 731–733).

**Repair.** Cite those places for §§7.4 and 7.14. For §7.15, either cite a standard text on splitting fields and Brauer–Nesbitt descent, or state, as §7.3 does, that the comparison is not stated in the sources. The mathematics is correct: I checked the orbit-size argument of §7.4 and the kernel-in-core argument of §7.14.

## R08 (P3) — §§8.7, 8.8 and 8.9 are special cases of §§8.18, 8.17 and 8.19

**Location.** Line 1974: "Prove §8.8 with "strongly primitive" replaced by "weakly primitive"". Lines 1988 and 2002 do the same for §§8.7 and 8.9.

**Claim.** The strong-primitivity and weak-primitivity forms are separate targets.

**Witness.** §7.1's API states that strong primitivity implies weak primitivity, over the same field `k̄`. So every input to §8.8 is an input to §8.17 with the same conclusion. The same holds for §8.7 against §8.18 and §8.9 against §8.19.

**Repair.** Keep one target per theorem, the source-strength §§8.17–8.19. Record the strong-primitivity route, which avoids §7.12, as an alternative route paragraph or a Check under each. Move the `*Needs:*` items accordingly. Special cases belong in Checks, not in separate targets.

## Verified sound

**Gate and order.** The worker's gate at this head reports every check passing. I ran the dependency check myself; its full output is `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The pull request touches no file outside the folder.

**Lean.** I ran `lake env lean` on `Suggested.lean`: exit 0 and no messages, so no warnings. The file declares nothing: an empty namespace and a module docstring that names each headline with its missing carriers. I checked the Tau Ceti pin for those carriers. It has elliptic-curve Tate-module Galois representations, but no automorphic representations, no `𝒢_n`-valued representations and no deformation rings. So no headline is statable, nothing is padding, and the one-tactic probe and the `#check @name` signature comparison have nothing to run on. Imports: `import Mathlib` only. No `set_option`, `lemma`, sorry'd data or LaTeX.

**Shape.**

- All 109 numbered targets have a `*Needs:*` line and at least three Checks; I counted mechanically.
- Every layer ends with Examples and Dependencies.
- The only process wording is line 65 (R05).
- The 22 sources in References match the 22 keys in `sources.toml`.

**Seeded sample (15 of 15 checked against the cached texts).** Every locator, page and set of hypotheses matches, apart from the recorded deviations, which are deliberate corrections that I confirmed against the sources.

| Target | Locator checked | Outcome |
|---|---|---|
| 0.6 | NT26 Lemma 2.6 p. 12 (NT26 line 548); Ger19 Lemma 5.1.5 p. 60 (line 2673); BLGGT14 p. 33 (line 1517) | matches |
| 3.3 | Tho12 §6 pp. 32–33 (lines 1423–1440); Ger19 Def. 2.3.4 p. 11 (line 506) | matches; reducedness argued in the route, also Ger19 Lemma 2.4.4 |
| 3.10 | NT21 §6 pp. 78–80 (lines 3838–3937) | matches; the corrected exponent `−j(j−1)/2` agrees with Tho12 Prop. 6.6 (Tho12 line 1569) |
| 4.1 | Tho12 Def. 4.1, Lemma 4.2, proof of Prop. 4.4 pp. 15–18 (lines 617–755); Tho17 Def. 2.18, Lemma 2.19 p. 13 | matches |
| 4.7 | Tho17 Prop. 7.2 p. 32 (line 1425), §7 pp. 30–32 | matches; Def. 2.20 uses `ad` modulo scalars (Tho17 line 167) |
| 5.1 | Tho12 Thm 7.1 (lines 1784–1813); BLGGT14 Thm 2.3.1 p. 38 (line 1721) | matches |
| 6.3 | BLGGT14 Prop. 3.2.1 pp. 45–48 (lines 2010–2040) | matches |
| 7.2 | NT21 Lemma 5.1 p. 66 (line 3274) | matches |
| 7.7 | ANT20 Lemma 3.6 p. 11 (lines 516–524) | matches |
| 7.12 | own result; Sk13 Remark 3.2 p. 519 (line 205) | locator correct. The argument closes: Schur depends only on the semisimplification and the multiplier, so the reduction of the self-dual block-split lattice is Schur, hence semisimple, hence `≅ r̄|Δ` and an actual induction |
| 7.14 | no locator | R07 |
| 7.16 | Tho15 Prop. 3.37 pp. 28–30 (lines 1362–1438); ANT20 proof of Thm 4.1 (lines 699–702) | matches |
| 8.8 | ANT20 Thm 1.1 = 6.1 pp. 1–2, 17–19 (lines 44–68, 804–829) | matches, but narrowed to strong primitivity (R08) |
| 8.13 | NT21 Prop. 5.6 pp. 71–72 (lines 3494–3544) | matches; the rank-one gap is real (source issues) |
| 9.4 | NT23 Lemma 2.13, Prop. 2.14 p. 13 (lines 578–606) | matches |

**Adversarial pass (computed instances).**

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §0.1 sign convention | `ε_l`, `n = 1` | `ε(Art x) = x` on `ℤ_l^×`; `x·x^λ = 1` iff `λ = −1`; `HT = {λ} = {−1}` | consistent with `HT(ε) = −1` |
| §0.4 Check (good ordinary curve) | `n = 2`, `λ = (0, 0)` | `ψ₁` unramified: `ψ₁·x^{λ₂} = 1`; `ψ₂ = ε⁻¹·ur`: `x⁻¹·x^{λ₁+1} = 1`; `HT = {1, 0}` | holds |
| §0.6 | `GL₂(ℚ₅)`, Steinberg, `ψ(5) = 1` | Jacquet character at `diag(5,1)` is `1/5`; times `δ_B⁻¹ = 5` gives `1`, of valuation 0 | ordinary; without the factor `1/5`, valuation −1 (the README's Check agrees) |
| §2.1(3) | `n = 1` | `c` acts on `ad = k` by `X ↦ −X`; `H⁰ = 0` if `2 ≠ 0`, `= k` in characteristic 2 | the hypothesis is needed and stated |
| §3.1 existence | `L⁺ = ℚ`, `n = 2` | product of local invariants `((−1)^{n/2})^{[L⁺:ℚ]} = −1 ≠ 1` | no such form, as stated |
| §3.3 `w` vs `w^c` | `n = 1`; general `j` | `ι_w`-image `ϖ⁻¹`, so `T¹_{w^c} = (T¹_w)⁻¹`; `diag(ϖ⁻¹1_j, 1) = ϖ⁻¹diag(1_j, ϖ1_{n−j})`, so the operator is `(Tⁿ)⁻¹T^{n−j}` | holds |
| §3.10 `𝔪_D` | `𝔽₇`, `q_w = 2`, `det = 1` | `2T² = 1` gives `T² = 4 = 2⁻¹`; NT21's printed exponent gives `T² = 2` and `2·2 = 4 ≠ 1` | the correction holds |
| §4.1 | `n = 2`, `p = 5`, `q_v = 11`, `Frob = diag(1, −1)`, inertia `(1+ε)I` | `11 ≡ 1 mod 5`; `(1+ε)⁵ = 1`; the eigenvalue −1 block is ramified | excluded here, allowed in GGD §8.5, as stated |
| §4.5 parity | `n = 1`, `[L⁺:ℚ] = 2` | `dim R_∞ − dim S_∞ = −[L⁺:ℚ]n(1 − (−1)^{n−µ})/2 = −2` if `µ ≢ n` | contradicts depth, so `µ ≡ n` |
| §4.7 | `l = n = 3` | `tr I₃ = 3 = 0` in `𝔽₃`, so scalars lie in `ad⁰` and `H⁰(H, ad⁰) ≠ 0` for every `H` | Tho12 Def. 2.3 never holds, as stated |
| §5.1 | `n = 1`; `F = ℚ(√−3)`, `l = 3` | reduces to class field theory; `ζ₃ ∈ F` is excluded | matches Tho12 Thm 7.1(v) |
| §5.2 | `𝔽₂`, `σ(c) = (1 1; 0 1)`; `σ(c) = 1` | `A = (1 1; 1 0)`, diagonal `(1, 0)`: not alternating, so strongly odd; `A = (0 1; 1 0)`: alternating | holds |
| §5.3 | `p = 2`, `n = 2`, `σ(c_v) = 1` at every infinite place | (v) fails, so the theorem says nothing | matches Tho17 Thm 5.1(v) (line 1009) |
| §6.2 | `n_i = 2` | multiplier `ε̄⁻¹`; ordinary weights `{0, 1}` | consistent |
| §6.3 | `n = 1` | `HT_τ(θ) + HT_{τc}(θ) = w`, so `H_{τc} = w − H_τ`; `l ≥ 2(d+1) = 4` gives `l ≥ 5` | matches BLGGT14 p. 45 |
| §7.2 route | `Γ′ ⊂ ker η` | `[Γ:Γ′] = ord η·[ker η : Γ′]`; for `n = 3`, `ord η = 3` gives an induction | the step is valid; the bound is sharp |
| §7.7 | `n₁ = n₂ = 1`; `S(B) = ∅` | `χ₁(Frob)^{n₂} = χ₂(Frob)^{n₁}` gives equality; `d₀ = 0`, bound `n[F⁺:ℚ]` | matches ANT20 Lemma 3.6 |
| §7.14 | `S₃ ⊃ C₃`, characteristic 0 | `Ind_{C₃}χ` is the standard representation; restriction `χ ⊕ χ⁻¹`; `C₃` has no subgroup of index 2 | needs `ρ(Γ₁) = ρ(Γ)`, as stated |
| §7.15 | `S₃` over `𝔽₅` and over `𝔽₂₅` | `\|𝔽₅^×\| = 4`: no character of order 3, so not induced; `3 \| 24`: induced over `𝔽₂₅` | coefficient dependence holds |
| §7.16 | `d = 3` | `\|µ₂³\| = 8`, acting through a quotient of order 4; `2³` is invertible for `l > 2` | consistent |
| §8.13 | `n_ṽ = 2`, `p = 5`; `R = ∅` | `x² = y²` in a pro-5 group gives `x = y`; bound `n[F⁺:ℚ] + n` | matches NT21 p. 72 |
| §9.4 | `p > 2`, `a = b = 0`, `ρ̄ = ω` | weight-zero semistable implies slopes 0, so `N = 0` and the representation is unramified; `ω` is ramified, so the ring is zero | the README's caveat is correct |
| §9.7 / §9.8 | `n = 1` | `H¹_f(F, ℚ_p) ⊂ Hom(Cl_F, ℚ_p) = 0` | vanishing holds, `P_{(𝔭′)} = E` |
| §10.1 | `N = 2`, `d = 1`, `µ` odd | `χ(c) = (−1)^{µ+N+1} = +1`, `δ = 1`; archimedean term `3` against `1`; `R_∞` short by `Nd = 2` | parity forced; consistent |
| §10.2 (D0) | `ξ_τ = (0, 4)`, `ξ_{τc} = (−4, 0)` | `(b − a) + 2 = 11`; README `ℓ ≥ 11`, LTXZZ `ℓ ≥ 13` | R01 |
| §1.2 Check | `n = 2`, `ρ̄` trivial, `q ≡ 1 mod l` | `diag(1, q)` lies on the unramified and Steinberg components; `N₁ = 0 ≠ N₂` | strong connection is needed in (3), as stated |

**Library declarations opened at the pins (18).**

Mathlib `1b1ccf4`:

- `Field.absoluteGaloisGroup` (`FieldTheory/AbsoluteGaloisGroup.lean:42`)
- `NumberField.IsCMField` (`NumberField/CMField.lean:70`)
- `cyclotomicCharacter` (`Cyclotomic/CyclotomicCharacter.lean:308`)
- `Representation.ind` (`RepresentationTheory/Induced.lean:77`)
- `ringKrullDim` (`KrullDimension/Basic.lean:29`)
- `RingHom.Finite` (`Finiteness/Defs.lean:174`)
- `Module.finite_of_surjective_of_ker_le_nilradical` (`Finiteness/NilpotentKer.lean:23`; it also needs `(ker f).FG`, which holds for Noetherian rings)
- `Ideal.finite_minimalPrimes_of_isNoetherianRing` (`MinimalPrime/Noetherian.lean:26`)
- `Ideal.primesOver` (`Ideal/Over.lean:379`)
- `IntermediateField.normalClosure` (`Normal/Closure.lean:48`)
- `IntermediateField.LinearDisjoint` (`FieldTheory/LinearDisjoint.lean:158`)
- `Group.IsSolvable` (`GroupTheory/Solvable.lean:145`)

Tau Ceti `2fd255d`:

- `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` (`Chebotarev/Density/Chebotarev.lean:51`)
- `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` (`SplitsCompletely/Basic.lean:74`)
- `TauCeti.ClassFieldTheory.geometricArtinMap`, `continuous_geometricArtinMap`, `isArithFrobeniusLift_inv_of_mk_eq_geometricArtinMap_uniformizer`, `geometricArtinMap_norm` (lines 68, 76, 112, 145)

All exist at the stated lines and namespaces.

**Cross-roadmap citations resolved (about 95 section ids across 13 roadmaps, at their open heads, on main or in the board package).**

- PotentialAutomorphyInfrastructure §§0.4, 2.3, 2.5, 3.44–3.48
- LocalGaloisDeformationRings §§0.3, 1.3, 1.7, 2.12, 2.18, 2.20, 2.23, 4.10–4.14, 6.8, F.2.11
- GlobalGaloisDeformations §§3.6, 4.1, 4.2, 4.4, 8.1–8.6
- ArithmeticGaloisRepresentations §§1.3, 1.12, 5.3, 7.4, 7.9, 7.10
- AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7
- IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1–1.4, 3b.1
- DeformationAndDerivedPatchingAlgebra §§1.9, 4.1–4.2, 5.4–5.6, 5.8, 6.1, 6.4–6.7
- ReductiveGroupsPartII RG2.2.1, RG2.2.4 (main)
- DerivedModuleAlgebra §§1.M.1–1.M.2 (main)
- Chebotarev Layer 10 (main, `Completed/`)
- ClassFieldTheory Layers 7 and 12 (main)
- ClassicalSerreModularity `R33.1/global-arithmetic-action`
- PotentialAutomorphyDworkMotivesPartII §§1.1–1.4, 2.3–2.7, 4.6, 5.6, 5.10–5.12, 6.8, 7.4, 7.7–7.10, 9.4 (board package)

**Declared gaps.**

- The 17 slugs in `design/plan.json` equal the 17 in the README, each stated under its supplier's subsection.
- `gap:barsotti-tate-components-general-base` is minimal: LocalGaloisDeformationRings §4.12 covers only `K₀ = ℚ_p`.
- `gap:enormous-image-taylor-wiles-primes` is minimal: GlobalGaloisDeformations §8.6 is the residual-enormous version with `p ∤ n` and `ζ_p ∉ F`.
- The remaining gaps are precise, apart from R04.

**Ownership.** `overlaps.md` lists no dropped ids. I compared the closest roadmaps by object: PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems (it owns rank two; acknowledged at line 66), ModularityAndLanglandsExtensions (R02), LocalGaloisDeformationRings, AutomorphicGaloisRepresentationsPartII and CompletedCohomologyAndLocalGlobalCompatibility (R03). OrdinaryAutomorphicFormsAndModularityLifting (rank-two quaternionic, Skinner–Wiles) and AlgebraicModularFormsAndSerreWeights (Katz forms) do not overlap.

## Not verifiable

- Source corrections the README asserts but I did not check:
  - the ANT20 Theorem 5.1 bound being one too small;
  - the factor `1/2` in Tho15 p. 70;
  - Tho12 Proposition 6.6's missing hyperspecial condition;
  - NT26 Definition 2.5(1) (`ι` against `ι⁻¹`);
  - the `∨(1 − n)` in Tho12 Theorem 6.5(i). This one needs CHT08's normalisation of `r_l`, which is not in the manifest.
- Results mentioned by name in routes, with no manifest entry, which I did not open: Kisin Cor. 2.5.16, Gee Prop. 2.3, Labesse Théorème 5.4 and Corollaire 5.3, CHT08, WWE19 Thm 2.5.5, Liu's theorem, Pink, Maire Prop. 19.
- §§10.3 and 10.5: the locators exist in the cached LTXZZ (Theorem 4.2.6, LTXZZ line 1880) and LLHLM23 (Theorems 7.3.2 and 9.2.1) texts. I compared the hypotheses of §10.3 with LTXZZ, but computed no numerical instance for either.

## Source issues

- **Gap** in Tho15 at proof of Proposition 5.3, p. 58: the source says that `r̄|Δ^{ss} ≅ (Ind ρ̄)^{ss}` together with primitivity of `r̄|Δ` forces `N′ = Δ`; it should be that a self-dual block-split lattice first turns the semisimplified induction into an actual induction; affects the proof.
- **Misprint** in Tho15 at Proposition 4.4, items 1(c) and 2(c), p. 37: the source says `σ_w ≅ π_w ∘ ι_w^{−1}`; it should be `σ_v ≅ π_w ∘ ι_w`; affects nothing.
- **Misprint** in Tho12 at Theorem 6.5(i), p. 35: the source says the comparison holds at every split `v ∉ S_l`; it should be `v ∉ S_l ∪ R`, since `π_v` is only an Iwahori representation at `R`; affects nothing.
- **Misprint** in ANT20 at proof of Lemma 3.6, p. 11: the source says it must show `dim A ≤ [F⁺:ℚ] − d₀`; it should be `n[F⁺:ℚ] − d₀`; affects nothing.
- **Gap** in ANT20 at Theorem 4.1, hypothesis 4, p. 15: the source says primitivity of `r̄_𝔪` over the residue field `k` suffices; it should be primitivity over `k̄`, or over a splitting field, since `S₃`'s standard representation is primitive over `𝔽₅` but induced over `𝔽₂₅`; affects the proof.
- **Gap** in NT21 at proof of Proposition 5.6, p. 71: the source says Theorem 5.2 bounds both blocks `R_{𝒮_i}`; it should be that Theorem 5.2 assumes `n ≥ 2` (§5 standing hypothesis), so a rank-one block needs a separate bound; affects the proof.
- **Misprint** in NT21 at §6, definition of `𝔪_D` before Lemma 6.6, p. 79: the source says `T_w^j − q_w^{j(j−1)/2} tr ∧^j r̄(Frob_w)`; it should be exponent `−j(j−1)/2`, matching Tho12 Proposition 6.6; affects nothing.
- **Error** in NT23 at Proposition 2.14, p. 13: the source says `Def^{[a,b]}_{D̄,S}` is represented by an object of `C_O`; it should be that the functor can be empty (for example `a = b = 0`, `ρ̄ = ω`, `p > 2`) and is then represented only by the zero ring; affects nothing.
- **Misprint** in BCG25 at proof of Theorem 3.1, p. 10: the source says "[Tho17, Thm. 7.1]"; it should be Tho17 Corollary 7.3 with Proposition 7.2, since Tho17 has no Theorem 7.1; affects nothing.
