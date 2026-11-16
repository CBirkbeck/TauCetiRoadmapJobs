<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6906050503 -->
Red team round 1 pass b (claude) of deb125c

Verdict: needs_changes

1. **F01** (P2) Layer 11 end theorems are stated for every neat level, but their route needs a small prime-to-`p` level

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:643` (§11.5), `:657`
   (§11.6), `:672` (§11.7: "with `K = K_SK^S` neat and `K^S` hyperspecial"), against `:606` (§11.2: "Let
   `K^p` be small enough for the perfectoid tower").

   **Claim.** §§11.5–11.7 hold for every neat `K = K_SK^S`, by a route that applies §11.2(a)/(b), §11.3
   and §11.4(1) to that `K`.

   **Witness.** PerfectoidShimuraVarieties §2.2 needs `K^p` inside a principal level `N ≥ 3` prime to `p`; the parent's §3.17 assumes "`K^p` sufficiently small". A neat `K` with pro-`q₁` Iwahori level at `q₁ ∈ S` is in no principal level.

   **Why it matters.** The statements of §§11.5–11.7 are true at every neat level, but the route as
   written does not reach them: the three suppliers are used outside their hypothesis, and no step
   lowers the level. §11.3 and §11.4(1) use the same suppliers and do not state the hypothesis at all.

   **Repair (tested on the Iwahori instance: `K′ = K ∩ Γ(q₁²)` is normal in `K` and lies in a principal
   level `q₁² ≥ 3` prime to `p`).**

   1. In §11.3, after "Assume that the datum satisfies SV3 (§8.1)." add: "Let `K^p` be small enough for
      the perfectoid tower, as in §11.2." In §11.4, at the start of the proof of (1) under SV3, add the
      same sentence.
   2. Add to §11.2, as part (c), with `SchemeAndStackFoundations §2.15` and `PELModuli §M6.1` already in
      the supplier contracts:
      "(c) Reduction to small level. Let `K = K_SK^S` be neat. `S` is not empty, since it contains the
      primes ramified in `𝒦`, and `p ∉ S`. Shrinking `K_S` at one prime of `S` gives a normal compact
      open `K′ ⊂ K` with `K′_q = K_q` for every `q ∉ S` and `K′^p` small enough for the perfectoid
      tower. The covering `S_{K′} → S_K` is finite étale Galois with group `K/K′`, and its
      Hochschild–Serre spectral sequence `E_2^{a,b} = H^a(K/K′, H^b(S_{K′}, 𝔽_ℓ)) ⇒ H^{a+b}(S_K, 𝔽_ℓ)` is
      `𝕋^S`-equivariant. Hence for a maximal ideal `𝔪 ⊂ 𝕋^S`: if `H^*(S_K, 𝔽_ℓ)_𝔪 ≠ 0` then
      `H^*(S_{K′}, 𝔽_ℓ)_𝔪 ≠ 0`; and if `H^b(S_{K′}, 𝔽_ℓ)_𝔪 = 0` for `b < d` then `H^i(S_K, 𝔽_ℓ)_𝔪 = 0`
      for `i < d`."
   3. In §11.5, before step 1 of the route: "By §11.2(c) replace `K` by `K′`: `𝔪` is still in the
      support, `𝕋^S` and `S` are unchanged, and `ρ_𝔪` depends only on `𝔪`." In §11.6, step 1, after "it
      suffices to prove `H^i(S_K, 𝔽_ℓ)_𝔪 = 0` for `i < d` for every such `𝔪`": "By §11.2(c) it suffices to
      prove this at the level `K′`; the auxiliary pair is a condition on `ρ_𝔪` and `p ∉ S`, so it is
      unchanged." Add `PELModuli §M6.1; SchemeAndStackFoundations §2.15` to the *Needs* lines of §§11.5
      and 11.6 where absent.

2. **F02** (P3) `*Needs:*` lines of §§10.1 and 10.4 list supplier sections whose hypotheses exclude general Case 1 data

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:509` (§10.1 *Needs*:
   "EndoscopicTransferAndUnitaryTraceComparison §§1.8, 1.16, 6.7, 6.23, …"), `:550` (§10.4 *Needs*:
   "§§6.8, 6.23, 6.25"), `:590` (Layer 10 Dependencies).

   **Claim.** §10.1 and §10.4, for every Case 1 datum, need EndoscopicTransferAndUnitaryTraceComparison
   §6.23 and (§10.4) §6.25.

   **Witness.** At the supplier's head, §6.23 is for signature `(1, n−1)` at one place and `(0, n)`
   elsewhere with `[F₀:ℚ]` even; §6.25 begins "Assume `[F^+:ℚ] ≥ 2`". README:221 has a Case 1 datum
   with `F = 𝒦 = ℚ(i)`. The proof text of §10.1 never uses §6.23.

   **Repair.** §10.1 *Needs*: delete `6.23` (the route uses §§1.8, 1.16, 6.7, 7.10, 8.1, 8.21 only).
   §10.4 *Needs*: replace "EndoscopicTransferAndUnitaryTraceComparison §§6.8, 6.23, 6.25" by
   "EndoscopicTransferAndUnitaryTraceComparison §6.8", and add to the route paragraph: "In the
   Harris–Taylor setting §6.23 there, and for `[F⁺:ℚ] ≥ 2` with `G(𝔸_f) ≅ G_n(𝔸_f)` §6.25 there, give
   special cases; neither covers a general Case 1 datum (for `F⁺ = ℚ` see §6.15 there), which is the
   gap." Layer 10 Dependencies: drop `6.23, 6.25` accordingly (keep §6.25 only if another target of
   the layer names it; none does).

Two findings: R01 (P2) and R02 (P3). No P1. The four declarations of `Suggested.lean` are true as typed
(argument in the table below) and none is padding.

## Adversarial pass: record

Dependency check (run as the brief gives it): `depcheck: 241 roadmaps, 2269 edges, 0 problem(s)`. No
UPWARD, CYCLE or `moved:` line.

Lean: no elaboration was run (none is permitted in this pass). The four elaborated types of
`scratch/signatures.md` were compared with README §§8.7–8.8: binders `[NumberField F] [NumberField L]
[IsGalois F L] [Field k] [Finite k] {n}` all present in every declaration; nothing changed.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsStrongGenericAt` (Lean :46, README §8.7) | `n = 0, 1`; `v = ⊥`; `v ∣ ℓ`; `L/F` ramified at `v` with `r` trivial on inertia; `{3,3}`, `{1,2}`, `{1,7}` at `q_v = 7`, `ℓ = 11` | `n ≤ 1`: no pair `i ≠ j`, predicate = maximal ∧ `ℓ ∉ v` ∧ inertia killed; `⊥` not maximal in `𝓞 F`; `{3,3}`: ratio `1` fails; `{1,2}`: ratios `2, 6` pass; `{1,7}`: ratio `7` fails | agrees with CS17 Definition 1.9 (`∉ {1, q}`, CS17 line 153) |
| `IsCompletelySplitStrongGenericPrime` (Lean :65) | `F = ℚ(i)`: `p = 5` (2 primes = `[F:ℚ]`), `p = 3` (1 prime), `p = 2` (1 prime); `p = ℓ` | `ncard = 2, 1, 1`; `p = ℓ` fails through `ℓ ∉ v` | complete splitting correctly encoded; implies AG2.7 `FiniteModelDecomposedGenericPrime` (ratio `q_v = p` excluded, `p ≠ ℓ`), not conversely (`{3,3}`) |
| `infinite_setOf_isCompletelySplitStrongGenericPrime` (Lean :79, §8.8(a)) | `n = 0`; `L` ramified above `p₀`; `F` not Galois over `ℚ`; `ℓ = 2` | Frobenius of `p₀` in the Galois closure `M` of `L_r(ζ_ℓ)` lies in `Gal(M/F̃)`; a prime `p` with the same class has, at each `𝔓`, `Frob_𝔓 = Frob_{𝔓₀′}` as elements, so each `v ∣ p` has degree one, the same `r`-class and `p ≡ p₀ (ℓ)`; inertia of `L/F` at `Q ∣ v` lies in `Gal(L/L_r) = ker r` | true; the route must use `L_r`, as the README does |
| `infinite_setOf_isStrongGenericAt_degree_one` (Lean :91, §8.8(b)) | `v₀` of degree `f > 1`; `n = 0` | class of a Frobenius element `σ₀` at `v₀` in `Gal(L(ζ_ℓ)/F)`: unramified `v` with `Frob_v ∈ [σ₀]` have `r(Frob_v) ∼ r(σ₀)` and `q_v ≡ q_{v₀} (ℓ)`; degree-one places have density one among them | true |
| §8.4 Satake image of `P_v` | `n = 2` and general `i` | SR.4.3 gives `S(T_i) = q^{i(n−i)/2} e_i`; `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; trivial rep of `GL_2`, `q = 7`: `S(T_1) = 8 = deg T_1`, roots `7, 1` | consistent with §§9.4, 10.5 Checks |
| §8.5(1),(2) | `n = 1`; `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`, `{3,6}`; `q ∈ 𝔪` (`deg`, `q = 5`); `𝔽_9` | exponent `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = i(n−1)`; `T_1 ≡ 3`, `T_2 ≡ 5`; dual `T_1 ≡ 5`, `T_2 ≡ 9`, `X² − 5X + 8`, roots `{7, 9}`; `{3,6} ↦ {6,3}`; `X² − 6X + 5 ≡ X² − X (5)`, `≡ X² + 2 (3)`; `a⁻¹ = a³ = −a` | all Checks correct |
| §8.5(3) twist | geometric Frobenius, `ε̄ ↦ q⁻¹` | `λ⁻¹·(q⁻¹)^{1−n} = q^{n−1}λ⁻¹`; arithmetic convention gives `{8, 4} ≠ {7, 9}` | matches AG2.7 «Dual and character-twist Hecke comparison» and the parent's §5.1 (`{7, 7/2}`) |
| §8.3(5) central translation | `S_i = {τ, τ′}`, `(1,1)`, `(2,0)`, `n = 2` | Shapiro bound `diag(t², t)`, `κ = −3`; `μ_{i,τ}⁻¹`: `κ = −1`; `p·`: `+2` | translation needed; CS17 line 4034 omits it |
| Conventions, `d_b = d` iff `μ`-ordinary | same example | `⟨2ρ, ((0,−1),(−1,−1))⟩ = 1 = ⟨2ρ, ((−½,−1),(−½,−1))⟩ = d` | correct |
| §8.1 SV3 criterion | `n = 1`; `n = 2` `(1,1)`; `n = 2` wholly definite (`D` ramified at `5, ∞`, `F = ℚ(i)`) | `G^ad` trivial; `h` acts on root spaces by `z/z̄`; `B = D ⊗ F` has index 2 at both places over `5`, `h` scalar | correct; `inv_v(B) = 0` at places not split over `F⁺` checked (corestriction) |
| §8.9 Checks, integral localization | `ℤ[T]/(T⁴−1)`, `ℓ = 5`, `𝔪 = (5, T−2)`; `𝔪_2`, `ℓ = 3` | `i ≡ 2`; `T∓1 ∉ 𝔪` kill the `±1`-lines; `T+2 ∉ 𝔪` acts by `2 − i ∈ 5ℤ_5 ∖ 0` on the `−i`-line; `f(−i) = 0 ⇒ f(i) = 0 ⇒ f ∈ 𝔪`; `λ(3) = 3` inverted | `ℤ_5 ⊕ ℚ_5`, `ℚ_3`: correct |
| §10.1 local-index argument | `d_v ∤ n₁`; central `γ` | isotypic `F_v`-dimension `m_i e_i d_v` = multiple of `e_i d_v²/gcd(d_v, e_i)`, so `d_v ∣ m_i e_i`; `(X − γ)^n` | correct |
| §10.3 coefficients | `n = 1`; Shimura curve `e = 2`; one-dimensional `π_∞` | `ep(1) = 1`; `ep(1) = 2 = χ(ℙ¹)`; `(−1)^{q(G)}` twice cancels; `∏ binom(n, p_τ)`: `n`, `1`, `2` | consistent with §10.2 (`Σ_χ χ = e` on `ν > 0`) |
| §11.2(a), §11.4, §11.6 | hyperspecial `K_p`, `ℓ ∣ #GL_n(𝔽_p)`; `κ(𝔪^∨) ≠ 𝔽_ℓ` | bottom row `E_2^{0,b₀}` may vanish, so only "some `j ≤ i`"; `κ ⊗_{𝔽_ℓ} V = ⊕_σ V^σ` contains a scalar-eigen vector; one-degree concentration rules out cancellation under `BC^{S′}` | correct, given R01 |
| §11.5–11.7 at arbitrary neat `K` | pro-`q₁` Iwahori level at `q₁ ∈ S` | not inside a principal level `N ≥ 3` | R01 |
| §11.8(2),(3) | `V = 𝔽_ℓ`, `K′ = K`; `ℓ ∈ S′` | row `b = d` only; dual bound by `V^∨`, `𝔪^∨` | correct |

Headline theorems (README): Theorem 6.3.1(1), 6.3.1(2), Theorem 1.1, Remarks 1.3 and 1.7.1 (Layer 11);
Theorem 5.5.7 and Corollary 5.6.3 (Layers 9–10): none statable at the pins (no PEL Shimura
varieties, Igusa varieties, `B(G, μ⁻¹)`, adelic Grothendieck groups); each is named in the module
docstring with the missing carrier. Statable and stated: §8.8(a), (b). Padding probe: neither
theorem follows by one tactic or one library lemma (Chebotarev is needed); the two definitions are
used by both theorems. No padding.

Ownership: `roadmaps grep` finds `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime` and the
two theorem names in no other roadmap, on main or open. AutomorphicGaloisRepresentationsPartII has
`FiniteModelDecomposedGenericPrime` and `infinitelyManyDecomposedGenericPrimes` (ratio `q` only); the
README's scope paragraph states the relation correctly. No other roadmap states CS17 Theorem 6.3.1,
Theorem 5.5.7 or Corollary 5.6.3.

Declared gaps: the three slugs are in `design/plan.json` with the same suppliers and sections as in
the README; each `needs` states its setting and hypotheses; none asks for what a supplier already
states (AG2.2 «The Caraiani–Scholze discrete normalization» and AG2.7 «Unitary discrete-parameter
export» were read at the supplier's head and are as the README describes them).

Arrangement: 72 of 86 bracketed citations are to CS17. Pairs by number: Layer 9 ↔ §§5.2–5.5,
Layer 10 ↔ §5.6, Layer 11 ↔ §6.3 with §1; Layer 8 has no counterpart section (it draws on §§5.1, 5.4,
6.2, 6.3 and adds §8.9); CS17 §§2–4 and 6.1 are not here. Only one pair is one layer to one section.
The order 8 → 9 → 10 → 11 is forced: §10.6 needs §§9.2, 9.5; §11.6 needs §§9.6, 10.6; all need
Layer 8. Not a finding.

Source independence: 16 passages compared with 5 sources (12 with CS17: Definition 1.9, Remark 1.7, Cases 1–2 of §6.3, Theorem 6.3.1, Remarks 6.3.2–6.3.3, Lemma 6.2.2, Lemma 5.4.3, Corollary 5.5.2, Theorem 5.5.7, Lemma 5.5.8, Proposition 5.6.1, Corollary 5.6.2; and Shin-BCU Theorem 1.1, Shin11 Lemma 7.1, Shin09 Lemma 6.4, Shin12 (B2)), none shared beyond hypothesis lists the mathematics forces; largest share CS17, 72 of 86 locators; contents compared with CS17: independent (one layer of four pairs with one section, order forced by the dependency lines).

## Verified sound

- Declarations read: 4 of 4 (`Suggested.lean`, all 97 lines); single `import Mathlib`, no
  `set_option`, no `lemma`, no sorry'd data, namespace and module docstring in the required form.
- README: all 738 lines read. Targets read: 29 (§§8.1–8.9, 9.1–9.6, 10.1–10.6, 11.1–11.8).
- Locators verified against the cached texts: 43 (CS17: 36 line locators, including lines 84–153,
  447, 3236, 3281, 3419–3491, 3551–3603, 3714, 3740, 3804–3829, 3851–3859, 3899, 3950–4111, 4244,
  4326–4440 and footnote 33; Shin-BCU lines 13–17 and 41–52; Shin11 line 3470; Shin09 lines 570–575,
  703, 879; Shin12 line 981). None wrong.
- Checks tested by recomputation: 31 (all arithmetic Checks of §§8.1, 8.3, 8.4, 8.5, 8.7, 8.9, 9.4,
  10.3, 10.5, the layer Examples and the worked examples). None false or vacuous. Every definition
  has at least three.
- Sibling citations checked at the current heads or on main: 20 roadmaps; section headings for every
  cited id exist. Statements read and compared: IgusaVarietiesAndTorsionConcentration §§0.24, 1.3,
  1.4a, 3.17, 4.4, 4.5, 5.1, 5.2, 5.5; EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.10, 6.15,
  6.18, 6.23, 6.25, 8.11, 8.21, 10.32, 14.2, 14.3; AutomorphicGaloisRepresentationsPartII AG2.2 and
  AG2.7 (five named targets) and its `Suggested.lean`; BunGAndNewtonStrata §§1.25, 1.26, 1.30, 1.32;
  PELModuli §§M0.9, M0.12, M0.17, M2.11, M3.3, M3.4, M4.3; ShimuraCompactifications §§1.4, 7.3, 7.5,
  7.18; PerfectoidShimuraVarieties §§2.2, 3.5; SmoothRepresentationsOfLocalGroups SR.4.3 and
  «Modular generic segments»; AlgebraicModularFormsAndSerreWeights §5.10; AutomorphicSpectralTheory
  §§6.17, 6.19, 6.20; ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.4.9, ALS.5b.4
  (`LocallySymmetric.FrankeInput` is at its line 4388, so the lead in `scratch/citations.md` is a false
  alarm); ClassicalAdicEtaleCohomology §1.3; AutomorphicLFunctionsAndLocalFactors AL.3.7.
- Pinned declarations found at the pins: `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`),
  `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean`), `Ideal.primesOver`, `Ideal.LiesOver`
  (`Mathlib/RingTheory/Ideal/Over.lean`), `NumberField.IsCMField`, `NumberField.maximalRealSubfield`,
  `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`), `instRingHeckeRing`
  (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient`
  (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`).
- Policy: `git diff --stat origin/main...HEAD` touches only the package folder; no pull-request
  numbers or process words in the README or docstrings; every target has a locator.

## Not verifiable

- Page numbers of the author copies of Shin09 and Shin12 against the published pagination: only
  the author copies are cached; the README says its locators are to those copies.
- The remaining supplier sections (those listed in the contracts but not in the list above) were
  checked for existence of the heading only, not read against the README's one-line description.
- The mathematics behind the three declared gaps, by the brief's rule.
- Ownership against the open pull requests whose files the brief does not give as checkouts was
  checked only through `roadmaps grep` and `roadmaps show`.

## Source issues

- **Misprint** in CS17 at Theorem 6.3.1(1), p. 757 (CS17 lines 4402, 4407): the source says the similitude factor at a prime `q` is the `p`-adic units inside the `p`-adic numbers; it should be the `q`-adic units inside the `q`-adic numbers; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, p. 747 (CS17 line 3979) and Corollary 5.6.3, p. 750 (CS17 line 4103): the source says `S_i` is defined by the composite of `ι_p` after `τ`, which is not defined; it should be `ι_p⁻¹` after `τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, p. 747 (CS17 lines 3970, 3987): the source says the vanishing class is the base change at `p`; it should be the base change away from `S`, as in the proof at line 3990; affects nothing.
- **Misprint** in CS17 at Lemma 5.4.3, p. 741 (CS17 line 3722): the source says the reduction of `π_p` vanishes; it should be the reduction of the representation `π^n⃗_p` of the endoscopic group, as at line 4005; affects nothing.
- **Misprint** in CS17 at §5.6, p. 749 (CS17 lines 4077–4078): the source says the Frobenius-twist lemma is Lemma 6.4 of Shin's 2011 paper; it should be Lemma 6.4 of Shin's 2009 paper, as cited at line 3802; affects nothing.
- **Misprint** in CS17 at Remark 6.3.3, p. 758 (CS17 line 4432): the source says exactly one embedding has nonzero signature product; it should be two, `τ₀` and its conjugate, one of which lies in the union of the `S_i`; affects nothing.
- **Error** in CS17 at §5.1, p. 730 (CS17 line 3281): the source says every PEL datum of the section is a Shimura datum in the sense of its §2.1; it should exclude data definite at every place of rank at least two, which fail condition (3) (line 447); affects the proof.
- **Gap** in CS17 at proof of Theorem 5.5.7, p. 748 (CS17 line 4034): the source says the Kottwitz set of the restriction of scalars equals that of `GL_n` for the one noncentral component; it should first translate by a central power of `p`, since the Shapiro bound is the sum of all components; affects the proof.
- **Gap** in CS17 at proof of Theorem 6.3.1, p. 758 (CS17 lines 4439–4441): the source says the least nonvanishing degree at finite level is a nonvanishing degree at infinite level; it should say some degree at most that one, since the hyperspecial group has higher mod `ℓ` cohomology; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "deb125ce96885659d93a60d82092cc3eae1cf8a7", "job": "RT-IgusaVarietiesAndTorsionConcentrationPartII~1b", "model": "fable", "worker": "chris-x29"} -->
