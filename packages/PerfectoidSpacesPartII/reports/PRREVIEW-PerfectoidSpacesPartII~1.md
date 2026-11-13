# Review of PerfectoidSpacesPartII (pull request #2286 at d8879ce)

**Verdict:** needs changes

## R01 (P1) — two prerequisites are neither supplied nor declared gaps

**Location:** `TauCetiRoadmap/PerfectoidSpacesPartII/README.md` lines 397 and 423: "What PerfectoidSpaces must provide (gap:complete-almost-nakayama): …" and "What PerfectoidSpaces must provide (gap:principal-almost-flatness): …"; consumed at lines 1580–1581, 1588, 2095–2096, 2105, 2235, 2239–2240, 1912, 2312–2313.

**Claim:** §3.3, §4.4 and §4.7(3) take the almost Nakayama lemma for complete modules and the principal almost-flatness criterion from PerfectoidSpaces P0.26 and P0.11.

**Witness:** `TauCetiRoadmap/PerfectoidSpaces/README.md` on main, line 3168, has *almost-nakayama* for tight ideals only; P0.11 (line 1714) has no gluing criterion along `f`. The board plan `packages/PerfectoidSpacesPartII/design/plan.json` has `"gaps": []`.

**Repair:** Own both statements here; their proofs and controls are already written at lines 397–443. Move the first into §3.3 as target *complete-almost-nakayama* (GR, Lemma 5.3.3, p. 111) and the second into §4.4 as target *principal-almost-flatness* (GR, Lemma 5.2.1, pp. 106–107); delete the two "What PerfectoidSpaces must provide" paragraphs; in the `*Needs:*` and Dependencies lines of §3.3, §4.7 and Layers 3–4 replace "PerfectoidSpaces P0.26, gap:complete-almost-nakayama" by "§3.3 (*complete-almost-nakayama*); PerfectoidSpaces P0.27", and in §4.4 and Layer 4 replace "PerfectoidSpaces P0.11, gap:principal-almost-flatness" by "§4.4 (*principal-almost-flatness*); PerfectoidSpaces P0.11". The alternative, both slugs entered in the plan's `gaps` with supplier PerfectoidSpaces, leaves the README as it is.

## R02 (P2) — the proof sketch of §5.9 follows the source's proof sentence by sentence

**Location:** `README.md` lines 2736–2744: "Let `P` be a finitely presented `A°_∞0`-module and `N ⊆ ker(P → P ⊗ A°_∞∞)` finitely generated, hence finitely presented. … thus `N` is almost zero and its annihilator `I` contains `K°°_∞`."

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18B lines 552–562: the same nine steps in the same order with the same letters (`P`, `N`, `I`, `I_j`, the choice `M = A°_{j0}/I_j`); the README passage is its translation.

**Repair:** Replace lines 2736–2744 by:

> *Proof sketch.* Reduce to the top of the tower: for all `j, l` the composite `A°_{j0} → A°_jl → A°_∞∞` equals `A°_{j0} → A°_∞0 → A°_∞∞`, whose first map is faithfully flat (§5.4); once `A°_∞0 → A°_∞∞` is pure, the composite is pure and so is its first factor (§5.1). For the top map, test purity on a finitely presented `A°_∞0`-module `P` and an element `x ∈ P` that dies in `P ⊗ A°_∞∞`. Almost purity (§5.8 with §5.2; the map to the completion factors through `A°_∞∞`) puts `K°°_∞` inside `Ann(x)`. Since `A°_∞0` is a directed union of Noetherian rings along finite free maps it is coherent, so `Ann(x)`, the kernel of `a ↦ ax`, is finitely generated and is extended from an ideal `I_j` of a finite stage. Krull detection (§5.3) for the local ring `A°_{j0}`, the module `A°_{j0}/I_j`, the faithfully flat algebra `A°_∞0` and its idempotent ideal `A°°_∞0` (§5.5), whose preimage contains `p ≠ 0`, gives `I_j = A°_{j0}`, hence `x = 0`. For finite `j, l` the pure finite extension `A°_{j0} → A°_jl` of Noetherian rings has finitely presented cokernel, hence splits (§5.1).

## R03 (P2) — the proof sketch of §2.9 translates the source's proof

**Location:** `README.md` lines 1413–1416: "The image of `f` in `B{f/ϖ^i}^u` has norm at most `|ϖ|^i`, so it vanishes in the uniform colimit, and … colimits preserve epimorphisms, so the two triangles commute and give inverse isomorphisms."

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 1386–1394: the same four clauses in the same order (norm bound, the quotient identity, two commuting triangles, epimorphisms preserved by colimits), about 45 words in translation; the triangles belong to a diagram the README does not have.

**Repair:** Replace the first two sentences of the sketch by:

> *Proof sketch.* Write `C = ucolim_i B{f/ϖ^i}^u` and `Q = (B/fB)^u`. In `Q` the image of `f` is `0`, so `f/ϖ^i` is power-bounded there for every `i`, and the universal properties of the tubes (§2.5) and of the uniform colimit (§2.7) give a map `C → Q` under `B`. In `C` the image of `f` is `ϖ^i` times a power-bounded element for every `i`, so its spectral norm is `0`, and `B → C` factors through `Q` by the universal property of the uniformized quotient. `B` has dense image in `C` and in `Q`, so both composites, being maps under `B`, are identities.

## R04 (P2) — §5.1 reproduces the clause lists of two lemmas of the source

**Location:** `README.md` lines 2338–2345: "Prove, after Lazard: `M ⊆ N` is pure iff `Hom(P, N) → Hom(P, N/M)` is surjective for every finitely presented `P`; … iff `S` is a generator, the dual in the generator criterion being `Hom_R(S, R)`."

**Claim:** The list of purity facts is the roadmap's own selection and arrangement.

**Witness:** ANDRE18B lines 840–850 (Lemme A.1.1 (1)–(6)) and 868–877 (Lemme A.2.1 (1)–(4)): the README sentence runs through the same thirteen clauses in the same order; lines 2360–2371 then state most of them again.

**Repair:** Delete the run from "Prove, after Lazard:" to "being `Hom_R(S, R)`." and write "Prove the facts of the API below (André B, Lemme A.1.1, p. 89, and Lemme A.2.1, p. 90)." Add to the API list the facts it lacks, grouped as the roadmap uses them:

> - A submodule `M ⊆ N` is pure iff every map from a finitely presented module to `N/M` lifts to `N`, iff the inclusion is a filtered colimit of split injections; a pure inclusion induces injections on `Tor_i^R(P, −)` for every `P` and `i`.
> - A map of `S`-modules that is pure over `S` is pure over `R`; `R → S` is pure iff `− ⊗_R S` is faithful on `R`-modules; pure ring maps are closed under products; if `R → T` is flat and factors as `R → S → T` with `S → T` pure, then `R → S` is flat.
> - In the generator criterion the dual is `Hom_R(S, R)`.

## R05 (P3) — a Check of §2.1 gives a false reason

**Location:** `README.md` lines 1049–1050: "no Gaussian integer outside `ℤ` has a power `3ⁿ` in `ℤ` either, since its argument is not a rational multiple of `π/3ⁿ`".

**Claim:** A Gaussian integer outside `ℤ` has argument not a rational multiple of `π/3ⁿ`.

**Witness:** `i` has argument `π/2 = (3ⁿ/2)·(π/3ⁿ)`, a rational multiple, and `i^{3ⁿ} = ±i ∉ ℤ`.

**Repair:** "…either: `z^{3ⁿ}` is real only if `arg z` is an integer multiple of `π/3ⁿ`, and an argument of a Gaussian integer that is a rational multiple of `π` is a multiple of `π/4`; `kπ/4 = mπ/3ⁿ` forces `4 ∣ k`, so `z` is real."

## R06 (P3) — the description's dependency paragraph does not match the head

**Location:** pull request description, paragraph "Dependencies": "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** Every roadmap the README names is on main, a listed dependency or a consumer, and main supplies what is cited from it.

**Witness:** `README.md` lines 142–145 name AdicSpacesPartV §1.7 and PerfectoidShimuraVarieties §1.3 as owners of related statements; lines 397 and 423 ask PerfectoidSpaces (on main) for two statements it does not have.

**Repair:** "Roadmaps on main are cited by name. AdicSpacesPartV §1.7 and PerfectoidShimuraVarieties §1.3 are named as owners of related statements, not as inputs; everything else named is a consumer." Add, unless R01 is repaired by owning the two lemmas: "The README states two contracts on PerfectoidSpaces, `gap:complete-almost-nakayama` and `gap:principal-almost-flatness`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §0.3 derived limits | `ℤ ←p ℤ`, `t = 1`; Milnor ends killed by `t^{1/p^k}` | `lim¹ = ℤ_p/ℤ ≠ 0`; middle killed by `t^{2/p^{k+1}}`, which divides `t^{1/p^k}` as `p ≥ 2` | holds; BHATT18 lines 326–336, p. 6 |
| §0.5 uniform annihilation | cone `C_n` in degrees `[−1, 0]`; `γ = g^{1/p^k}t^{1/p^l}` | `γτ` factors through `H^{−1}[1]`; `t^{1/p^{l′}}γτ = 0`; `t^{1/p^l} = t^{1/p^{l+1}}·t^{(p−1)/p^{l+1}}` | holds; BHATT18 line 418, p. 7 |
| §2.2 dictionary | `K° + K°°T·K°[T]`; `K°[T, ϖ^{−1}T²]`; `ℤ_p + pTℤ_p[T]` | gauge of `T`: `1`, `1`, `p`; `\|T²\| ≤ \|ϖ\|` in the second; unit balls `K°[T]`, —, `A` | holds; ANDRE18A lines 591–647, 717–726 |
| §2.4 Laurent localisation | `A = K × K`, `g = (ϖ², 1)`, `a = (1, ϖ²)`, `λ = ϖ`; `K⟨T⟩{λ²/T²}` | quotient norm `q²`, one-parameter infimum `q`; norm of `λ/T` is `\|λ\|^{−1}` | holds; README corrects ANDRE18A line 1158 |
| §2.6 uniform limits | annuli `K⟨T, ϖʲ/T⟩`; discs `r_i ↑ 1` with `Σ Tⁿ/ϖ^{⌊√n⌋}` | `a_{−n} = 0`; norms `\|ϖ\|^{−⌊√n⌋}rⁿ` unbounded as `r → 1` | holds; ANDRE18A lines 1256–1281 |
| §2.9 tubes | `f = 0`; `f = T` in `K⟨T⟩` | `ucolim B = B`; `ucolim K⟨T/ϖ^i⟩ = K` | statement holds (lines 1372–1419); sketch: R03 |
| §3.2 root algebras | `A = K`, `g = 0`; `g = 1`, `p = 2` | `T^{1/p^i}` nilpotent, dies in `(·)^u`, gives `K`; `K[S]/(S² − 1) ≅ K × K`, 4 idempotents | holds; ANDRE18A lines 1533–1548, 2132–2145 |
| §3.6 Riemann extension | `g = 1`; `g = ϖ`; `A = K⟨T^{1/p^∞}⟩`, `g = T`, `b = T^{−1}`, `ϖ^{−1}` | both sides `A°`; `(ϖT)^m T^{−n} ∉ A°` for `n > m`; `ϖ^{m−n}T^m ∉ A°` | holds; ANDRE18A lines 2580–2630 |
| §3.8 limits of perfectoid algebras | constant system | all five conditions hold; chain `(1) ⇔ (2) ⇐ (3) ⇔ (4) ⇔ (5)` as at source line 2783 | holds |
| §3.10 annular systems | `A[j][ε]/(ε²)` | base change holds, `ε ≠ 0` nilpotent, not perfectoid | holds; ANDRE18A lines 2906–2923, 2929–2930 |
| §3.11 nested systems | zero system; constant `(A[j])` | `ulim = 0`; `ulim = g^{-1/p^∞}A°[1/ϖ]` | holds; ANDRE18A lines 2924–2966 |
| §4.1 almost Galois | `ℤ → ℤ[i]`, `G = ℤ/2`; `B = A × A` swap | index of the image `4`, cokernel `(ℤ/2)²`; `(1,0) ⊗ (0,1) ↦ ((0,0),(0,1))` against `((0,0),(1,0))` for `tensorToPi` | holds; ANDRE18A lines 296–365 |
| §5.1 pure maps | `×2` on `ℤ`; `ℤ → ℤ[1/2]`; `K[x,y]/(xy) → K[x] × K[y]` | zero map on `ℤ/2`; `ℤ/2 ⊗ ℤ[1/2] = 0`; `x ∈ (x+y)S ∩ R`, `x ∉ (x+y)R` | statements hold (ANDRE18B lines 835–889); list: R04 |
| §5.6 tubes for the Kummer tower | `n = 0`, `g = p`, `p = 2`, `j = 3`, `l = 1` | `u = ζ₈ + ζ₈⁻¹`, `u² = 2`; `e = (1 + X/u)/2`, `e² = e` | holds; ANDRE18B lines 369–383 |
| §5.10 generic fibres | module killed by `K°°_∞` after inverting `p` | `x = p⁻¹(px) = 0` | holds; ANDRE18B lines 564–565 |
| `bhatt_riemann_extension_ker_almostZero` | `m = 0`; `n = 0`; `g = (T, 0)` | conclusion trivial; `M_0 = (A/tᵐ)[1/g]`; hypothesis `hgreg` fails for `a = (0, 1)` | true as stated |
| `bhatt_quantitative_riemann_extension` | `e ≥ 1/pᵏ`; `e < 1/pᵏ`; `hsub` | `ce ≥ m`, term `0`; term `g^{1/p^k − e}t^{(n+c)e}`; `v(t) ≤ 1` gives the inclusion | true; restriction runs from `n + pᵏm` to `n` |
| `bhatt_kernel_without_regularity` | `g = 0`; `g = (T, 0)` | conclusion `0 = 0`; kernel `(0) × K°` killed by `(t^{1/p^k}T^{1/p^k}, 0)` | true; `c` precedes `a` |
| `bhatt_riemann_extension_limit` | `g = 0`; `A = K°⟨T^{1/p^∞}⟩`, `g = T` | annuli empty, kernel all of `R°`, killed by `0`; `a_e\|t\|^{ne} ≤ 1` for all `n` gives `a_e = 0`, `e < 0` | true |
| `riemann_extension_completeIntegralClosure` | as §3.6; zero ring | `0 ∈ R⁰` only for `R = 0` | true |
| `rootSaturation_completelyIntegrallyClosed` | `A = K × K`, `g = (1, 0)`; `g = 0` | `A[1/g] = K`, saturation `K°`, `\|ϖ^{−1}\|ⁿ` unbounded; both rings `0` | true |
| `abhyankar_trace_almost_surjective` | `g = 1`, `B′ = A₁ × A`; `B′ = A₁` not faithful | projective trace `(x + y₁, y₂)`, onto `A°`; image misses `(0, ϖ)`, excluded by `hfaith` | true |
| `kummer_isPureHom` | `n = 0`, `g = p`, `(0, 1)`; `p = 2`, `g = 1` | split by the coefficient of `1`; `ℤ₂ → ℤ₂ × ℤ₂` split by a projection | true; `ζ₀ = 1`, `ζ₁^p = 1`, `Φ_p(ζ₁) = 0` give primitive roots |
| `kummer_almost_faithfullyFlat` | `m = V = ℤ`, `M = ℚ`; `m = 0` | `ℚ ⊗ ℤ/2 = 0`, `ℤ/2 ≠ 0`, fails; every module qualifies | definitions discriminate; statement as ANDRE18B line 385 |
| `kummer_ramified_almost_faithfullyFlat` | `m = 0`; `B = 0`; `B = A` | zero ring; excluded by `hinj`; `B°` almost `Â°_∞∞` | true; ANDRE18B lines 600–607 |
| §2.1 Check (R05) | `z = i` | `arg i = π/2`, `i^{3ⁿ} = ±i` | reason false, conclusion true |
| §3.5 Check | `R = K°/ϖ^r`, roots of `T` act by `0` | `R[0] = 0`, `R[j] = k_K[U^{1/p^∞}]`, `lim = k_K`, kernel `K°°/ϖ^r` | holds |

- Source locators checked against the text: 47 (BHATT18 11, ANDRE18A 24, ANDRE18B 9, GR03 2, SCHOLZE12 1), all on the stated pages; all 15 sampled targets among them.
- Library declarations opened at the pins: 21, among them `TauCeti/RingTheory/Invariant/Free.lean:111` (`tensorToPi`, `a ⊗ b ↦ a * g • b`), `RingTheory/Huber/LocalizationTopology/Plus.lean:117`, `Spa/Localization/PlusComparison.lean:219`, `RingTheory/Almost/RootSetup.lean:62,92`, `LinearAlgebra/Trace/Projective.lean:72`; `HasDenominatorPower` holds for `{tⁿ, g}` by `hasDenominatorPower_of_isOpen_span`.
- No derived tensor product on `DerivedCategory` at either pin (Tau Ceti has K-flat resolutions only, `Algebra/Homology/Monoidal/KFlat/Resolution.lean`); no module-purity, almost-flatness or root-saturation declaration at the pins.
- Cross-roadmap citations resolved: PerfectoidSpaces (28 sections, with their slugs), AdicSpacesPartII R0.3, R0.4, R0.9, AdicSpacesPartIII R3.5, R3.9, AdicEtaleGeometry A4.2, A4.2a, A4.3, DerivedModuleAlgebra §§0.K.1, 0.2, 1.1 on main; PerfectoidQuotients §1.4, DerivedDeRhamCohomology §1.10, DeformationAndDerivedPatchingAlgebra §1.13 at their open heads.
- Dependency check: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`; the worker's gate passes every check.
- Elaboration of `Suggested.lean`: ten `sorry` warnings and nothing else; `#check` types as in `signatures.md`, no lost binder. One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `exact?`) closes none of the ten theorems.
- Headlines: §1.2 (both clauses), §1.4 kernel, §1.5, §3.6(2), §3.6(3), §4.7(3), §5.8, §5.9, §5.12 stated; §1.3, §3.6(1), §3.6(4), §3.11, §4.5, §4.7(1)–(2) named in the docstring with the missing carrier.
- Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidQuotients, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartII; nothing shared (DirectSummandsAndBigCohenMacaulay consumes §5.1–§5.3, §5.11, §5.12 and Layer 1 through the former-numbering table; `RingHom.UniversallyInjective` of CommRingFactorizationSystems is the field-valued-point notion, a different object).
- Source independence: 26 passages compared with 5 sources, 3 shared (R02, R03, R04); largest share ANDRE18A, 78 of 135 locators; contents compared with ANDRE18A: independent (Layer 3 merges its §§3–4, Layer 4 takes §1.9, Proposition 4.4.4 and §5, Layer 2 inserts ANDRE18B §1.2).

## Not verifiable

- none

## Source issues

- **Error** in ANDRE18A at §2.6.2, third listed property, p. 28: the source says the norm of the image of `a` in `A{λ/g}` is the infimum over `m` of `|(g/λ)^m a|`; it should be the quotient norm, which is `q²` against `q` for `A = K × K`, `g = (ϖ², 1)`, `a = (1, ϖ²)`; affects the proof.
- **Error** in ANDRE18A at Lemme 2.6.3, proof, p. 29: the source says that infimum is at least `1` when `|λ| ≤ |ga|`; it should say the image has norm at least `|a(x)|` at a point `x` with `|g(x)| ≥ |λ|`; affects the proof.
- **Error** in ANDRE18A at Remarque 2.6.4(1), p. 29: the source says all maps `A{λ/g}^u → A{μ/g}^u` are injective; it should exclude cases such as `A = K × K`, `g = (ϖ², 1)`, `λ = ϖ³`, `μ = ϖ`, where a factor dies; affects nothing.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), p. 27: the source says the step follows from condition (1); it should cite condition (2), the element lying in `B[1/g]`; affects nothing.
- **Misprint** in ANDRE18B at Lemme A.2.1, proof of (c) ⇒ (b), p. 90: the source says the dual is the module of `S`-linear maps from `S` to `R`; it should be `Hom_R(S, R)`; affects nothing.
- **Misprint** in ANDRE18B at Remarque 2.6.1(1), p. 82: the source says the completed tower is faithfully flat over `A_∞`; it should be `A_∞0`; affects nothing.

## For the human reviewers

- **Scope.** Layer 2's sections 2.2–2.4 and 2.6–2.9 take ANDRE18A §§2.3, 2.5, 2.6, 2.8, 2.9 in the source's order (`README.md` lines 1056–1431); the `*Needs:*` lines force most of that order. I did not count it as following the contents.
- **Licence.** The sketches of §3.6, §3.11, §4.1 and §5.12 keep the order of steps of ANDRE18A lines 2588–2614, 2933–2957, 334–347 and ANDRE18B lines 610–614 in compressed form with the README's own cross-references; I did not count them as shared wording.
- **Scope.** `README.md` has a section "Corrections to the sources" (lines 2919–2969) listing fourteen claimed errors in BHATT18, ANDRE18A and ANDRE18B; I recomputed six (the items on Lemme 2.6.3, Remarque 2.6.4, Lemme 2.5.3, §2.6.2, Proposition 4.4.4 and Lemme A.2.1), not the other eight.
- **Not tested.** The board's package copy of this roadmap (2,532 lines, no gap paragraphs, `review.json` at a round-2 verdict) is older than the text of this pull request (3,031 lines).
