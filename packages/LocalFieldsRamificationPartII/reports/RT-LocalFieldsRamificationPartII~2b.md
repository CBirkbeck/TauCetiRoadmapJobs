<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13151#issuecomment-6793222069 -->
Red team round 2 pass b (claude) of 491af8b

Verdict: needs_changes

1. **F01** (P2) "the analogous separable statements" includes a false one, and the true one is a consumer's contract

   Location: `packages/LocalFieldsRamificationPartII/README.md:466–471` (§0.4): "Prove that if `K`
   has characteristic exponent `q`, `q` is prime and `q ∈ P`, then a `P`-closed `K` is perfect … The
   analogous separable statements hold inside `Kˢ`."

   Claim: both statements of §0.4 (maximal `P`-extension is `P`-closed; `q ∈ P` forces perfection) have
   separable analogues.

   Witness: the README's own §0.3 Check (`:461–462`): the separable closure of `𝔽_p(t)` is separably
   `{p}`-closed and imperfect, so the second analogue is false. The first is the declared contract
   `gap:maximal-separable-p-extension` at
   `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:96`, which needs it stated.

   Repair: replace the sentence "The analogous separable statements hold inside `Kˢ`." by:
   "Prove the separable form of the first statement: inside `Kˢ` every separable `P`-extension of `K`
   is contained in a maximal one `K_{sP}`, every finite subextension of `K_{sP}/K` is separable of
   `P`-number degree, and `K_{sP}` satisfies `IsSeparablyPClosed P` (a finite separable extension of
   `K_{sP}` of `P`-number degree is, with `K_{sP}`, a separable `P`-extension of `K` by §0.2). The
   perfection statement has no separable form: the separable closure of `𝔽_p(t)` is separably
   `{p}`-closed and imperfect (§0.3)." Add the Check: "For `K = 𝔽_p(t)` and `P = {p}`, `K_{sP}` is a
   maximal separable `{p}`-extension; it is separably `{p}`-closed and does not contain `t^{1/p}`."
   Tested on the refuting instance: for the separable closure of `𝔽_p(t)` the repaired text claims
   separable `{p}`-closedness (true) and no perfection.

2. **F02** (P3) the tower route of §0.2 does not give the degree it claims

   Location: README `:419–421` (§0.2): "after replacing a finite subextension of `M/L` by one over a
   finite subextension of `L/K` that contains the coefficients of the minimal polynomials of its
   generators, which has the same degree."

   Witness: `K = ℚ`, `L = ℚ(√2)`, `E = L(√3, √6)`, `[E : L] = 2`. The minimal polynomials `X² − 3`,
   `X² − 6` over `L` have coefficients in `L_0 = ℚ`, and `[ℚ(√3, √6) : ℚ] = 4 ≠ 2`.

   Repair: replace the quoted clause by "after replacing a finite subextension `E` of `M/L` by
   `E_0 = L_0(a_1, …, a_k)` for generators `a_i` of `E/L` and a finite subextension `L_0` of `L/K` that
   contains, for an `L`-basis of `E` made of monomials in the `a_i`, the coordinates of every product
   of a basis element with a generator; then `[E_0 : L_0] = [E : L]`." On the instance: basis
   `{1, √3}`, `√6 = √2·√3` has coordinate `√2`, so `L_0 = ℚ(√2)` and `[E_0 : L_0] = 2`.

3. **F03** (P3) a §6.5 Check contradicts the next Check of the same section

   Location: README `:1637–1639`: "For the separable closure of `𝔽_p(t)` with any valuation the
   hypothesis holds for every `P`".

   Witness: `P = ∅`. README `:1640–1641`: "the hypothesis on the residue characteristic never does".
   Every valuation of a field of characteristic `p` has residue characteristic exponent `p`, and
   `p ∉ ∅`.

   Repair: replace "the hypothesis holds for every `P`" by "the closedness hypothesis holds for every
   `P`, and the residue hypothesis exactly for the `P` containing `p`, for which". On `P = ∅`: closed,
   residue hypothesis false, nothing claimed; on `P = {p}`: both hold, the field is separably tame and
   `t^{1/p}` is a non-tame extension.

4. **F04** (P3) the Conventions restrict `[L : K] = e·f` more than §2.9 does

   Location: README `:142`: "The degree formula `[L : K] = e·f` is asserted only for finite tame
   extensions of henselian fields."

   Witness: README `:986` "its finite extensions satisfy `[L : K] = e·f`" (local fields) and `:999`
   "`[L : K] = e·f`" for finite separable extensions of complete discretely valued fields; the wild
   `ℚ_p(p^{1/p})/ℚ_p` has `e = p`, `f = 1`, degree `p`.

   Repair: replace the sentence by "The degree formula `[L : K] = e·f` is proved here only for finite
   tame extensions of henselian fields; for finite extensions of local fields and finite separable
   extensions of complete discretely valued fields it is the suppliers' (§2.9); in general it fails by
   the defect (§2.4)." On `ℚ_p(p^{1/p})`: covered by the supplier clause, `p = p·1`.

One P2 (an overclaiming sentence on a target that an open consumer has contracted) and three P3
findings. No Lean declaration and no bold README target was found false. Every round-1 finding is
repaired at this head and no repair introduced an error.

## Round-1 findings at this head

| Round-1 id | Status | Witness at 491af8b |
|---|---|---|
| 1a/F01 = 1b/F01 (two owners of `cd_p(G_F) ≤ 1`) | repaired | `packages/LocalFieldsRamificationPartII/README.md:100–103` "belongs to ProfiniteCohomology, Layer 9, through the supplier contract below"; `:350` states `gap:char-p-galois-h2-vanishing`; the same slug is in the `gaps` of `design/plan.json`; `Suggested.lean` no longer declares `cohomologicalDimensionAt_absoluteGaloisGroup_le_one`; §§3.1–3.5 renumbered consistently (`:1056–1203`). |
| 1a/F02 (Krasner bridge absent) | repaired | `Suggested.lean:164–168` `isKrasner_of_henselianLocalRing`, hypothesis `HenselianLocalRing (NormedField.valuation (K := K)).valuationSubring`, `L` algebraic; README `:1227–1237` states it and its route; Checks `:1281–1288`. |
| 1a/F03 (compound gap) | repaired | README `:294` (17.7.5(iv)) and `:295` (17.7.7) are two contracts; both slugs in `design/plan.json`; §2.1 *Needs* `:759` names both. |
| 1a/F04 (wrong disjointness lemma in §6.3) | repaired | README `:1583–1585` cites `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`; contract bullet `:250–254`; pinned at `TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean:138` with hypotheses `IsIntegrallyClosedIn k F`, `[Algebra.IsSeparable k k']`. |
| 1a/F05 (two false universal examples) | repaired | README `:507–510` "any `P` containing a prime … for `P = {1}` or `P = {4}` … `𝔽_q` is `P`-closed"; `:1588–1595` the `ℚ(t)`, `K(√t)` Check. |
| 1a/F06 = 1b/F06 (`GF.k` identifiers) | repaired | README `:373–384`, table headed "Former identifier"; all 12 ids cited by AdicCoefficientsAndComparisonsPartII and the three `§GF.k` of QuadraticFormInvariantsPartII resolve in it. |
| 1a/F07 (non-discriminating Checks) | repaired | README `:1139–1144` (`ℚ_3(√3)` 2/2, `ℚ_3(√−1)` kernel of dimension 1), `:1567–1570` (`ℂ_p`, `ℚ_2`). |
| 1a/F08 (unowned graded finite presentation) | repaired | README `:638–684`: *Homogenization* and *Graded finite presentation* are targets with 4 and 3 Checks; the Prüfer route `:700–710` cites both. |
| 1a/F09 (finite-presentation milestone absent) | repaired | `Suggested.lean:77–94`; README `:692–698` names both theorems. |
| 1b/F02 (total ramification versus RamificationOfCompleteDiscretelyValuedFields) | repaired | README `:137–141` (Conventions), `:74–78` (deferral), `:328–334` (contract), `:990–1003` (target), `:1006–1013` (Checks). |
| 1b/F03 (broken link) | repaired | README `:3` `../../Completed/LocalFieldsRamification/README.md`. |
| 1b/F04 (pinned continuity of roots) | repaired | README `:176–182`, `:1253–1261`; `Mathlib/Analysis/Normed/Field/Approximation.lean` has both lemmas. |
| 1b/F05 (ProfiniteProPGroups contract) | repaired | README `:336–344`. |

New statements of the repair, recomputed: §2.9 Check (`z = t·y` gives `z^p − t^{p−1}z = s`, residue
`s^{1/p}`, `e = 1`, `f = p`; `s·t^{−p} ∉ ℘(K)` since `c^p = s` has no solution in `𝔽_p(s)`, so the
degree is `p`); §1.5 Checks (`S = ℤ[X]/(2X)`: `S_X = 𝔽₂[X, X⁻¹]`, degree zero part `𝔽₂`); §4.1
Krasner Check (`‖s − 3‖ ≤ 1/7 < 1 = ‖2s‖`, `√2 ∉ ℚ`). All correct.

## The adversarial pass

`P`, `p` as in the README; "T" true, values in the middle columns.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsPNumber` | `P = ∅`; `n = 0`; `P = {3}`, `n = 6, 9`; `P = {1}`, `{4}` | only `1`; `0 < 0` false; `2 ∤ {3}` so `6` no, `9` yes; only `1` | determines the notion | — |
| `IsPClosed`, `IsSeparablyPClosed` | `P = ∅`; `𝔽_q`, `{ℓ}`; `𝔽_p(t)ˢ`, `{p}`; alg. closed | finrank `1` forces `⊥`; `𝔽_{q^ℓ}` degree `ℓ`; separably closed yes, `t^{1/p}` degree `p` so not closed; only `⊥` | agree with §0.3 | — |
| §0.2 tower law | `ℚ(√2)`, `√3`, `√6` | route gives `4`, true degree `2` | route wrong, statement T | S02 |
| §0.4 | `𝔽_p(t)ˢ` | separably `{p}`-closed, imperfect | "analogous" overclaims | S01 |
| §0.5 split tower | `ℚ(√2,√3)/ℚ(√2)/ℚ`; two cubic fields in the `S₃` field | `2·2 = 4`; `3·3 = 9 ≠ 6` | T | — |
| §1.1 | `ℚ(√2)`, `7`; `3`; `x = (3−√2)/(3+√2)` | `(3−√2)(3+√2) = 7`, two primes; inert; values `1`, `−1` | T | — |
| §1.4 tensor decomposition | henselian `K`; `ℚ(√2)` at `7`; `𝔽_p(t)(t^{1/p})` | 1 factor; 2 factors; 1 factor | T; radical of `𝔪_V B` is the Jacobson radical since `B` is integral | — |
| §1.5 homogenization | `B = R`; `R = ℤ`, `B = 𝔽₂` | `S = R[T]`, `S_(T) = R`; `S = ℤ[X]/(2X)`, `S_(X) = 𝔽₂` | T; `S_(f) = S/(f − 1)` | — |
| §1.5 graded f.p. | `∏_ℕ 𝔽₂`, `I = ⊕𝔽₂`; nondiscrete `R`, `R[X]/(𝔪X)` | flat, not f.p., no finite prime family; not flat, not f.p. | hypotheses necessary | — |
| `finitePresentation_of_flat_…` | field; `B = A/𝔪` nondiscrete; `B = 0` | f.p.; torsion, excluded; f.p. | T | — |
| `module_finitePresentation_of_flat_…` | `B = A`, `M = A/𝔪`; `B = A[x]/(ax)`, `M = B/(x)`; `B = A[x]/J` not f.p., `M` f.p. over a polynomial ring `P` | not flat, excluded; `M ≅ A` flat, f.p.; `M = M ⊗_P B` f.p. over `B` | T with `B` of finite type only | — |
| §2.1 route | `A = A′ ∩ L`, prime `𝔮` of `A` | if `𝔮A′_𝔮 = A′_𝔮` then `1/q ∈ A′_𝔮 ∩ L = A_𝔮` with `q ∈ 𝔮`: impossible | `Spec A′ → Spec A` is surjective, so the faithfully flat hypothesis of the gap holds | — |
| `IsTameGaloisExtension` | `ℚ_p(ζ_p)`; `ℚ_2(i)`; unramified degree `p`; `ℚ(√2)` at `7`; `X³ − X − 2` at `2`; trivial valuation | inertia `p − 1`; `2`; `1` (decomposition `p`); `1` at both; disc `−104 = −8·13`, inertia `2`; inertia `1` | inertia, not decomposition, is the right group | — |
| `galoisTamePart` | henselian `V`; trivial `V`; `p = 1`; `ℚ` at `2` | `Kᵗ`; `Kˢ`; `Kˢ`; cubic field in `Kʰ` not in it | docstring T | — |
| `IsSeparablyTameField`, `IsTameField` | trivial valuation; `𝔽_p(t)` trivial; `ℚ_p`; alg. closed | separably tame, tame iff perfect; not tame; `ℚ_p(ζ_{p²})` inertia `p(p−1)`; tame | equal to `Kˢ = Kᵗ`, `Kᵃ = Kᵗ` (`Kᵗ ⊆ Kˢ`) | — |
| §2.6 | `𝔽_p(u^{1/p})((t))`; immediate defect extension; `ℚ_p(p^{1/ℓ})` | `e = 1`, residue degree `p` purely inseparable: totally ramified; totally ramified and purely wild; totally ramified, not purely wild | T; purely wild iff totally ramified `{p}`-extension (`Gal(Kˢ/Kᵗ)` pro-`p`, `Kᵗ/Kᵘ` prime to `p`) | — |
| §2.8 tower laws | henselian: `M/K` iff `M/L`, `L/K` unique prolongations; tame: `L ⊆ Kᵗ` gives `LKᵗ = Kᵗ` | both directions hold | T | — |
| §2.9 | `𝔽_p(s)((t))`, `y^p − y = s t^{−p}`; `𝔽_{p²}((t))`; `ℚ_p(p^{1/p})` | `e=1`, `f=p` insep.; `e=1`, `f=2`; `e=p`, `f=1` | T; Conventions sentence too narrow | S04 |
| `exists_continuous_section_of_isProP_ker` | `ℤ/p² → ℤ/p`; trivial kernel; `Ẑ → ∏_{ℓ≠p} ℤ_ℓ`; no `T2Space` binder | `cd_p = ∞`, excluded; `f⁻¹`; `cd_p = 0`, section exists; totally disconnected group is `T1` hence `T2` | T; route (b) recomputed: `H′ = {h : h mod U = β_U(f h)}` projects onto `G`, so `H′ = H`, `H ∩ N ⊆ U` for all `U` | — |
| `sup_galoisTamePart_eq_top_of_henselian` | trivial valuation; `K` separably closed imperfect; `p = 1`; `ℚ_p` | `Kᵗ = Kˢ`, maximal `E = K^{perf}` (`E ⊗ Kˢ` a field forces separable degree `1`), sup `Kᵃ`; `Kᵗ = K`, `E = Kᵃ`; `E = K`, `Kᵗ = Kᵃ`; kpr86 Theorem 2.1(ii) | T: a maximal `E` lies in a complement, which is linearly disjoint, so equals it | — |
| §3.4 group form | finite model | `E, T` linearly disjoint iff `|H||W|/|H∩W| = |G|` iff `HW = G` | T | — |
| `isKrasner_of_henselianLocalRing` | `ℚ` at `7`, `ℚ(√2)`; `ℚ_pʰ`; `ℚ_p` | not henselian, conclusion fails; holds, not complete; agrees with the pinned instance | T; `L` is ultrametric since its norm is bounded on `ℤ` | — |
| §4.1 continuity of roots | `f = g = X² − 1`, `2`-adic; `X`, `X − 2`; `X² − 1/16`, `X² + 2X − 1/16`; `deg g ≠ n` | `kras = 1`, both roots at `ε = 1`; `ε = 1` attained; `ε = 1/2 − 2 < 0`, roots `5/4 + 8w`, `−13/4 − 8w`, distances `0`, `−1`; `v(f − g) ≤ 0` so `ε ≤ 0` | T; equals cks23 Theorem 16 with `γ*(f)` | — |
| §4.3 | `ℚ(t)`, `E = Kʰ`; `ℚ(p^{1/ℓ})`; `ℚ(√2)` at `7` | right side T without henselian, left F; both F; left F, right would be T | henselian hypothesis necessary | — |
| §5.1–5.2 | `ℚ_p((t))` composite | `v(t) = (1,0)`, `v(p) = (0,1)`, height `2`, `p_1 = 1`, `p_2 = p` | T | — |
| `algebraicIndependent_of_valuation_independent` | `x_i = 0`; `ι = ∅`; `𝔽_p(t)` `t`-adic; Gauss | `n = single i 1` gives `0 ∈ range`, hypothesis false; pure residue case; `(1, 0)`; `(0, 1)` | T; `hx` is rational independence modulo `Γ_K` (kkv16 Lemma 2.1) | — |
| `ringKrullDim_le_ringKrullDim_comap_add` | `n = 0`; `ℚ(t)` composite; infinite height of `W ∩ K` | equality; `2 ≤ 1 + 1`; `⊤ + n = ⊤` | T | — |
| §5.4–5.6 | `i = 0`, `i = d`; `ℚ_p((s))`, `s^p = t`; `𝔽_p((t))((u))` | reduce to §2.3 facts; coarse tame, quotient `ℤ/p`, not tame; coarse field not tame | T | — |
| §6.1–6.3 | residue field `κ_i`; `ℚ(t)`, `K(√t)` | lift of a monic irreducible is irreducible of `p`-power degree; `K_0 = K` | T; `K_0` is `{p}`-closed because it is perfect and `K/K_0` regular | — |
| `isTameField_of_isPClosed` | `p = 1`; trivial valuation, characteristic `p`; `ℚ_p`; `𝔽_p((t))`; `ℂ_p` | `P = ∅`, hypothesis trivial, inertia orders coprime to `1`, characteristic `0` perfect; `{p}`-closed forces perfect; `X^p − p`; `X^p − X − t⁻¹`; tame | T | — |
| `isSeparablyTameField_of_isSeparablyPClosed` | `1 ∈ P`, `p = 1`; `P = ∅`; `𝔽_p(t)ˢ`; `ℚ_p`, `P = ∅` | conclusion trivial; `hp` false; separably tame, not tame; nothing claimed | T | S03 (Check wording) |

## Verified sound

- Declarations read: 16 of 16 (`Suggested.lean` lines 1–221), each compared with the elaborated
  type in the worker's `signatures.md` and with its README statement; no binder is lost (the file
  has no `variable`), imports are `Mathlib` and two existing Tau Ceti modules, no `set_option`,
  `lemma`, sorry'd data, `example` or padding. One-tactic probe: none of the nine theorems follows
  from one pinned lemma (pins searched for `IsKrasner`, Abhyankar, `FinitePresentation` under
  flatness, `cohomologicalDimensionAt` of an absolute Galois group, sections of profinite
  surjections).
- Headlines: Temkin's theorem, the separable export, the henselian splitting, the section theorem,
  the two finite-presentation theorems, Krasner over a henselian base, the Abhyankar statement and
  the height bound are stated; the docstring names the height-one splitting, the tensor
  decomposition, decompletion and the composition criteria as not statable, with the missing
  carrier (the tame closure and the valued henselization of a non-henselian field).
- README targets read: all of Layers 0–6 (41 numbered subsections), lines 1–1733.
- Locators verified against the cached texts: temkin17 (every locator of the README, §2.1.1–§2.6.6
  and Lemma 3.2.5; printed page = file page + 96); temkin10 Proposition 2.2.2 (pp. 11–12); kpr86 Theorems
  2.1–2.2 (p. 42), Corollary 2.5 and proof (p. 44); cks23 Theorems 14, 16, Example 15 (pp. 12–15);
  kkv16 Lemma 2.1 (p. 6), (12) (p. 8); aid25 Propositions 3.3, 3.6, 4.1, Theorems 3.7, 4.4;
  stacks-more-algebra tags 0A04, 0F0L, 0537, 053A, 053C, 053D, 05GS, 053E, 0ASJ, 0ASK; ega4
  17.7.5 (p. 73), 17.7.7 (p. 74), 18.6.8 (p. 139), 18.6.14 (p. 141). All correct.
- Checks tested: all 43 Checks blocks (about 150 bullets) read; every bullet with a computed value
  or a structural claim was recomputed (the instances are in the table above); one is imprecise
  (S03).
- Pinned declarations: the 45 `TauCeti.*` names of the README and 30 Mathlib names of the supplier
  contracts (all those `Suggested.lean` or a route depends on) found at the pins in the files cited (`TauCeti.Algebra.IndEtale.flat` is the instance `flat` of
  `TauCeti/RingTheory/Etale/IndEtale.lean`; `Subgroup.exists_minimal_isClosed_le` is `_root_`).
  `TauCeti.exists_continuous_lift_of_compatible_levelSolutions` assumes nothing pro-`p` on the
  source, as §3.1 says.
- Sibling citations checked (9 roadmaps): SchemeAndStackFoundations §0.12 `henselization_at_prime`,
  §0.13 `henselization_integral_base_change`, `henselization_coprime_product`, Layer 1 §1.1 (main;
  the open revision keeps the same numbers); ClassicalAdicEtaleCohomology §5.1 (a)–(c) and §5.3
  (i)–(iii) at its open head, same hypotheses; ProfiniteCohomology Layers 9, 11, §11.6;
  ProfiniteProPGroups; LocalFieldsRamification Layers 2–4; RamificationOfCompleteDiscretelyValuedFields
  §3a.1; ProfiniteCohomologyPartII (same gap slug); consumers AdicCoefficientsAndComparisonsPartII
  and QuadraticFormInvariantsPartII (every `GF` id they cite is in the table).
- Gaps: the three declared gaps have the same slug and sentence in `design/plan.json` and the
  README, one statement each, named suppliers, and none is at the pins.
- Ownership against open work: searched by object over main and the open heads (Abhyankar
  inequality, Pank splitting, `P`-closed fields, Krasner over a henselian base, Stacks 053E,
  tame fields, sections with pro-`p` kernel, decompletion, composed valuations): no second owner;
  no `Suggested.lean` shares a qualified name.
- Policy: the pull request changes only `packages/LocalFieldsRamificationPartII/`; no process
  words or pull-request numbers in the README or docstrings.
- Dependency check:

  ```text
  depcheck: 237 roadmaps, 2142 edges, 0 problem(s)
  ```

- P3 note, not a finding: the hypothesis `hA` of the two finite-presentation theorems is not needed
  for the algebra statement if Raynaud–Gruson 3.4.7 is granted (uncertified); the route and §2.1
  use the Prüfer case only.

## Not verifiable

- `serre-cg` (I §3.4 Proposition 16; II §2.2 Proposition 3, Corollary 1) and `rg71` (Corollaire
  3.4.7): settled as uncertified, not read; kpr86 lines 221–234 and temkin17 line 374 cite them for
  the same statements.
- Stacks, Algebra, Lemma 10.57.10 (quoted in §1.5 through the proof of tag 053E): that chapter is
  not in the cache; stacks-more-algebra line 2912 quotes it with the statement §1.5 uses.
- No Lean was run (read-only pass); elaborated types are the worker's `signatures.md`.
- ClassicalAdicEtaleCohomology §5.3's own sources (Gabber–Ramero §6.2) were not opened; the
  supplier's statement was compared, not re-proved.

## Source issues

- **Gap** in temkin17 at §2.1.1, printed p. 103: the source says transitivity of prime-supported extensions reduces to finite towers by the degree formula; it should also descend a finite subextension of the upper step to a finite level of the lower step with the same degree; affects nothing.
- **Gap** in temkin17 at proof of Lemma 2.3.8, printed p. 106: the source says the descent lemma for finite presentation applies to the map from the étale neighbourhood to its intersection with the smaller field; it should first show that map surjective on spectra, which holds by the Prüfer property; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "491af8b70f9e84aabca44c184ca3220523f665b5", "job": "RT-LocalFieldsRamificationPartII~2b", "model": "fable", "worker": "chris-x10"} -->
