<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13151#issuecomment-6790988782 -->
Red team round 1 pass b (claude) of a6b9eb2

Verdict: needs_changes

1. **F01** (P2) `cd_p(G_F) ≤ 1` in characteristic `p` has two owners; the earlier roadmap assigns it to ProfiniteCohomology

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:36` ("Owned here … the
   characteristic-`p` bound `cd_p(G_F) ≤ 1`"), `:905–917` (§3.1, "Prove
   `cohomologicalDimensionAt_absoluteGaloisGroup_le_one`"), `:1489` ("Continuous cohomology of profinite
   groups in characteristic-`p` Galois settings consumes §§3.1–3.2");
   `packages/LocalFieldsRamificationPartII/Suggested.lean:27–29, 102–108`.

   **Claim.** This roadmap owns the theorem and profinite-cohomology roadmaps consume it from here.

   **Witness.** `TauCetiRoadmap/ProfiniteCohomologyPartII/README.md:227–231` at its open head (same text
   at `packages/ProfiniteCohomologyPartII/README.md:226`): "What ProfiniteCohomology must provide
   (gap:char-p-galois-h2-vanishing) … so that `cd_p(Γ_K) ≤ 1`, from the Artin–Schreier sequence".
   `merge-order/ORDER.txt`: ProfiniteCohomologyPartII is line 386, this roadmap line 388. The earlier
   roadmap cannot consume §3.1 (that edge would be upward), and it has already contracted the same
   theorem to ProfiniteCohomology Layer 9, a roadmap on main. The package report's premise
   ("ProfiniteCohomologyPartII … later than this roadmap … should import these two results from here")
   no longer holds at the current order. §3.2 (sections through pro-`p` kernels) has no second owner:
   ProfiniteProPGroups §§5.5–5.6 require a pro-`p` source, and no open head states the pro-`p`-kernel
   form.

   **Repair.** One owner, the earliest: ProfiniteCohomology.

   1. Add to the top-level `gaps` of `design/plan.json`:
      `{"slug": "char-p-galois-cd-le-one", "supplier": "ProfiniteCohomology", "section": "Layer 9 (Hilbert 90 and Kummer theory) with Layer 11", "needs": "For every prime p and every field F of characteristic p, the absolute Galois group of F has p-cohomological dimension at most one, TauCeti.cohomologicalDimensionAt p (Field.absoluteGaloisGroup F) ≤ 1 (Serre, Galois Cohomology, II §2.2, Proposition 3), from the Artin–Schreier sequence and the vanishing of Hⁱ(G_F, Fˢ) for i ≥ 1."}`
   2. README, under `### From TauCetiRoadmap.ProfiniteCohomology`, add:
      "- What ProfiniteCohomology must provide (gap:char-p-galois-cd-le-one): for every prime `p` and
      every field `F` of characteristic `p`, `TauCeti.cohomologicalDimensionAt p
      (Field.absoluteGaloisGroup F) ≤ 1` (Serre, *Galois Cohomology*, II §2.2, Proposition 3), from the
      Artin–Schreier sequence and the vanishing of `Hⁱ(G_F, Fˢ)` for `i ≥ 1`. It is the same statement
      ProfiniteCohomologyPartII asks of Layer 9."
   3. README §3.1: replace "Prove `cohomologicalDimensionAt_absoluteGaloisGroup_le_one`: …" by an
      import paragraph ("§3.6 uses, for the residue field `κ` of characteristic `p`, the bound
      `cd_p(G_κ) ≤ 1` of ProfiniteCohomology (gap:char-p-galois-cd-le-one)"), keep the three Checks as
      Checks of the imported statement, and change the *Needs:* of §3.6 from "§§3.1–3.2" to
      "§3.2; ProfiniteCohomology (gap:char-p-galois-cd-le-one)".
   4. README line 36: delete "the characteristic-`p` bound `cd_p(G_F) ≤ 1`," from "Owned here"; line
      20: replace "the two profinite inputs of that splitting: `cd_p(G_F) ≤ 1` in characteristic `p`,
      and sections …" by "the profinite input of that splitting that no library has: sections …";
      line 1489: replace "§§3.1–3.2" by "§3.2".
   5. `Suggested.lean`: delete `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` (lines 102–108)
      and reword the module-docstring bullet (lines 27–29) to name only the section theorem.

   Tested on the refuting instance: after the change ProfiniteCohomologyPartII (386) and this roadmap
   (388) both cite ProfiniteCohomology (main) for the bound, and no edge points from 386 to 388.

2. **F02** (P2) "totally ramified" conflicts with RamificationOfCompleteDiscretelyValuedFields, which the README never names

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:123–124` ("Totally ramified permits
   a purely inseparable residue extension; the condition `f = 1` is the local-field specialization
   (§2.9)"), `:797–798` (Check: "`𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))` is totally ramified in this
   convention"), `:25–27` and `:853–861` (scope and §2.9 compare with local fields only).

   **Claim.** `f = 1` is only the local-field specialization, and the only earlier ramification theory
   to compare with is that of nonarchimedean local fields.

   **Witness.** `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:545–555` (main,
   first in the merge order, §3a.1 Check): over `K = F_p(s)((t))`, `L = K(y)`, `y^p − y = s·t^(−p)`
   has `e = 1`, purely inseparable residue extension of degree `p`, and "`f(L/K_0) = p`, so `L/K_0`
   is not totally ramified". Here the same `L/K` is Galois with `L ∩ Kᵘ = K`, hence linearly disjoint
   from `Kᵘ`: totally ramified. Same field, same word, opposite verdicts; neither roadmap says so.

   **Repair.**

   - Line 123–124, replace the sentence by: "Totally ramified permits a purely inseparable residue
     extension. For finite extensions of complete discretely valued fields,
     RamificationOfCompleteDiscretelyValuedFields §3a.1 uses totally ramified for `f = 1`; that
     implies the notion here, and the two agree exactly when the residue extension is separable, in
     particular for local fields (§2.9)."
   - "Left to other roadmaps and the libraries", new bullet: "Finite extensions of complete
     discretely valued fields with arbitrary residue field, their lower and upper ramification
     filtrations, Herbrand functions, the different and Hasse–Arf are
     RamificationOfCompleteDiscretelyValuedFields, Layers 3a–4a. §2.9 compares its unramified and
     totally ramified extensions with the classes here and states nothing about filtrations."
   - §2.9, add the target: "For a finite extension `L/K` of complete discretely valued fields, prove
     that `L/K` is unramified here exactly when `e = 1` and `κ_L/κ_K` is separable (the notion of
     RamificationOfCompleteDiscretelyValuedFields §3a.1), and that `f = 1` implies totally ramified
     here, with equivalence when `κ_L/κ_K` is separable." Add the Check: "Over `𝔽_p(s)((t))`, the
     extension `y^p − y = s·t^{−p}` has `e = 1` and residue extension `𝔽_p(s^{1/p})/𝔽_p(s)`; it is
     totally ramified here and has `f = p`, so it is not totally ramified in the sense of
     RamificationOfCompleteDiscretelyValuedFields §3a.1." Add that roadmap to the *Needs:* of §2.9,
     to `## Exact supplier contracts` (`### From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields`:
     §3a.1, the notions unramified and totally ramified of a finite extension) and to the Layer 2
     Dependencies.

   Tested on the refuting instance: with the added sentence and Check, `y^p − y = s·t^{−p}` is
   recorded as totally ramified here, `f = p` there, and the two statements no longer contradict.

3. **F03** (P3) the link to the base roadmap is broken

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:3`:
   "[Local fields and ramification](../LocalFieldsRamification/README.md)".

   **Witness.** The base roadmap is `Completed/LocalFieldsRamification/README.md` on main; there is no
   `TauCetiRoadmap/LocalFieldsRamification/`. From `TauCetiRoadmap/LocalFieldsRamificationPartII/` the
   link resolves to a missing file. `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:4`
   links it as `../../Completed/LocalFieldsRamification/README.md`.

   **Repair.** Replace the target by `../../Completed/LocalFieldsRamification/README.md`.

4. **F04** (P3) the pinned rank-one continuity of roots is neither cited nor delimited

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:1089–1107` (§4.1, "roots of monic
   polynomials depend continuously on the coefficients"; *Needs:* lists `Valuation.RankOne`,
   `IsKrasner`, … only) and `:151–153` (the Mathlib contract for §4.1).

   **Witness.** `Mathlib/Analysis/Normed/Field/Approximation.lean:115` at the pin:
   `Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt` ("Continuity of Roots"; monic `f`, `g`
   of equal degree over a normed field, a root `a` of `f`, gives a root `b` of `g` with an explicit
   bound on `‖a − b‖`), with `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` in the same
   file. It is the rank-one, one-direction case of §4.1; §4.1 is stronger (any Krull valuation, both
   directions, the threshold `ε_{f,g}`, uniqueness above `kras(f)`), so the target stays.

   **Repair.** Add to `### From Mathlib`: "`Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt`
   and `Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`,
   `Mathlib/Analysis/Normed/Field/Approximation.lean`: continuity of roots over a normed field, from a
   root of `f` to a root of a monic `g` of the same degree, with a strict bound. It has no Krull-valued
   form, no statement from the roots of `g` to those of `f`, and no uniqueness; §4.1 proves those." Add
   both names to the *Needs:* of §4.1.

5. **F05** (P3) ProfiniteProPGroups is consumed in *Needs:* lines but has no supplier contract and is cited by a prose title

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:962–963` ("Profinite and pro-`p`
   groups, Layer 5 (§§5.1–5.6) and Layer 6 (Serre's theorem, step 1)"), `:76–89`, `:1076`.

   **Witness.** `## Exact supplier contracts` has six subsections (Mathlib, Tau Ceti,
   SchemeAndStackFoundations, ClassicalAdicEtaleCohomology, LocalFieldsRamification,
   ProfiniteCohomology); none for `Completed/ProfiniteProPGroups`, whose Layer 2 (line 354), items
   5.1–5.6 (lines 1094–1166) and Layer 6 (line 1246) are the ones cited. The string
   "ProfiniteProPGroups" does not occur in the README, so the edge is invisible to a name-based check.

   **Repair.** Add `### From TauCetiRoadmap.ProfiniteProPGroups`: "Layer 2 (profinite Sylow theory:
   existence, conjugacy, images under continuous surjections); Layer 5, items 5.1–5.6 (finite embedding
   problems, `HasElementaryAbelianSolutions`, `HasPGroupSolutions`, compatible level solutions and the
   inverse-limit lifting, for a pro-`p` source); Layer 6 (Serre's theorem, step 1: `cd_p G ≤ 1` solves
   the elementary abelian problems; `cd_p` of a Sylow pro-`p` subgroup). All are at the pinned Tau Ceti
   under the names listed above. Used in §§2.2, 3.2 and 3.6." Write "ProfiniteProPGroups" for
   "Profinite and pro-`p` groups" at lines 76–89, 962–963 and 1076.

6. **F06** (P3) the stage labels `GF.0`–`GF.6`, which two open roadmaps cite, are not in the README

   Re-raised: the remark under "For the maintainer" in `reports/FIX-PKG-LocalFieldsRamificationPartII~2.md`
   ("That is a change for that roadmap, not this package"). The reason fails because
   `reports/FIX-PKG-LocalFieldsRamificationPartII~3.md` itself relies on the labels being "unchanged"
   for the two consumers, while the README contains no occurrence of `GF.`; a one-sentence mapping in
   this README is the repair the overlap rule provides and costs the consumers nothing.

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:290–308` ("How to read the build").

   **Witness.** `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:83–84` at its open head cites
   "`LocalFieldsRamificationPartII` §GF.1 … §GF.4 … §GF.5"; `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:18, 94`
   cites "GF.0–GF.6". `design/README.md` has the headings `GF.0`–`GF.6`; the package README has
   `Layer 0`–`Layer 6` and `grep -c 'GF\.'` gives 0.

   **Repair.** Append to "How to read the build": "Layer `k` is also cited as `GF.k`, for `k = 0, …, 6`
   (`GF.1` is Layer 1, `GF.4` Layer 4, `GF.5` Layer 5)."

Two P2 findings (one theorem with two owners, one unacknowledged convention conflict with a roadmap
on main) and four P3 findings. No false statement was found: every Lean declaration and every bold
README target was instantiated on the boundary cases below and held.

## Verified sound

Counts: 14 declarations read (7 definitions, 7 theorems; all 14 elaborated signatures in the
worker's `signatures.md` compared with the README statements, no lost binder, no change); 42 target
subsections read (README lines 1–1558, every line); every citation of the eight cached sources
resolved to its line (48 citations of `temkin17` and 21 of the other seven); 144 Checks read against
the statements of their sections, the ones in the table below recomputed, none found false; 6
supplier roadmaps resolved; the 45 distinct Tau Ceti names and the Mathlib names of the supplier
contracts found at the pins.

**Dependency check** (command of the brief): `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)` — no
UPWARD, CYCLE or `moved:` line.

**Adversarial table.** Values are computed, `p` is the residue characteristic exponent.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `IsPNumber` | `n = 0`, `P` all primes; `P = ∅`, `n = 1, 2`; `P = {3}`, `n = 6, 9` | `0 < 0` false; `1`: true, `2`: `2 ∉ ∅` false; `6`: `2 ∉ {3}` false, `9` true | matches §0.1 Checks | none |
| `IsPClosed`, `IsSeparablyPClosed` | `P = ∅`; `E` infinite; `𝔽_p(t)ˢ`, `P = {p}` | only `finrank = 1` admissible ⇒ `E = ⊥`; `finrank = 0` not a `P`-number; `t^{1/p}`: degree `p`, inseparable ⇒ closed fails, separably closed holds | true | none |
| `IsTameGaloisExtension` | trivial `V`; `ℚ_p(ζ_p)`; `ℚ_2(i)`; unramified degree `p`; `ℚ(√2)` at 7; `p = 1` | inertia orders `1`; `p − 1`; `2`; `1` (decomposition `p`); `1, 1`; coprime to `1` always | matches §2.4 Checks | none |
| `IsSeparablyTameField V ⟺ Kˢ = Kᵗ` | `W = 1`; `W ≠ 1` | image of `I` in each `Gal(L/K)` is the inertia group, image of `W` its Sylow `p`-subgroup; all images of `W` trivial ⟺ `W = 1` | true | none |
| `galoisTamePart` | henselian `V`; `ℚ` at 2 with `X³ − X − 2`; `p = 1` | `= Kᵗ` (`W` normal); disc `−104 = −8·13`, `v₂ = 3` odd, `D = I = W` of order 2, not normal in `S₃` ⇒ cubic field in `Kʰ` not in the compositum; `= Kˢ` | matches §2.4 | none |
| `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` | `𝔽_p`; separably closed; `ℚ_p` | `cd_p Ẑ = 1`; `0`; hypothesis `CharP ℚ_p p` fails (`cd_p = 2`) | true; ownership R01 | R01 |
| `exists_continuous_section_of_isProP_ker` | trivial kernel; `ℤ/p² → ℤ/p`; `Ẑ → ∏_{ℓ≠p} ℤ_ℓ`; route (b) | `f⁻¹`; `cd_p(ℤ/p) = ∞`, no section; `cd_p = 0`, section = inclusion; minimal `H`: `H′ = {h : hU = β_U(f h)}` closed, onto, so `= H`, hence `H ∩ N ⊆ ⋂U = 1` | true | none |
| `sup_galoisTamePart_eq_top_of_henselian` | trivial valuation, imperfect `K`; `p = 1`; separably closed imperfect henselian `K` | `Kᵗ = Kˢ`, `E = K^{perf}`, sup `= Kᵃ`; `Kᵗ = Kᵃ`, `E = K`; `Kᵗ = K`, `E = Kᵃ` | true (KPR 2.1(ii): a maximal disjoint `E` is a complement) | none |
| `algebraicIndependent_of_valuation_independent` | `x_i = 0`; value in `Γ_K`; `ι = κ = ∅`; `n = 0`; torsion mod `Γ_K` | `0^1 = 0 = vL(0)` in range ⇒ `n = single i 1 = 0`, contradiction: excluded; excluded by `n = (1)`; empty family independent; product `1` in range, `n = 0` allowed; `m·n` is a nonzero relation ⇒ hypothesis equals rational independence | true, equals KKV Lemma 2.1 | none |
| `ringKrullDim_le_ringKrullDim_comap_add` | `n = 0`; `K(t)`, `t`-adic; `ℚ(t)`, composite; infinite `trdeg` | `d ≤ d`; `1 ≤ 0 + 1`; `2 ≤ 1 + 1`; hypothesis false | true | none |
| `isTameField_of_isPClosed` | `p = 1`; trivial valuation, char `p`; `ℚ_p`; algebraically closed; fixed field of a Hall `p′`-subgroup of `G_{ℚ_p}` | `P = ∅`, hypothesis empty, char 0 perfect, coprime to 1; no `X^p − a` ⇒ perfect, inertia trivial; `X^p − p` violates hypothesis; true; every finite extension has degree prime to `p`, `W = 1` | true | none |
| `isSeparablyTameField_of_isSeparablyPClosed` | `1 ∈ P`, `p = 1`; `P = ∅`; `P = {4}`; `𝔽_p(t)ˢ` | conclusion trivial; `hp` never holds; `P`-numbers `{1}`, `hp` never holds; perfection `{p}`-closed ⇒ tame ⇒ `W = 1` | true | none |
| §0.2 "`M/K` is a `P`-extension iff `M/L` and `L/K` are" | `L/K` infinite | finite `F/L` descends to `F₀/L₀` of the same degree, `[F₀:K] = [F₀:L₀][L₀:K]` | true | none |
| §1.1 | `ℚ(√2)`, `V = ℤ_(7)`, `ℤ_(3)` | `3² = 9 ≡ 2 mod 7`: two primes; `2` nonsquare mod 3: one | true | none |
| §1.5 Prüfer route | Stacks 15.26.4 hypotheses | `S₀ = A` finite over `A`; `A` a domain (Remark 15.26.5 (3)); `N/N_tors` torsion free ⇒ flat over Prüfer `A` | route valid | none |
| §2.4 "tame iff `[L:M]` prime to `p`" | `K` henselian | `L`, `Kᵘ` linearly disjoint over `M`; index-prime-to-`p` subgroup of `W ⋊ T` contains `W` | true | none |
| §2.6 "purely wild iff totally ramified `{p}`-extension" | trivial valuation, `𝔽_p(t^{1/p})`; `p = 1` | disjoint from `Kˢ`, degree `p`; `{1}`-numbers are `{1}` ⇒ trivial | true | none |
| §3.4 | trivial valuation; `ℚ_p` | `K_hu = Kˢ`, `K_rt = K`, `Kˢ ⊗ K = Kˢ = Kᵗ`; value group of `K_rt` becomes `ℤ_(p)`-divisible by adjoining `ℓ`-th roots | true | none |
| §3.5 route | (0) ⇒ (3) ⇒ (2) ⇒ (1) without the group form | `K = K_w` and (0) give `Kᵗ = Kᵃ`; `(K_w)_w = K_w`; `Kᵃ/KᵗK_w` tame and purely wild | closes | none |
| §4.1 | `f = g = X² − 1` at 2; `f = X`, `g = X − 2`; `f = X² − 1/16`, `g = f + 2X`; `n = 0`; `deg g ≠ n` | `kras = 1`, both roots at value `≥ 1`; `ε = 1`, attained; `ε = 1/2 − 2 < 0`, roots `5/4 + 8w`, `−13/4 − 8w`, distances `0, −1`; nothing asserted; `v(f − g) ≤ 0 ⇒ ε ≤ 0` | matches CKS Theorem 16 | R04 only |
| §4.3 | `ℚ(t)`, `E = Kʰ`, `p = 1` | LHS false (`E ≠ K`), RHS without "henselian" true | hypothesis needed, stated | none |
| §5.2 | char `K = p`; char 0 | all `p_i = p` (`n = 0`); `p_i` jumps once from 1 to `p` | true | none |
| §5.5, §5.6 | `ℚ_p((s))/ℚ_p((t))`, `s^p = t`; tame field with `Γ` not `p`-divisible | coarse tame, residual trivial, `ℤ/p` torsion ⇒ not tame; `K(a^{1/p})` has `e = p`, one prolongation ⇒ not tame | true | none |
| §6.1–§6.3 | `κ_i` of char 0 or `p`; `K₀` | `p`-th roots in `K` pass to `V_i` and `κ_i` ⇒ perfect; `K₀` perfect and algebraically closed in `K` ⇒ `F ⊗_{K₀} K` a field of the same degree | true | none |
| Convention "totally ramified" | `F_p(s)((t))`, `y^p − y = s t^{−p}` | here: totally ramified; RamificationOfCompleteDiscretelyValuedFields §3a.1: `f = p`, not | conflict | R02 |

**Lean versus README.** Every Lean name occurs in the README with the same binders and hypotheses.
Imports are `Mathlib` and two existing Tau Ceti modules; no `set_option`, no `lemma`, no sorry'd
data, no `example`. The profinite carrier omits `T2Space`; a totally disconnected topological group
is Hausdorff, so nothing is lost.

**Headlines and padding.** Headlines: tameness theorem (stated), separable export (stated),
Kuhlmann–Pank–Roquette over henselian fields (stated), sections through pro-`p` kernels (stated),
Abhyankar and the height bound (stated), `cd_p(G_F) ≤ 1` (stated; see R01), the height-one splitting,
tensor decomposition and composition criteria (named as not statable; the reasons given are correct
at the pins: Mathlib has `decompositionSubgroup` and `inertiaSubgroup` only, Tau Ceti has
`Henselization.algebra` as a ring). One-tactic probe on the 7 theorems: none follows from one
library lemma; the 7 definitions are each used by a stated theorem. No padding.

**Pinned declarations.** The 45 distinct Tau Ceti names and the Mathlib names in the supplier
contracts exist at the pins in the files named (spot-read: `TauCeti.CohomologicalDimensionLE`,
`cohomologicalDimensionAt`, `IsProP`, `Henselization.existsUnique_isLocalHom`,
`StrictHenselization.fromHenselization`, `ValuationSubring.inertiaSubgroup`, `IsKrasner`,
`Field.absoluteGaloisGroup`). No pinned declaration proves a stated theorem: the nearest are
`TauCeti.cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_not_mu` (local fields, pro-`p`
quotient) and `TauCeti.exists_continuous_section` (set-theoretic sections of `G → G/H`).

**Sibling citations.** SchemeAndStackFoundations §0.12 `henselization_at_prime`, §0.13
`henselization_integral_base_change`, `henselization_coprime_product` (main lines 1160–1236; same
names at its open head); ClassicalAdicEtaleCohomology §5.1 (a)–(c) and §5.3 (i)–(iii) (open head,
merge-order line 75) state what the contract quotes; LocalFieldsRamification Layers 2–4 with
`IsUnramified K L`, `ramificationIndex`, `IsTamelyRamified`, `wildInertia`,
`TauCeti.inertiaSubgroup K`; ProfiniteCohomology Layer 11 with `cd_p_le_iff_finite_pPrimary`,
`cd_p_le_of_isClosed`; ProfiniteProPGroups items 5.1–5.6 and Layer 6.

**Declared gap.** `gap:source-side-fpqc-descent` has the same slug and sentence in `design/plan.json`
and README line 252; its two clauses agree with EGA IV 17.7.5(iv) and 17.7.7 (`ega4` lines
2750–2758, 2795–2798); the pinned `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat` and
`Algebra.FinitePresentation.of_finitePresentation_tensorProduct_of_faithfullyFlat` are base-change
descent and do not provide it. Not raised.

**Sources.** `temkin17`: every locator (§§2.1.1–2.6.6, Lemma 3.2.5; printed page = extraction page
+ 96) at lines 249–640 and 796. `kpr86`: Theorems 2.1–2.2 (lines 154–169, p. 42), Corollary 2.5 and
the proof of Theorem 2.2 (lines 221–236, p. 44). `kkv16`: Lemma 2.1 (line 238, p. 6), (12) (line
359, p. 8). `cks23`: Theorem 14 and Example 15 (lines 610–625, p. 12), Theorem 16 (lines 640–652,
pp. 13–15). `aid25`: lines 210, 306, 366, 391, 515. `temkin10`: Proposition 2.2.2 (line 520,
pp. 11–12). `stacks-more-algebra`: tags 0A04, 0F0L, 0537, 053D, 05GS, 053E, 0ASJ, 0ASK at lines
1668, 1680, 2382, 2879, 2895, 2906, 17762, 17792. `ega4`: 17.7.5, 17.7.7, 18.6.8, 18.6.14 at lines
2750, 2795, 5517, 5616.

**Policy.** The pull request changes only `packages/LocalFieldsRamificationPartII/`. No process
words, pull-request numbers or algorithms in the README or docstrings; no layer is named after a
source's chapter. No suspicious instruction was found in any text read.

**Ownership against open pull requests.** Searched by object with `roadmaps grep` over the open
heads and main: Abhyankar inequality, composed valuations, the henselization of a valuation ring,
finite presentation over valuation rings, continuity of roots, sections with pro-`p` kernel, the
characteristic-`p` bound. Only the last has another owner (R01). No `Suggested.lean` at a readable
head declares a name in `TauCetiRoadmap.LocalFieldsRamificationPartII`.

## Not verifiable

- Serre, *Galois Cohomology*, I §3.4 Proposition 16 and II §2.2 Proposition 3 with Corollary 1
  (`serre-cg`, settled as uncertified): locators not read; `kpr86` lines 228–234 cite the same
  pages for the same two statements.
- Raynaud–Gruson, Corollaire 3.4.7 (`rg71`, settled as uncertified): not read; `temkin17` line 374
  invokes it for the step §1.5 uses, and §1.5's own route goes through Stacks 15.26.4 instead.
- No Lean was run (read-only pass): the elaborated types are those of the worker's `signatures.md`.

## Source issues

- **Error** in temkin17 at §2.4.6, assertion (4), printed p. 108: the source says the absolute Galois group surjects onto the Galois group of the tame closure and that this map splits, for any class of valued fields; it should be restricted to henselian fields, where the tame closure is Galois, with a subgroup factorization otherwise; affects nothing.
- **Misprint** in temkin17 at Lemma 2.3.2, printed p. 104: the source says the factors are indexed by the nonisomorphic valued extensions with the given underlying field; it should be the distinct prolongations of the valuation to that field; affects a stated result.
- **Misprint** in temkin17 at Lemma 2.3.4, printed p. 105: the source says every localization of the integrally closed subalgebra is a valuation ring; it should be every localization at a prime ideal, as its proof shows; affects a stated result.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112: the source says the height-one case is part (ii) of Corollary 2.5.6; it should be Corollary 2.5.6, which has a single assertion; affects nothing.
- **Gap** in temkin17 at proof of Lemma 2.6.3(ii), last step, printed p. 112: the source says the prime dividing the residual degree is the characteristic of the coarse residue field; it should be the final residue characteristic exponent, which need not equal the coarse one; affects the proof.
- **Gap** in temkin17 at proof of Theorem 2.6.6, last paragraph, printed p. 112: the source says the relative algebraic closure of the finite-transcendence-degree subfield is again closed for the prime, without argument; it should use that it is perfect, so that the big field is regular over it; affects the proof.
- **Misprint** in cks23 at proof of Theorem 16(c), author's p. 14: the source says it will show a strict lower bound for the distance value between paired roots; it should be the non-strict bound of the statement, which is attained; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a6b9eb258b07d8a3defc8b1b9eedf986b1ad4439", "job": "RT-LocalFieldsRamificationPartII~1b", "model": "fable", "worker": "chris-x8"} -->
