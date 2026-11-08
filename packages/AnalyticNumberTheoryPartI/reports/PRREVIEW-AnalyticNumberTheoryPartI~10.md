# Review of AnalyticNumberTheoryPartI (pull request #1126 at 979e68c)

**Verdict:** needs changes

## R01 (P1) — §2.42's abelian bullet states a false factorization of `ζ_K`, and the section's own Check refutes it

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2023`: "For `K/ℚ` abelian, `ζ_K` is the product of the Dirichlet `L`-functions of the primitive characters of its conductor, so GRH for those characters implies ERH(`K`)."

**Claim.** As written, the factors are the primitive characters *of conductor* `f_K`. That leaves out the trivial character (`ζ` itself) and every character of smaller conductor, and it brings in primitive characters of conductor `f_K` that are nontrivial on the norm group of `K`. Both halves of the bullet are therefore false, including "GRH for those characters implies ERH(`K`)". The Check at README:2029 uses the correct factorization, `ζ_ℚ(i)=ζ·L(·,χ₋₄)`, which contradicts the bullet: `χ₋₄` is the only primitive character of conductor 4.

**Witness.** Take `K=ℚ(√5)`, of conductor 5. Its primitive characters of conductor 5 are `χ₅` and the two quartic characters `ψ, ψ̄`. At the split prime 11 the bullet's product has Euler factor `(1−11^(−s))^(−3)`, while `ζ_K` has `(1−11^(−s))^(−2)`. At the inert prime 2 the bullet gives `(1+2^(−s))^(−1)(1+4^(−s))^(−1)`, while `ζ_K` has `(1−4^(−s))^(−1)`. GRH for `χ₅, ψ, ψ̄` does not imply RH, and RH is part of ERH(`ℚ(√5)`).

**Repair.** Replace the bullet with: "For `K/ℚ` abelian of conductor `f`, `ζ_K=∏_χ L(s,χ*)` over the Dirichlet characters `χ` modulo `f` that are trivial on the subgroup of `(ℤ/f)ˣ` corresponding to `K`, with `χ*` the primitive character inducing `χ` (the trivial character included); so GRH for these `χ*`, together with RiemannHypothesis, implies ERH(`K`)." Tested: at `ℚ(√5)` the index set is `{1, χ₅}`, which gives `ζ·L(s,χ₅)`. At `ℚ(i)` it is `{1, χ₋₄}`, which agrees with the Check at README:2029.

## R02 (P2) — The Artin `L`-function and the conductor–discriminant formula are planned both here and in ArtinRepresentations (#1711)

**Location.** README:11: "It also owns … Artin and Swan conductors with their integrality, induction formula and conductor–discriminant formula (§2.2a); … finite-image Artin `L`-functions with their local factors, induction formula, one-dimensional comparison and Brauer continuation (§2.18a)". See also README:1288 (conductor–discriminant) and README:1636 (Brauer continuation). The README never mentions ArtinRepresentations.

**Claim.** The open new-roadmap pull request ArtinRepresentations (#1711, a different author) plans the same objects as its own targets:
- §3.4 (its README:971–995): the Euler product with induction invariance and the one-dimensional Hecke comparison;
- §4.1 (its README:1087–1107): "Existence is Brauer induction …", the pole of order `dim V^G` at 1, and the finite nonzero limit of `(s−1)^(dim V^G)L`;
- §5.1 (its README:1241–1262): the conductor–discriminant formula.

It cites this roadmap only for §§2.31, 2.39 and 2.41 (its README:183, 1720, 2091). It takes the local factors from AdelicAlgebraicGroups AA.2.4. At AdelicAlgebraicGroups' head (#792, README:77–80) that target reads "Moved: AA.2.4 finite-image Artin functions … → AnalyticNumberTheoryPartI §2.18a".

The two roadmaps therefore own one object between them. LFunctions on main also assigns Artin `L`-functions to "a future `ArtinRepresentations` roadmap" (`TauCetiRoadmap/LFunctions/README.md:203`), and this README does not address that assignment.

**Witness.** ArtinRepresentations consumes §§2.31, 2.39 and 2.41 from here, so the dependency check places it after this roadmap (it is not yet in ORDER.txt). ArithmeticGaloisRepresentations (#856, README:679) and AdelicAlgebraicGroups (#792, README:281) already consume §§2.2a and 2.18a from here. The single owner therefore has to be this roadmap: moving ownership to ArtinRepresentations would create a cycle.

**Repair.** In Scope and ownership, add one sentence: "ArtinRepresentations transports §2.18a's Artin function (local factors, induction, Brauer continuation, order `dim V^G` at 1) and §2.2a's conductor–discriminant formula to its carrier `ArtinRep F V`; it does not construct them again. LFunctions' deferral of Artin `L`-functions to that roadmap is settled this way." Add ArtinRepresentations, AdelicAlgebraicGroups and ArithmeticGaloisRepresentations to Downstream consumers (README:3395) with the sections they take. The matching change in #1711 replaces its §4.1 existence proof and its §5.1 with citations of §2.18a and §2.2a; it is reported here so that both reviews settle on the same split.

## R03 (P3) — §2.3a plans what LFunctions on main reserves for "LFunctions, Part II", and the README does not say so

**Location.** README:11: "Hecke's continuation and functional equation for every unitary idele-class character, by Hecke's theta method (§2.3a)". README:75: "§2.3a extends Hecke's method to continuous infinity types."

**Claim.** LFunctions on main lists exactly this object under "Not owned here" and names its owner: the `L`-functions of non-algebraic Hecke characters, with real frequencies `|x_w|^(i q_w)` and Neukirch VII (8.5), belong to "LFunctions, Part II, which starts from Layer 6 here". No such roadmap exists, so nothing is duplicated. But a future LFunctions Part II written to main's plan would duplicate §2.3a, and the README gives that author no pointer.

**Witness.** `TauCetiRoadmap/LFunctions/README.md:204–210` and `:1324` ("… its L-function, kernel and gamma shifts are LFunctions, Part II").

**Repair.** In Scope and ownership, state: "§2.3a is the continuous-infinity-type extension that LFunctions (Not owned here) assigns to 'LFunctions, Part II'. It is owned here, and a later LFunctions Part II imports it." Alternatively, move §2.3a into an LFunctions Part II roadmap placed before this one.

## R04 (P3) — §1.1 restates §0.33, omits it from *Needs:*, and its locator neither states the bound nor avoids copying

**Location.** README:920: "For all real `t, |Zinv(1+2it)|≤C log(2+|t|)` …". README:924: "See [60][R60], Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for `ζ(2s)`'); [60][R60], Proof of Proposition2, p.969, sentence preceding (6.7)." README:926: "*Needs:* [ZerosOfLFunctions Classical high-height zero-free region][R16]."

**Claim.** §0.33 (README:846) already proves that `R=1/ζ` extends analytically across 1 with `R(1)=0` and `|R(s)|≤C log(|Im s|+2)` on a strip containing `Re s=1`. §1.1 is that statement at `s=1+2it`, yet its *Needs:* line names only the zero-free region. The locator is given twice. It quotes a ten-word source phrase verbatim, and the cited sentence only appeals to "standard estimates" without stating the bound.

**Witness.** `dit2016` line 776 is the quoted sentence, which states no bound for `1/ζ`. §0.33 at width `β` gives `|Zinv(1+2it)|≤C log(2|t|+2)≤2C log(2+|t|)`, and `Zinv(1+2it)∼2it→0`.

**Repair.** Restate §1.1 as the specialization of §0.33 to `Re s=1`, with *Needs:* §0.33. Cite §0.33's locator ([59], Appendix A, Lemma A.1) for the bound and DIT p.969 only for its use. Delete the quotation and the duplicated locator.

## R05 (P3) — §2.3a cites Kedlaya §§22.1–22.2 "for the Euler product", but Kedlaya treats no Hecke `L`-function

**Location.** README:1345: "See [98], Chapter VII §§6–8, especially (8.5); [53][R53], §§22.1–22.2 for the Euler product."

**Witness.** `kedlayaant` lines 5329–5373: §22.1 covers Frobenius elements of `K/ℚ`, and §22.2 covers the incomplete Artin `L`-function over `ℚ`. The only mention of Hecke or ray-class characters in the whole text is line 5425 ("write σ as a ray class character. See [14]").

**Repair.** Drop the Kedlaya citation from §2.3a. The Euler product of a unitary Hecke character is Neukirch VII §8 (already cited), or LFunctions Layer 5 for the finite-order case.

## R06 (P3) — Several definitions have fewer than three discriminating Checks

**Location and claim.**
- §0.2 (README:198–201) covers `thetaAP`, `psiAP` and `primeCountAP` with two Checks, both about `θ`. `psiAP` and `primeCountAP` have none.
- §2.1a `besselK` (README:1196–1199) has two Checks.
- §3.20 `smoothCount` (README:2510–2513) has two, both degenerate ("0 is never counted", `Ψ(0,2)=0`). Neither separates the inclusive cutoff `p≤y` from the library's strict one.
- §0.29's `IsCenteredOrderOne` (README:730) has no Checks block.
- §2.1c (README:1241) has two.

**Witness (computed checks to add).**
- `psiAP 10 1 4 = log 5 + log 3 = log 15`: `Λ(9)` lands in class 1 although `3≡3`. `primeCountAP 10 3 4 = 2` (primes 3, 7). `psiAP 4 0 2 = 2 log 2`, against `thetaAP 4 0 2 = log 2`.
- `besselK (3/2) 1 = 2√(π/2)e^(−1) = 0.9221`; numerically `besselK (3/2) (2π) = 0.00108233`. A kernel without the factor `1/2` doubles both.
- `smoothCount 10 2 = 4` ({1,2,4,8}) and `smoothCount 10 3 = 7`. `smoothCount 5 5 = 5`, whereas a strict cutoff `p<y` gives 4.
- `IsCenteredOrderOne`: `exp z` and every polynomial satisfy it; `exp(z²)` fails at `ε=1/2`.

**Repair.** Add these as Checks bullets in §§0.2, 2.1a, 3.20 and 0.29, and a third Check in §2.1c, for example the length `2 log ε_5 = 4 log((1+√5)/2) = 1.9248` at `D=5`.

## R07 (P3) — Four declarations of `Suggested.lean` are not named in the README

**Location.** `Suggested.lean:730–747` declares `zamanDelta`, `zamanG₁`, `zamanG₂` and `zamanQ`. README §2.9a (line 1453) describes `δ, G₁, G₂, W₁, W₂, Q` in prose but never names the Lean declarations.

**Witness.** A scan of every declaration of `Suggested.lean` against the README text finds exactly these four missing. Every other declaration name (106 of 110) appears in the README.

**Repair.** In the `ZamanDigammaInput` bullet, write "`δ` (`zamanDelta`), `G₁` (`zamanG₁`), `G₂` (`zamanG₂`) and `Q` (`zamanQ`)".

## R08 (P3) — Garbled sentences and one undefined label

**Location and repair.**
- README:1426: "The `caseD_k=1` is outside …" → "The case `D_k=1` is outside …".
- README:2056 and README:2068: "with the same degree-uniform constants, Use the canonical …" and "…, For each `ρ∈F(E)` …" are two sentences run together; split them.
- README:2397 and 2399: "`0≤u≤Nat`.`√(N−4)`" → "`0≤u≤Nat.sqrt(N−4)`".
- README:2425: "the left side islog2/2, independent ofa" → "the left side is `(log 2)/2`, independent of `a`".
- README:2118: "under DedekindERH it has `norm≪(log D)²`" uses a label that §2.42 never defines → "under ERH(`L`) …".
- The stray ".;" at README:1426, 1497, 1942, 2044, 2092, 2106, 2120 and 2409 → ";".

## R09 (P3) — Not repaired: the pull-request description still lists 30 open pull requests as dependencies

**Location.** The description: "Dependencies (cited in the README by roadmap name and section …). In open pull requests of ours: #1227 (StableHomotopyKTheory), … #925 (AutomorphicSpectralTheory)". The merge-order paragraph places AnalyticNumberTheoryPartII and SieveMethodsAndPrimePatterns before this pull request.

**Witness.** None of the 30 listed roadmaps occurs in the README. AnalyticNumberTheoryPartII and SieveMethodsAndPrimePatterns, which the merge-order chain puts before this pull request, occur only as consumers (README:3395, 3400–3401). ORDER.txt lists AnalyticNumberTheoryPartI at line 49 and AnalyticNumberTheoryPartII at line 50. The dependency check shows every supplier on main (below).

**Repair.** As in the previous round: list the README's actual suppliers, all on main (ArithmeticDirichletSeries, ImaginaryQuadraticClassNumber, LFunctions, ZerosOfLFunctions, GlobalNumberFields, NumberFieldArithmetic, ClassFieldTheory, LocalFieldsRamification, RepresentationTheory, FuchsianOrbifolds, DifferentialGeometry, IntegralLattices, Multiquadratic, ContourIntegration, Chebotarev), and drop the merge-order chain.

## Verified sound

**Previous review (at e22e67a), finding by finding.**

| Id | Status at 979e68c | Evidence |
| --- | --- | --- |
| R01 | repaired | `landau_page_bounded_height` (Suggested.lean:129), `character_psi_le` (:139), `quadratic_prime_character_interval_le` (:151), `real_quadratic_classNumber_mul_regulator_ge` (:781); README §2.13 adds "the identity `h⁺(D)log ε_D=2hR`" (line 1519) |
| R02 | repaired | `quadratic_character_eq_fundamentalDiscriminantChar` (:69), "`χ (n : ZMod q) = TauCeti.Multiquadratic.fundamentalDiscriminantCharCast ℂ D hD …`" |
| R03 | repaired | `besselK_neg` and `besselK_one_half` deleted; `besselK` is used by `completed_eisenstein_fourier` (:604) |
| R04 | repaired | README:5 no longer has "Other API names below specify library targets"; a scan of 379 backticked identifiers finds none of this roadmap's own undeclared (22 hits are notation such as `B_g` or supplier names, all resolved below) |
| R05 | repaired | All 38 relative links resolve, anchors included, against main (scratch script); README:84 now describes 6.3's predicate as main states it |
| R06 | repaired | README:15, 3399 "QuadraticCharactersAndReduction §1.4"; its head (#1904) has §1.4 consuming `quadratic_character_kronecker` (its README:121, 135) |
| R07 | repaired | (a) README:1646 cites `cogdellartin` p.12 and p.18 and limits Kedlaya to what it covers; (b) README:547 cites Ramaré–Rumely Theorem 1 and Table 1 |
| R08 | repaired | No "authorized", "ES.0" or "previously external"; the labels KP, LOW, CKMP, GHS, BMOR, ADS and GNF no longer occur as bare labels |
| R09 | not repaired | Raised again as R09 above |

**Gate, build, form.**
- The worker's gate at this head reports every check passed (`build=0 … OK`). Nothing changed outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty), and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` exits 0, with exactly 60 ``declaration uses `sorry` `` warnings and nothing else.
- One-tactic probe: in a scratch copy, every `sorry` was replaced by `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial`. Exactly 60 errors resulted, at 60 distinct lines, so no theorem closes in one tactic and nothing is padding.
- Binder check: all 110 declarations were elaborated with `#check @name` in one scratch file. Only `section Hecke`'s `{K} [Field K] [NumberField K]` is inherited, by `heckeFiniteFactor`, `heckeArchFactor`, `heckeConductorScale` and `heckeContinuation`, which is intended. `lowerConductors_integral` carries `IsDiscreteValuationRing`, `IsAdicComplete`, `PerfectField` of the residue field and `FaithfulSMul`, as README:1283 states. No binder was lost.
- Dependency check (re-run): `depcheck: 238 roadmaps, 2348 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `TauCeti.Multiquadratic.fundamentalDiscriminantCharCast` (`NumberTheory/Multiquadratic/FundamentalDiscriminant/Realization.lean:32`, defined as `ringHomComp` of the ℤ-valued character);
  - `fundamentalDiscriminantChar` (`…/Character.lean:38`, `kroneckerChar ℤ D`);
  - `fundamentalDiscriminantChar_neg_one` (`:76`, value `D.sign`, which fixes `D=χ(−1)q`);
  - `DirichletCharacter.conductor_eq_of_eventually_apply_prime_eq` and `IsPrimitive.apply_eq_of_eventually_apply_prime_eq` (`NumberTheory/DirichletCharacter/PrimeValues.lean:86, 115`).
- Mathlib: `Int.IsFundamentalDiscr` (`NumberTheory/FundamentalDiscriminant.lean:41`).
- No pinned declaration classifies primitive real characters, so §0.34a duplicates nothing.

**Cross-roadmap citations resolved.**
- IntegralLattices Layer B with B2, B4 and B5 is in the active README on main (`TauCetiRoadmap/IntegralLattices/README.md:1031`, items at relative lines 52, 201, 245).
- LFunctions Layer 5's `eulerCorrection` is at its README:1059.
- ZerosOfLFunctions 6.3 is at its README:1075, and 6.4's part (4d) is present.
- ImaginaryQuadraticClassNumber `quadratic_LFunction_siegel` and `imaginary_classNumber_lower_bound` are at its `Suggested.lean:56, 63`.
- FuchsianOrbifolds Layers 2, 3 and 6 are at its README:235, 263, 344; DifferentialGeometry Layers 5, 5.6 and 12 at its README:503, 535, 910.
- Supplier names `OrderLE`, `entireCompletion`, `doubleCosetEquiv`, `narrowClassToClass` and `dedekindZetaC_quadratic` were each found in the cited roadmap on main.

**Ownership against open work.**
- AdelicAlgebraicGroups (#792, README:77–80, 281) and ArithmeticGaloisRepresentations (#856, README:679) consume §§2.2a and 2.18a from here.
- ZerosOfLFunctions at #1913 (README:1812–1816) defers the exception-free forms over `ℚ` to this roadmap.
- ErdosProgressionPowers (#1336, 39 citing lines), SieveMethodsAndPrimePatterns (#1495, 57), ExplicitZetaBounds (#1954, 27), ExplicitNumberFields (#1944, 47; Louboutin's first bound consumed, its README:87) and AnalyticNumberTheoryPartII (#1167, 32) cite this roadmap and do not restate its targets.
- The only second owner found is ArtinRepresentations (R02).
- `overlaps.md` reports no other pull request changing this roadmap and no dropped id; I confirmed both.

**Seeded sample (15 targets, read at the locator).** Ids other than the manifest's are entries of a scratch manifest; this review edited no manifest. `bennettsiksekannals` is arXiv 1709.01022v1, `yunzhang2017` is arXiv 1512.02683v3, and `dit2016` is the authors' UCLA preprint. Their statement numbers agree with the README's, but their pages differ from the Annals pages it cites (see Not verifiable).

| Target | Source read | Result |
| --- | --- | --- |
| 0.1 | `bennettsiksekannals` lines 772–783 (Prop 7.1(ii): at most one real `β` in `1−c*/log N<β<1`, simple, real character); `openai2026lspdf` lines 23–25 (Theorem 1) | supported; emptiness from Theorem 1 |
| 0.8 | `bennettsiksekannals` lines 1278–1284 (§9 applies RS Theorem 6); RS itself not readable | locator plausible; inequality recomputed (row 3) |
| 0.15 | `yunzhang2017` lines 5243–5266 (`E_n` and (B.1)–(B.2)); Rudin not readable | definition matches `elementaryFactor` |
| 0.21 | Koukoulopoulos not readable | constant recomputed (row 6) |
| 0.30 | `milnecft` lines 6627–6638 (Example 1.4, p.149: `Q_(m,1)` positive rationals), 6660 (Theorem 1.7, exact sequence, p.150) | supported |
| 1.1 | `dit2016` lines 776–778 (Prop 2 proof, (6.7)) | statement true, but locator unsupportive (R04) |
| 2.3 | LFunctions Layer 5 (`eulerCorrection`, README:1059); ArithmeticDirichletSeries Layer 3 (link resolves) | supported |
| 2.3a | Neukirch not readable; LFunctions main README:209 names "Neukirch VII (8.5)" for the same object; `kedlayaant` §22 | Kedlaya locator wrong (R05) |
| 2.28 | `kedlayaant` lines 5370–5373 (p.128: `|1−det(…)^(−1)|=O(p^(−s))`, uniform on `Re s≥1+ε`, nonvanishing) | supported (over `ℚ`; the number-field case is the same estimate) |
| 2.31 | `kedlayaant` lines 5417–5421 (Theorem 22.4, p.129) | supported, `K/ℚ` as stated |
| 2.37 | `dit2016` lines 553–566 (Theorem 3, third case `2√π ω_D^(−1)E*(z_A,s)`), 906–909 (after "By (7.6) … D<0") | supported; recomputed (row 15) |
| 2.40 | `grosszagier1986` lines 915–927 (p.248: `E(z_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ(A,s)`, `u` half the units) | supported; recomputed (row 16) |
| 2.42 | `kedlayaant` lines 2827–2843 (Conjecture 10.4, Remark 10.5, p.61) | definition supported; abelian bullet false (R01) |
| 3.21 | `hildebrandtenenbaum1993` lines 147–151 (p.414, Dickman, (1.5)–(1.6)), 469–479 (Lemma 2.5, p.426: (2.11)–(2.13)) | supported |
| 3.31 | `ghoshsarnak` lines 125–130 (p.3: the three families, count `∼C′K/√log K`), 506–517 (§4.1, pp.12–13) | supported; `C′` is the roadmap's own and is recomputed (row 21) |

Also re-read: `cogdellartin` lines 514–560 (p.12: Artin's factor on `V^(I_P)` at every prime, additive, inflation, inductive) and 832–845 (p.18: Brauer's integral induction and meromorphy), which support §2.18a.

**Adversarial table (values computed).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | §0.34 `landau_siegel_exclusion` | `q=3`, `β≤1/2`; combination at `X=q^C` | `(1−β)log3≥0.549`; `(C/4−1−A−AC²δ)log q≤B+K_C`, so with `C≥8(1+A)` and `δ<1/(16AC)` the left side is `≥(C/16)log q` | holds |
| 2 | §0.34c `inert_prime_sum_le` | `C=12, 15` | `(1+1/C)(2/3+1/(2C))=0.7674>3/4` at 12; `0.74667≤3/4` at 15 | holds with `C₀≥15` |
| 3 | §0.8 | `x=319, 320, 10³, 10⁵, 10⁷` | `Σ(log p)/p−log x=−1.247219, −1.250348, −1.298245, −1.328631, −1.332395` against upper `E+1/(2log x)=−1.245855, −1.245902, −1.260200, −1.289153, −1.301561` and lower `−1.419310, …, −1.363603` (`E=−1.3325823`) | holds (margin 0.0014 at 319) |
| 4 | §0.9 `quadratic_LFunction_one_lower_bound` | `χ₋₃, χ₋₄, χ₅, χ₈, χ₋₁₆₃` | `L(1)=0.6046, 0.7854, 0.4304, 0.6232, 0.2461`; `c≤L(1)log q=0.6642, 1.0888, 0.6927, 1.2960, 1.2534` | holds |
| 5 | §0.6 `landau_page_bounded_height` | `T=2, 3, 4` | `T=2`: only `q=1` (`ζ`, first zero 14.13); `T=3`: `χ₋₃` first zero 8.04; `T=4`: `χ₋₄` first zero 6.02; `log(q(|t|+2))≤3log T` since `T+2≤T²` | holds |
| 6 | §§0.21, 0.26a | `x=4, 10², 10⁴, 10⁶` | `Σ_(n≤x)Λ(n)/(n log n)−loglog x−γ=+0.0545, −0.0092, +0.000164, −0.000029` against `1/log x=0.72, 0.22, 0.11, 0.072`; `γ+Σ_(p≤10⁶)(log(1−1/p)+1/p)=0.2614972` against `B=0.2614972` | holds |
| 7 | §0.18 `character_psi_le` | `χ₋₃`, `X=10`; `N≥3` | `Σχ(m)Λ(m)=log(7/10)=−0.357`; `(log N)⁴≥1.456`; absorbed term `≤1.38×` the error | holds |
| 8 | §0.28 `quadratic_prime_character_interval_le` | `Δ=−4` on `(2,30)`; `Δ=1` | `−1+1−1−1+1+1−1−1+1=−1`; `Δ=1` would give `π(v)−π(u)`, which is excluded | holds |
| 9 | §0.34a both theorems | `q=3, 4, 8, 12` | `D=−3, −4, ±8, 12`; `χ₁₂(5)=(12/5)=−1=χ₋₃(5)χ₋₄(5)`; `fundamentalDiscriminantChar(−1)=D.sign` | holds |
| 10 | §0.15 `elementaryFactor`, `exists_entire_primary_product_exact` | `w=−1`; real `w∈[−1,1]`; `a=(1,1)`, `p=(0,0)`; empty `ι` | `E₀,E₁,E₂(−1)=2, 0.73576, 1.21306`; `max|1−E_p(w)|/|w|^(p+1)=1.0` for `p≤3`; `F=(1−z)²`, order 2; `F=1` | holds |
| 11 | §0.23 `finite_order_hadamard` | `exp(z²)`, `sin z`, `(z−1)²` | `deg P=2=⌊2⌋`; genus 1 with `Σ(kπ)^(−2)<∞`; repeated zero | holds |
| 12 | §0.29 `pairedHadamard_*` | `cosh`, `z cosh z`, `1+z²`, `−cosh` | `m=0, δ=1`; `m=1, δ=−1`; `(1+z²)⁗=0` (excluded by `hnonpoly`); `−cosh` excluded by eventual positivity | holds |
| 13 | §0.11d | `x=4, 2, 1` | `log24=3log2+log3=3.1781`; `0.6931≤0.7329`; `0≤0` | holds |
| 14 | §2.1b `completed_eisenstein_fourier` | `z=i`, `s=2` and `s=3` | `E*(i,2)=0.3053218647`, constant terms `0.3009755691`, difference `0.0043462956`, series `0.0043462956`; `s=3`: difference `0.0058383027`, series `0.0058383027` | holds (to 10 digits) |
| 15 | §2.37 | `D=−4`, `s=2` | `Λ_DIT(2,χ₋₄)Λ_DIT(2,χ₁)=0.54116891` against `(2√π/ω₋₄)E*(i,2)=0.54116891` | holds |
| 16 | §2.40 | `D=−4`, `s=2` | `ζ_ℚ(i)(2)=1.50670301` against `ζ(4)E(i,2)/2=1.50670301` | holds |
| 17 | §2.1a `besselK` | `ν=1/2, x=1`; `ν=±1/2, x=2`; `ν=3/2, x=2π` | `0.46106850` against `√(π/2)/e=0.46106850`; `0.11993777` both; `0.0010823277` against closed form `0.0010823277` | holds |
| 18 | §2.42 abelian bullet | `ℚ(√5)` at 11 and 2 | Euler exponents `−3` against `−2`; `(1+2^(−s))^(−1)(1+4^(−s))^(−1)≠(1−4^(−s))^(−1)` | **fails** (R01) |
| 19 | §2.28a | `d=2`, `α=±1`, `t=θ=1/2` | `|A⁻¹|=1.333≤4`; `|A⁻¹−1|=0.333≤4` | holds |
| 20 | §2.31 | `ℚ(i)/ℚ`, trivial and `χ₋₄` | `ζ(1−2^(−s))`: pole order 1 `=dim V^G`; `L(χ₋₄)`: order 0 | holds |
| 21 | §3.31 | `K=13`; `K=2·10⁵` | union `{1,2,4,5,8,9,10,13}`, 8 elements; ratios to `K/√log K`: union 1.2252, `A` 0.8114, `B` 0.6783, `A∩B=15143` (0.2645) against `K/log K=16385`; `C_L=0.764224`, `C_E=0.638909`, `C′=1.403133` | consistent (slow convergence) |
| 22 | §3.21 `smoothCount_dickman` | `u=2, 3`; `x=10⁶` | `ρ(2)=1−log2=0.30685`; `ρ(3)=0.048608`; `2ρ(2)=∫₁²ρ=0.6137`; `Ψ(10⁶,10³)/10⁶=0.3443` | holds (asymptotic) |
| 23 | §2.13 `real_quadratic_classNumber_mul_regulator_ge` | `D=5, 8, 12` | `hR=0.4812, 0.8814, 1.3170`; `√D/log D=1.3893, 1.3602, 1.3941`; `c≤0.3464` | holds |
| 24 | §2.15 `dedekindZeta_residue_le` | `ℚ(i)`, `ℚ(√5)`, `ℚ(√−3)` | `0.7854≤1.8842`; `0.4304≤2.1875`; `0.6046≤1.4931` | holds |
| 25 | §2.3a `heckeContinuation` | `K=ℚ, ω=1`; `|·|^(it)` | `Λ_H=completedRiemannZeta`, orders −1 at 0 and 1, `W=1`; `W(|·|^(it))=|D_K|^(−it)` from the Dedekind equation; norm-twist clause consistent under `χ₁=χ₂|·|^(iu)` | holds |
| 26 | §2.2a `lowerConductors_integral` | `ℚ₂(i)/ℚ₂` | `G₀=G₁=G`, `G₂=1`: Artin `1+1=2`, Swan 1 | holds |
| 27 | §3.41 `restricted_sathe_selberg` | `x=14` | `r=1`: {2,5,13}; `r=2`: {10} | holds |
| 28 | §1.5 `dirichlet_polynomial_mean_square` | `N=2`, `a=(1,1)` | error `4|sin(T log2)|/log2≤5.771≤6π·3=56.55` | holds |
| 29 | §1.1 (R04) | `t→0` | `Zinv(1+2it)∼2it→0`; the bound is §0.33's `|R|≤C log(|Im s|+2)` | true, duplicated |
| 30 | §1.6 `DirichletGRH`, `psiAP_isBigO_of_dirichletGRH` | `q=1` | `DirichletGRH 1 ↔ RiemannHypothesis`; `(1−2^(−s))ζ` zero at `2πi/log2` excluded by `0<Re s` | holds |

## Not verifiable

- Rosser–Schoenfeld, Illinois J. Math. 6 (1962), Theorems 1, 5, 6 and 11 (§§0.3, 0.5, 0.8, 0.19, 0.25). The sources service found no PDF link on the Project Euclid landing page for DOI 10.1215/ijm/1255631807. §0.8's inequality was recomputed (row 3).
- Koukoulopoulos, *The Distribution of Prime Numbers* (§0.21 Theorem 3.4(b), and §§0.11, 0.26, 0.30a, 3.22): a paywalled AMS textbook with no copy on this worker. The statements were recomputed (row 6).
- Rudin, *Real and Complex Analysis*, Theorems 15.6 and 15.9 and Lemma 15.8 (§0.15), and Neukirch, *Algebraic Number Theory*, VII (8.5) (§2.3a): paywalled books.
- Printed Annals pages of Bennett–Siksek (pp.373–374, 384), Yun–Zhang (p.901) and Duke–Imamoḡlu–Tóth (pp.964–972): the Annals host is in no licence class for the sources service. I read the arXiv or author versions, whose statement numbers (Prop 7.1, Theorem 5, Appendix B.1, Prop 2, (6.7), Theorem 3, (7.1)–(7.8)) match the README's.
- Ownership against open pull requests was checked through `roadmaps show` and the sibling checkouts listed in the brief. Every open roadmap in the overlap tool's vocabulary list was read.

## Source issues

- **Misprint** in kedlayaant at the proof of Theorem 22.3, p.129: the source says the linear combination should have a character that is nonvanishing except on the given conjugacy class; it should say the character vanishes except on that class (is supported on it), as the next sentence uses; affects nothing.
