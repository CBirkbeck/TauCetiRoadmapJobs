# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 31cd051)

**Verdict:** needs changes

This is a full review: the folder changed by 159 lines since bf98cae, and the pins moved to Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b (they were 358314d4 and f6090c70). Gate at this head, rerun here: every check passes. Dependency check: `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD or CYCLE line. `lake env lean` of `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0 with two `declaration uses sorry` warnings (lines 51 and 71) and nothing else. Outside the folder, `git diff --stat origin/main...HEAD` lists only the folder's three files. There is no `design/plan.json`, so no gaps are declared.

## Previous findings

The previous review (at bf98cae) recorded no finding. The finding before it (separable residue extension for Herbrand's theorem, tower transitivity and the intersection formula) remains repaired. README lines 342–349 read "when the residue extension of `L/K` is separable (a hypothesis the residue extensions of `L/K′` and `K′/K` inherit …), Herbrand's theorem … under the same separability hypothesis, tower transitivity … for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = …`". The refuting Check at lines 399–418 is unchanged, and its values recompute (table).

## R01 (P2) — Herbrand's quotient theorem and tower transitivity are statable at the pins but declared not statable

**Location.** `Suggested.lean` lines 22–25: "Not statable at the pins … the Herbrand function, its inverse and the upper numbering on the local-ring filtration with their quotient and tower theorems … which lack a Herbrand function on `TauCeti.IsLocalRing.ramificationGroup`". README lines 201–204 make the same claim ("README targets whose carriers it does not yet have").

**Claim.** These two theorems are headlines in the README Summary (lines 8–9) and in the docstring's own list. A missing Herbrand function is not a missing carrier: `φ` is a single interval integral of Tau Ceti's `ramificationGroupReal`, which is a simple definition with a real body. The quotient action needed for the statement is already native at the pin.

**Witness.** Mathlib `RingTheory/Invariant/Basic.lean:62–84` provides `MulSemiringAction (G ⧸ H) (FixedPoints.subalgebra A B H)` and `Algebra.IsInvariant A (FixedPoints.subalgebra A B H) (G ⧸ H)` (also present at the old pin). A scratch copy containing the three definitions and the two theorems below elaborates with only `sorry` warnings.

**Repair.** Add to `Suggested.lean`, under the Layer 3a section and with docstrings:

```lean
noncomputable def herbrandFun (G : Type*) [Group G] (S : Type*) [CommRing S] [IsLocalRing S]
    [MulSemiringAction G S] (u : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..u,
    (Nat.card (TauCeti.IsLocalRing.ramificationGroupReal G S t) : ℝ) /
      Nat.card (TauCeti.IsLocalRing.ramificationGroup G S 0)

noncomputable def inverseHerbrandFun (G : Type*) [Group G] (S : Type*) [CommRing S]
    [IsLocalRing S] [MulSemiringAction G S] (v : ℝ) : ℝ :=
  sInf {u : ℝ | v ≤ herbrandFun G S u}

noncomputable def upperRamificationGroup (G : Type*) [Group G] (S : Type*) [CommRing S]
    [IsLocalRing S] [MulSemiringAction G S] (v : ℝ) : Subgroup G :=
  TauCeti.IsLocalRing.ramificationGroupReal G S (inverseHerbrandFun G S v)
```

Then add two theorems, each with the binders of `hasseArf_dvd_sum_card_ramificationGroup` minus `IsMulCommutative`, plus `(H : Subgroup G) [H.Normal] [IsLocalRing (FixedPoints.subalgebra A B H)]`:

- `upperRamificationGroup (G ⧸ H) (FixedPoints.subalgebra A B H) v = (upperRamificationGroup G B v).map (QuotientGroup.mk' H)` for `−1 ≤ v`;
- `herbrandFun G B u = herbrandFun (G ⧸ H) (FixedPoints.subalgebra A B H) (herbrandFun H B u)` for `−1 ≤ u`.

The `IsLocalRing` binder is needed because the instance is not inferred at the pin (tested). It holds in this setting, since `B^H` is the integral closure of `A` in `L^H`. The `sInf` definition of `ψ` takes no junk value on `[−1, ∞)`. For `t ≤ 0` the integrand is at least `1` (because `G_(⌈t⌉) = G` for `t ≤ −1`), so `φ(u) ≤ u` there. For `t > 0` it is at least `1/#G_0`, so `φ(u) ≥ u/#G_0`. The set is therefore nonempty and bounded below, and on the Artin–Schreier extension this gives `ψ(2) = p + 1`, as the §3a.2 Check says.

Name the new declarations in the README's §3a.2 statements and remove them from the docstring's "not statable" list. In the docstring, give Layer 4a's real missing carrier: at the pin, neither library gives a local-ring or DVR instance on `integralClosure A M` for the finite levels `M`. The upper-numbering form of §3a.3 is then statable too, but the stated lower-numbering form is equivalent, so it need not be added. At README lines 201–204, replace "whose carriers it does not yet have" with timeless wording.

## R02 (P3) — The completed roadmap is cited by group labels that only its open revision defines

**Location.** README lines 25–30 ("The completed roadmap is cited by the groups of its *From Tau Ceti* supplier contract (*Finite extensions*, … *Absolute Galois group*)"). The same labels recur at lines 140–164, 208, 288, 299–301, 356, 384, 583–585, 594, 626, 729–730, 748, 758–759 and 784–785.

**Witness.** Main `Completed/LocalFieldsRamification/README.md` has no *From Tau Ceti* contract. "From Tau Ceti", "Herbrand functions and upper numbering" and "Different and discriminant" each occur 0 times there, and its sections are Layers 0–4 (lines 72, 281, 576, 724, 1154). The labels are defined only at the head (893faab) of the open LocalFieldsRamification revision, pull request #617, in its README lines 150–271. The description's merge-order paragraph does not name that revision.

**Repair.** In the description's merge-order paragraph, name the LocalFieldsRamification revision (#617) as merging before this pull request. Main's Layer 0–4 numbering is not a safe alternative: that revision drops it, keeping only the "Former layer numbers" table at its line 273.

## R03 (P3) — `TauCeti.inertiaSubgroup` is listed among carriers that assume no finite residue field

**Location.** README lines 132–134: "`TauCeti.inertiaSubgroup` and `TauCeti.fixingSubgroup_fixedField`. These are the carriers on which Layer 3a is stated; none of them assumes a finite residue field".

**Witness.** At the pin, `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:105,112` declares `[IsNonarchimedeanLocalField K]`, and `#check @TauCeti.inertiaSubgroup` shows that binder. For `K = F̄_p((t))` (infinite residue field) the declaration does not apply. Layer 3a does not use it.

**Repair.** Delete `TauCeti.inertiaSubgroup` from this list. It is already listed under *Absolute Galois group* (line 162) and used only in §4a.1's local-field agreement. Alternatively, move it to the local-field sentence at line 135.

## R04 (P3) — The component-group theory of the proalgebraic-unit target cites a text that does not prove it

**Location.** README lines 471–479 and 487–488. The target owns "identity components `H⁰`, with component group `π₀(H) = H/H⁰`", "right exactness of `π₀` and its compatibility with inverse limits" and the quasialgebraic structures. Its only sources are Serre 1961 §1 n° 1.1–1.6 and §2 n° 2.1–2.3.

**Witness.** Serre 1961 does not prove these facts; it takes them from its reference [21], Serre, *Groupes proalgébriques*, Publ. Math. IHÉS 7 (1960) (serre1961 line 1922). The places it invokes [21] are:
- quasialgebraic structure, [21] n° 1.2 (line 256);
- kernels and images under projective limits, n° 2.5 (line 720);
- connected component, n° 5.1 (line 630);
- homotopy exact sequence, n° 5.3 (line 651);
- limits of `π₀`, n° 0.1, Prop. 2 (line 1168).

**Repair.** Add *Groupes proalgébriques* (Numdam, Publ. Math. IHÉS 7) to the References and to the package's `sources.toml`. Cite it, at those numbered paragraphs, for the `H⁰`, `π₀`, exactness and inverse-limit assertions, after checking the numbering against the text.

## Verified sound

**Adversarial pass** (34 rows; values computed in this review):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hilbert's formula (`Suggested.lean` 51) | `ℚ_2(ζ_8)/ℚ_2` | `#G_0..#G_4 = 4,4,2,2,1`; `Σ(#G_i − 1) = 3+3+1+1 = 8`; `v_L(𝒟) = 8` (discriminant `2^8`, `f = 1`) | agrees | none |
| same | trivial `G` | `B = A`, `differentIdeal A A = ⊤ = 𝔪^0`, sum `0` | agrees | none |
| same, separability dropped | `F_2(s,u)((t))`, `z₁² − tz₁ = s`, `z₂² − tz₂ = u`, `B = A[z₁,z₂]` (`B/(t)` a field of degree 4) | each `σ ≠ 1` moves a generator by `t`: `i(σ) = 1`, `G_0 = G`, `G_1 = 1`, sum `3`; `𝒟 = (f₁′(z₁))(f₂′(z₂)) = (t²)`, `d = 2` | `𝔪² ≠ 𝔪³`: hypothesis needed | none |
| same, monogenic but inseparable | §3a.1 Check, `f = Z^p − t^(p−1)Z − s` | `f′(z) = −t^(p−1)`, `d = p − 1`; `G_0 = G`, `G_1 = 1`, sum `p − 1` | holds: separability enters only through monogenicity | none |
| same, `A` not complete | `ℤ_(2)` and `ℤ[ζ_8]` localized at `(1 − ζ_8)` | lower groups as for the completion, `d = 8` | agrees | none |
| Hasse–Arf (`Suggested.lean` 71) | `ℚ_2(ζ_8)` | `j=1`: `4 ∣ 4`; `j=3`: `4 ∣ 8`; non-jump `j=2`: `4 ∤ 6`, excluded by `hj` | agrees | none |
| same | `ℚ_3(ζ_9)`: `#G_0,#G_1,#G_2,#G_3 = 6,3,3,1` | `j=0`: `6 ∣ 0`; `j=2`: `6 ∣ 6`; non-jump `j=1`: `6 ∤ 3` | agrees | none |
| same | tame; residue characteristic 0; trivial `G` | only `j = 0`, empty sum `0`; `hj` never holds for trivial `G` | agrees | none |
| same | abstract `C_9` filtration (Check, line 567) | `j = 5`: `9 ∤ 21`, `φ(5) = 7/3`; subgroup break `5`, quotient break `1` | excluded, as the Check says | none |
| Herbrand's theorem (R01) | `ℚ_2(ζ_8)`, `H = {1,7}` | `{1,5}H = G`, so `G^v H/H = G/H` for `v ≤ 2`, `1` after; `ℚ_2(√2)`: `v_L(−2√2) = 3`, lower = upper jump `2` | agrees | R01 |
| same, inseparable residue | §3a.2 Check | `(G/H)^(1/2) = (G/H)_1 = 1`; `G^(1/2) = G_1 = G` | fails as the Check says; hypothesis kept | R01 |
| tower transitivity (R01) | `ℚ_2(ζ_8) ⊃ ℚ_2(√2) ⊃ ℚ_2` | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; reversed order `ψ_(L/K)(5) = 8` | agrees | R01 |
| `ψ := sInf` (R01 repair) | `v ≥ −1`, finite `G`; Artin–Schreier | `φ(u) ≤ u` (`u ≤ 0`), `φ(u) ≥ u/#G_0` (`u ≥ 0`); `ψ(2) = 1 + p(2 − 1) = p + 1` | no junk on `[−1, ∞)` | none |
| `TauCeti.inertiaSubgroup` carrier claim (R03) | `F̄_p((t))` | binder `[IsNonarchimedeanLocalField K]` | false | R03 |
| §3a.1 graded character (Check line 305) | `π = y⁻¹`, `σy = y + 1` | `σπ − π = −1/(y(y+1))`, `v = 2`; `(σπ − π)/π² = −y/(y+1) ↦ −1`; `σπ/π ↦ 1` | agrees | none |
| §3a.1 monogenicity Check | `C_p × C_p` over `F_p(s,u)((t))` | `a^p − a = (is+ju)t^(−p)` forces `v(a) = −1`, `a_(−1)^p = is+ju ∉ F_p(s,u)^p`; `f = p²`; one generator gives degree `≤ p` | agrees | none |
| §3a.2 separability Check | `π₀ = 1/w`, `σ`, `τ` | `π₀² + tπ₀ − t = 0`; `τπ₀ − π₀ = −π₀²/(1+π₀)`, `v_M = 2`; `σz − z = t`, `v_M(t) = 2`; `(G/H)_1 = 1` since `v_(L₁)(t) = 1`; class formula `(2+2)/2 = 2 ≠ 1` | agrees | none |
| §3a.2 Checks | Artin–Schreier; `ζ_p`; `G_0 = 1`; trivial `C_2` on `ℤ_2` | `φ = 1 + (u−1)/p` past `1`; `φ = u/(p−1)`, `ψ(1) = p−1`; identity; integrand constantly `1` | agree | none |
| sampled: perfect-residue package Checks | Artin–Schreier over `F̄_p((t))`; `ζ_p` over `Frac W(F̄_p)`; `ℚ_2(ζ_8)` | `i(σ) = 2`, `d = 2(p−1)`, break `φ(1) = 1`; `d = p−2`, break `0`; `φ(1) = 1`, `φ(3) = 2` | agrees | none |
| sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)((t))`; tame degree `e` | `t` stays a uniformizer; `F_(p²)((t)) ⊗ F̄_p((t)) ≅ F̄_p((t))²`; tame keeps `#G_0 = e`, `G_1 = 1` | agrees | none |
| EGA flat extension is a DVR | `R → R′` flat local, `𝔪_R R′ = 𝔪_(R′)` | `𝔪_(R′) = (π)` with `π` a nonzerodivisor (flatness): regular local of dimension 1 | agrees | none |
| sampled: proalgebraic units | `E = F`; Artin–Schreier | `V = 1`; `π₀(V) ≅ H/[H,H] = C_p` (serre1961 line 638) | agrees | R04 (locator) |
| sampled: graded norms | tame cyclic of degree `e`; Artin–Schreier (jump `1`) | `N_0`: `u ↦ u^e`, kernel `μ_e`; `ψ(s) = es ≥ 1 ⇒ H_(ψ(s)) = 1`; `π₀(V_1) = H_1 = C_p`, `ψ(2) = p+1`, `H_(p+1) = 1`; `N_0` kernel `μ_p = 1` in char `p` | agrees | none |
| sampled: first map of the `V_s` sequence | `a ∈ U_E^(ψ(s)+1)` | `N(a) ∈ U_F^(s+1) = N(U_E^(ψ(s+1)))` (Prop. 6(a)), so `a·w⁻¹ ∈ V_s` for some `w` | agrees | none |
| §3a.3 proof via `G_0` | `G` vs `G_0 = Gal(L/K_0)` | same `G_i` for `i ≥ 0` and same `#G_t/#G_0`, so the same `φ` on `[0, ∞)`; `G_0` is abelian when `G` is | agrees | none |
| sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]` (RG2.0.4 `padic_witt`); every Laurent series over `F̄_q` is a limit of truncations in some `F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| §4a.1 Check | `ℚ_2(ζ_8)`, `u ≤ 1`, `(1,2]`, `> 2` | `ψ(u)` in `[0,1]`, `(1,3]`, `(3,∞)`: `G`, `{1,5}`, `1` | agrees | none |
| §4a.1 tame Check | `Frac W(F̄_p)(ζ_p)` | `I_K ↠ G = G_0` (order `p−1`); `P_K ↦ G_1 = 1` | agrees | none |
| §4a.2 integral formula | `G = Gal(M/K)`, `H = Gal(M/L)` | derivative `[G^0:G^t]·#(H∩G^t)/#H^0 = (#G^0/#H^0)·#H/#(G^tH) = [G:G^tH]/f` | agrees | none |
| §4a.2 Checks | unramified; tame degree `e`; `ℚ_3(ζ_9)/ℚ_3(ζ_3)` | `ψ = u`; `ψ = eu`; `ψ_(M/K)(3/2) = 5`, `G_5 = 1`; `H^(3/2) = H_2 = C_3`; `H^3 = H_3 = 1` | agree | none |
| §4a.3 Check | `ℚ_3(ζ_9)` | `d = 5+2+2 = 9`, `d/e = 3/2`, upper jumps `φ(0) = 0`, `φ(2) = 1` | agrees | none |
| §4a.3 unramified Check | finite unramified `L/K` | `L ⊗ K′ ≅ K′^[L:K]`, `L′ = K′`, `G_0 = 1`, `d = 0` | agrees | none |
| `K^ur` convention (line 106) | perfect `k` | `e = 1` ⇔ unramified, since the residue extension is separable | agrees | none |
| Herbrand-function properties (§3a.2) | `G_t = G_(⌈t⌉)` | `φ(m) = Σ_(k=1..m) #G_k/#G_0`; identity on `[−1, 0]` because `⌈t⌉ = 0` on `(−1, 0]`; Lagrange gives `ψ(n) ∈ ℕ` (serre1961 line 925) | agrees | none |

**Signatures and padding.** All four declarations elaborate with only `sorry` warnings. `#check @` of both theorems in a scratch copy reproduces the worker's `signatures.md` exactly. Every binder is in each theorem's own signature, so no section variable can be dropped, and nothing changed. A one-tactic probe (`simp`, `rfl`, `exact?`, `aesop`) on scratch copies leaves both goals open, so neither theorem is padding.

**Headlines.**
- Stated: Hilbert's different formula (§3a.1) and Hasse–Arf in lower-numbering form (§3a.3).
- Statable but absent: Herbrand's quotient theorem and tower transitivity (§3a.2); see R01.
- Correctly named as not statable: the absolute upper filtration with inertia and wild inertia, the open-subgroup identity, and completed unramified base change (§§4a.1–4a.3).

**Library declarations opened at the pins.** 57 `#check @` lines (42 of them Tau Ceti) resolve, covering every library name the README backticks. Opened by hand:
- `TauCeti/RingTheory/LocalRing/RamificationGroup.lean`: `ramificationGroup` at 118 (`Ideal.inertia` of `𝔪^((i+1).toNat)`); `exists_forall_ramificationGroup_eq_bot` at 325; `lowerIndex` at 351 (infimum over all of `S`); 444; 469; 520; 561; `ramificationGroupReal` at 722 (`G_⌈u⌉`).
- `TauCeti/RingTheory/DiscreteValuationRing/Monogenic.lean:70`.
- `TauCeti/NumberTheory/LocalField/Herbrand/HasseArf/Abelian.lean:50` (`hasseArf`, under `IsAbelianGalois`; `Herbrand/` contains no `sorry`).
- `Herbrand/Basic.lean:251`.
- `Unramified/Inertia/Basic.lean:112`.
- `Unramified/Maximal.lean:298`.
- `UnitFiltration/RamificationGroup.lean:481,566` (the graded maps exist for local fields only, so §3a.1 owns them on the general carrier).
- Mathlib: `RingTheory/Invariant/Basic.lean:62–84`; `differentIdeal` (`[IsDedekindDomain B] [Module.IsTorsionFree A B]`); `conductor_mul_differentIdeal`; `IsKrasner.of_completeSpace_of_normal`.

**Cross-roadmap citations resolved** (main 5556a3f; `roadmaps resolve` reports nothing unresolved):
- ReductiveGroupsPartII §RG2.0.4 (line 852: `Breve E` as the completion of `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, `breveIsDiscrete`, `residueField_isAlgClosed`, `isUniformizer_algebraMap`);
- ReductiveGroups Layer 3 (line 234);
- SchemeAndStackFoundations §0.24 (line 1565);
- AdicSpacesPartII §R0.19.9 (line 7793);
- ClassFieldTheory and LocalGaloisGroups on main;
- the Dependency-order links to ProfiniteCohomology, ProfiniteProPGroups and LocalFieldsRamification.

**Ownership and overlaps.**
- Defined only by an open revision: the LocalFieldsRamification group labels (R02).
- Owned elsewhere and deferred here: the LocalFieldsRamification revision (#617, line 36) assigns Hasse–Arf over complete discretely valued fields to this roadmap's §3a.3.
- Consumers that do not rebuild: FilteredLocalGaloisGroups (#1795) consumes §§4a.1–4a.2. PadicPeriodRings (#940), ArithmeticGaloisRepresentations (#856) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume §§3a–4a.
- LocalFieldsRamificationPartII (a board package, merge-order line 382, later) builds `Kᵘ` and inertia for general valued fields (its §2.3). That is a later generalization whose comparison belongs to it; nothing changes here.
- No open pull request changes this roadmap, and none drops an id it cites.

**Sources (seeded sample).**
- serre1961 (printed page = text page + 103):
  - n° 3.1, Propositions 1–2 (pp. 126–127), formula (5) and properties a–d′ (p. 127), Propositions 3–4, the Remarque, and the limit paragraph after Proposition 3 (p. 128), for totally ramified extensions of any complete discretely valued field (lines 860–863);
  - n° 3.4, Propositions 6–7 and Corollaries 1–3 (pp. 132–135);
  - n° 3.5, Proposition 8(i)–(iii) and Corollary 1 (pp. 135–136);
  - §1, n° 1.1–1.6 (pp. 106–113) and §2, n° 2.1–2.3 with Propositions 2–3 and corollaries (pp. 118–120).

  Every statement of the "Graded norms" and "Proalgebraic units" targets matches, except R04.
- ega3: Chapitre 0, (10.3.1) (printed p. 20; flat local `B` with `B/𝔪_A B ≅ K`), and (10.3.1.5) with the completion remark (p. 23).
- brinon-conrad: Exercise 1.4.4(2)–(3) (p. 10; a "p-adic field" is characteristic 0 with perfect residue field, Definition 1.3.1), and the proof of Lemma 13.1.6 (p. 201).

The "perfect-residue Herbrand package" summary lists a subset of these sources. Its sections carry the full locators.

## Not verifiable

- Serre, *Local Fields* (manifest: uncertified, paywalled): II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Proposition 14 and Exercise 3 (quaternion example); V §7 Theorem 1. None was read.
- Serre, *Groupes proalgébriques* (1960): not in the manifest. It was not fetched because this review edits no manifest. The paragraph numbers in R04 are as serre1961 cites them.
- serre1961 line 1197: read in the Numdam text layer; the scan image was not compared (no OCR on this host).

## Source issues

- **Misprint** in serre1961 at n° 3.5, proof of Proposition 8(i), printed p. 135: the source says the divisibility bound on `π₀(V_L)` comes from Corollary 2 of Proposition 3; it should be Corollary 2 of Proposition 7 (n° 3.4, p. 134); affects nothing.
