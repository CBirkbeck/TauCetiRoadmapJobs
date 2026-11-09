# Review of SchemeAndStackFoundations (pull request #1276 at dc479b5)

**Verdict:** needs changes

This is a full review of the folder at dc479b5, the head r54 also read. Two P2 findings are new:

- §0.12–§0.14 plan, and `Suggested.lean` restates, a henselization-of-pairs package that Tau Ceti already has at `2fd255d9`. That is the pin the README's own contract names.
- §4.1's gloss on thickenings is an equivalence that the roadmap's own §0.23 Check refutes.

Six P3 findings follow:

- r54's two findings, not repaired (the pin wording and the pull-request description).
- Padding in `Suggested.lean`.
- A Layer 0 → Layer 4 dependency that contradicts Layer 0's dependency line.
- Wrong locators in the seeded sample, including the locator of the §3.6 headline.

## R01 (P2) — §0.12–§0.14 restate Tau Ceti's henselization package at the pin the README names

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:974–1093` (§§0.12–0.14), `:17`, `:255` "Owned here for others. Henselization of pairs (§0.12, `Henselization.algebra`)", and `:396` "**From Tau Ceti** (`2fd255d9`, the pin in `lake-manifest.json`)". `Suggested.lean:138–190` (`Henselization.reducedMap` … `fixed_of_henselian`).

**Claim.** This roadmap owns the henselization of a pair and its universal property, and plans ind-étale algebras and henselian-pair permanence. They are among its Layer 0 end theorems.

**Witness.** Tau Ceti `2fd255d9` (main's `.lake`) has all of the following:

- In `TauCeti/RingTheory/Henselization/`: `Neighbourhood.lean:44,55` (`reducedMap`, `IsNeighbourhood`), `Filtered.lean:66` (`neighbourhood_isFiltered`), `SmallModel.lean:35`, `Algebra.lean:37–47` (`diagram`, `algebra`, `extended`), `Henselian.lean:154` (`instance henselian`), `Lift.lean:130` (`existsUnique_lift`), `Lift.lean:155` (`bijective_algebraMap_of_henselianRing`), `IndEtale.lean:47`.
- `TauCeti/RingTheory/Etale/IndEtale.lean:68`: `class Algebra.IndEtale`.
- `TauCeti/RingTheory/Henselian/{Quotient:96, Product:39, DirectLimit:50, Radical:34}`: §0.14's quotient, product, filtered-colimit and radical permanence.

Main's ModularCurves already cites `TauCeti.Henselization.algebra` (`ModularCurves/README.md:566`, `Suggested.lean:367`). None of these files exist at `358314d4`, the pin this branch still has (R03).

**Repair.**

- Under "Already stated or built elsewhere" and the Tau Ceti contract, cite the declarations above with their files.
- Delete the `Henselization` strand (`Suggested.lean:138–190`) and remove "henselization of a pair" from the end theorems (`:17`) and from "Owned here for others" (`:255`).
- Reduce §§0.12–0.14 to what `2fd255d9` lacks, for example `henselization_recognition`, `henselization_at_prime`, `henselization_padic`, Elkik and the finite-étale equivalence. State each of those as a target on Tau Ceti's carriers.
- Do this together with R03's merge, which moves the build to `2fd255d9`.

**Tested on the refuting instance.** After the repair, `Henselization.algebra I`, `henselian`, `existsUnique_lift` and `fixed_of_henselian` have exactly one owner, `TauCeti.Henselization` at `2fd255d9`, and ModularCurves' citation agrees with this roadmap.

## R02 (P2) — §4.1: "a thickening is equivalently a locally nilpotent ideal" fails off the locally Noetherian case

**Location.** `README.md:5020–5021`: "a closed immersion surjective on points (equivalently, the ideal sheaf `i.ker` is locally nilpotent)".

**Claim.** A surjective closed immersion is the same thing as a closed immersion whose ideal sheaf is locally nilpotent.

**Witness.** The roadmap's own §0.23 Check (`README.md:1509–1512`) gives the counterexample:

- Take `A = k[x₁, x₂, …]/(x₁, x₂², x₃³, …)` and `I = (x₂, x₃, …)`.
- `Spec A` is one point, so `Spec k → Spec A` is a surjective closed immersion.
- `x_{m+1}^m` is a nonzero element of `I^m` for every `m`, so `I` is not nilpotent, even locally.

The source says only that every local section of the kernel is locally nilpotent (`stacks-project`, book.pdf, line 150903–150904).

**Repair.** Replace the parenthesis by: "(every local section of `i.ker` is locally nilpotent; when `X` is locally Noetherian, equivalently `i.ker` is locally nilpotent)". Add the `A` above as a negative-control Check in §4.1. The Lean `Formal.IsThickening` (`Suggested.lean:1015`, closed immersion and surjective) is already right.

**Tested on the refuting instance.** `A` is not Noetherian, so the Noetherian clause does not apply to it. Every element of `I` is nilpotent, so the corrected gloss holds for `A`.

## R03 (P3) — The contracts name pins `1b1ccf4b`/`2fd255d9`; `lake-manifest.json` at this head pins `f6090c70`/`358314d4`

Carried from r54 R01: not repaired. The head is unchanged.

**Location.** `README.md:355`, `:396`. **Witness.** `lake-manifest.json:8` reads `358314d4…` and `:18` reads `f6090c70…`. `origin/main` (`bebc607`) pins `2fd255d9…`/`1b1ccf4b…`. `git diff --stat a0ad405e origin/main -- TauCetiRoadmap/SchemeAndStackFoundations` is empty, so the merge is still conflict-free in this folder. **Repair.** Merge `origin/main` and rerun the push gate, as r54 specified. R01's repair comes due at the same merge. **Tested.** After the merge the manifest pins are the two hashes the README names.

## R04 (P3) — The pull-request description states no order with the four conflicting heads and describes content this head does not have

Partly carried from r54 R02: not repaired.

**Location.** The pull-request description.

**Witness.**

- `scratch/overlaps.md` (index 2026-11-09T05:47:49Z): #1656 (`README.md`, `Suggested.lean`), #1807 (`README.md`), #1808 (`README.md`, `Suggested.lean`) and #1854 (`README.md`) conflict with dc479b5.
- The description promises "New section 4.10A … from a compatible polarized adic system" and calls the change "README-only … changes no Lean declarations". This head has no §4.10A. `README.md:74–75` and `:5483` put polarized algebraization out of scope. `git diff --stat origin/main...HEAD` changes `Suggested.lean` by +160/−1292.

**Repair.** Rewrite the description so that it says what the branch does against main: the README rewrite and the `Suggested.lean` reduction. Add one line per conflicting pull request saying which side rebases. No file changes.

**Tested.** A description naming #1656, #1807, #1808 and #1854 with an order, and no §4.10A, matches the head.

## R05 (P3) — Padding in `Suggested.lean`

| Declaration | Line | Why it is padding |
|---|---|---|
| `NormalSchemes.IsNormalScheme.isReduced` | 396 | Closes with one library lemma: `exact isReduced_of_isReduced_stalk X` elaborated without error on a scratch copy (all other declarations unchanged) |
| `Nisnevich.zariskiTopology_le_nisnevichTopology`, `nisnevichTopology_le_etaleTopology` | 741, 744 | Mirror §2.12's Check "Zariski coverings are Nisnevich and Nisnevich coverings are étale" (`README.md:3696`) |
| `SchemeFrobenius.SchemeCharP`, `schemeCharP_spec_iff`, `schemeCharP_iff_structureMap`, `schemeCharP_of_hom` | 357–373 | A definition that no stated headline uses, with three API lemmas. §0.29's headline is declared not statable (`:20–23`). `schemeCharP_spec_iff` restates the definition on affines "including the zero ring", and `schemeCharP_iff_structureMap` encodes uniqueness as `∃! f, True` |
| `universalHomeomorphismEtaleEquivalence_id` | 294 | Identity boundary case; its hypothesis `hX` holds for every `X`. It mirrors the §0.23a Check "with identity base change the comparison is the unit comparison" (`README.md:1558–1559`) |
| `DeJong.node_local_structure_dvr_nonzero_of_generic_smooth` | 1268 | Degenerate case: it excludes `a = 0` (`K[u,v]/(uv)` is singular at the origin) |

**Repair.**

- Delete these declarations from `Suggested.lean`.
- In the README, set their names in italics: `:446`, `:1564`, `:1868`, `:1949`, `:3681`, `:3703`, `:6112`, `:6348`.
- Remove them from the *Lean:* lines. The statements stay as README targets.

**Tested.** The one-tactic probe (`first | rfl | (simp; done) | infer_instance | trivial`) refused all 73 sorried declarations. The targeted probe closed `isReduced` alone. `universalHomeomorphismEtaleEquivalence_comp` with `MorphismProperty.Over.pullbackComp` failed instance synthesis, so it stays.

## R06 (P3) — §0.30 needs §4.13, but Layer 0's dependency line says no later layer

**Location.** `README.md:1992` "*Needs:* §§0.7, 0.20, 4.13" and `:1954–1955`, where *IsNormalScheme.of_isRegular* is placed in §0.30. `:2029` says "No later layer of this roadmap."

**Witness.** §4.13 (`:5627–5680`) needs §§0.17, 0.20, 0.21, 4.11. The only edge from §0.30 into Layer 4 is the regular ⇒ normal instance, which relates §4.13's `IsRegular` to §0.30's predicate.

**Repair.** Move *IsNormalScheme.of_isRegular* to §4.13. Add §0.30 to §4.13's *Needs:*, drop 4.13 from §0.30's *Needs:*, and leave `:2029` true.

**Tested.** After the move, Layer 0 has no forward edge, and §4.13 → §0.30 points down.

## R07 (P3) — Locators in the seeded sample that do not contain their statements

All in `stacks-project` (book.pdf, version ed88ff78) unless stated.

- **§0.22 (`README.md:1465`).** `nonJapaneseDVR` cites Example 10.119.5 (00PB), which constructs the DVR (line 34084, p. 719) but says nothing about N-2. The non-Japanese statement is Example 10.162.17 (09E1), line 41960–41968, p. 887. **Repair:** add "Example 10.162.17 (09E1), p. 887".
- **§2.4 (`:3350`).** "Lemma 21.11.1 (0CJZ)": 0CJZ is Section 21.11 (line 92794); the lemma is tag 0CK0 (line 92799, p. 1946). **Repair:** "(0CK0)".
- **§1.5 (`:2155`).** `EtaleEquivRel` cites Definition 39.3.1 (022P), which defines equivalence relations only. Étale equivalence relations are Spaces, Definition 65.9.2 (02WS), line 252351, p. 5275. **Repair:** add it.
- **§3.2 (`:4645`).** *genus_one_curves* cites Lemma 0CDU (1) for "degree-`d` Picard torsors are torsors under the Jacobian". Lemma 53.17.2 (1) (line 212479–212482) gives a finite separable extension with a rational point and `Pic[n] ≅ (ℤ/n)²`. **Repair:** cite §3.6's `picardComponent_torsor` for the torsor clause, and keep 0CDU (1) only for acquiring a point.

## R08 (P3) — §3.6: the Milne locator of the Picard-torsor headline does not contain the torsor statements

**Location.** `README.md:4863–4867` (`picardComponent_torsor`, `_canonical_point`, `_point_iff`, `jacobian_dim`), "Milne 2008, Part III, Theorem 1.6, Remarks 1.4 (a)–(b), 1.10–1.12, Propositions 1.13–1.14, pp. 88–91".

**Witness.** In Milne 2008 (AV.pdf v2.0), Chapter III §1 does not cover these statements:

- It never mentions `Pic^d` as a `Pic⁰`-torsor, the index, the canonical point of `Pic^{2g−2}`, or "a point iff trivial torsor". A search of the cached text, lines 3440–4300, finds only "period" (line 3652, Remark 1.11).
- `dim J = g` is Remark 1.4(e) (line 3501), not (a)–(b).
- Remark 1.4 is on p. 86 (header at line 3475), outside "pp. 88–91".

**Repair.**

- Cite Remark 1.4(e), p. 86, for `jacobian_dim`, and widen the range to pp. 86–91.
- For the torsor, index, canonical-point and point-iff statements, give a locator that states them. Over a separably closed field the structure is Stacks, Lemma 44.6.7 (0BA0), line 187165. The descent to `k` needs its own source; if none is at hand, list it under unverified locators.

**Tested.** Remark 1.4(e) is at line 3501, p. 86, and states the dimension.

## Previous findings (r54)

- R01: not repaired. The head is unchanged, and lines 355 and 396 still name `1b1ccf4b`/`2fd255d9`. Carried as R03.
- R02: not repaired. The description still names only "the separate relative-Proj proposal #1163". Carried as R04, with the stale-description point added.
- r54's remark that `instance IsNormalScheme.isDomain_stalk'` (`Suggested.lean:390`) has no docstring still holds. It is not a finding.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** The worker's gate at dc479b5 reports every counter 0 and `OK`.
- **Dependency check.** The requested `--depcheck` printed `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not in `ORDER.txt`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 after 2m25s, with 73 `declaration uses sorry` warnings and no other diagnostic.
- **Signatures.** A `#check @name` file for the 156 declarations (the worker's list without the spurious `on`) elaborated once with no error. I compared the elaborated types with the README for `existsUnique_lift`, `fixed_of_henselian`, the four `coheight` theorems, `ramificationIdxAt_comp`, `grothendieck_existence`, `algebraize_hom`, `alteration_theorem`, `semistable_alteration_theorem`, `genus_of_finite_etale` and `weil_bound`. Every standing binder is present, for example `[IsLocallyNoetherian Y]` in `coheight_apply_eq_one` and `[HenselianRing S J]` in `existsUnique_lift`. Nothing was changed.
- **Specialization order.** `Order.coheight` on schemes uses Mathlib's `specializationPreorder` (`Scheme.lean:156`, `a ≤ b ↔ b ⤳ a`). So `coheight x = dim 𝒪_{X,x}`, matching Convention 4.

### Seeded sample (15 targets): numbers, tags and pages, `stacks-project` book.pdf

- **§0.16.** 00NI, 02IH, 00NL, 00NJ, 0AUN (p. 685); 00NK, 0AUP, 00NM (p. 686); 02I6 (p. 144). The README definition matches 00NI.
- **§0.22.** 02JE (Section 110.19, pp. 7354–7355): "dim `A[x]_{m'}` = 3, maximal chain of length 2" matches line 351970–351975. 00PB is R07.
- **§0.30.** 033I, 033J, 033K (p. 2381); 00PD (p. 719, (5)⇒(3)); 0A21(10) (p. 2855); 0ECG (p. 2533); 00H8 (p. 519); 09E4 (p. 1526); 00NR (p. 687), which matches `exists_regularSystem_of_quotient` including `c ≤ d`.
- **§1.2.** 02W8 (p. 3346), 02WQ (p. 5274), 04SK (p. 6100), 0ADV (1)–(2) (p. 6101).
- **§1.5.** 022P, 02VG, 03C5, 045Y, 045Z, 02VH (pp. 3570–3609). The README's "false for a pre-relation" agrees with Stacks' warning before 045Y (line 171615).
- **§1.6.** 02WW, 0265, 0262, 0263 (pp. 5275–5279).
- **§1.20.** 036X/036Y/04ZM, 04SZ (p. 6747), 04XG–04Y8, 04YG/04YH, 04YW, 0513, 06FN, 0CL5, 04TK, 04T5, 06DC, 06FI, 0CLA, 0CLC, 0CLE, 0CQM (p. 7232: `h` of finite type with dense image, a valuation ring `A′ ⊂ K′` dominating `A`, so `h = id` works), 0CLJ, 0CLN, 0CL9.
- **§2.4.** 071J, 03AG (pp. 1932–1933); Mathlib `Sheaf.H.δ` (`ExactSequences.lean:60`), `δ_naturality` (`:66`), `longSequence_exact₃` (`:138`). 0CJZ is R07.
- **§2.14.** Morel–Voevodsky (`morel-voevodsky`, journal page = PDF page + 43): Prop 1.8 lines 1871ff (pp. 98–99), Prop 1.9 and Ex 1.10 (p. 99), Defs 1.12–1.13 and Prop 1.16 (p. 100), Lemmas 1.17–1.18 (p. 101).
- **§2.22.** Stacks tags as cited. The Grothendieck Brauer I/II texts are under Not verifiable.
- **§3.2.** 0C1C, 0C1D, 0C1F (pp. 4455–4456), 0AYZ, 0C6M, 0C6T, 0C6N, 0C6U, 0E3A–0E3D, 0H2V, 0B5E. 0CDU is R07.
- **§3.6.** Bhargava–Gross–Wang, Proposition 21 (arXiv 1310.7692v2, line 414, printed p. 10), states exactly the README's odd-degree clause. Milne is R08.
- **§4.1.** 04EX, 02H0, 02H8, 02HG, 02HH, 02H4, 0D0F, 02H6, 02HM, 02HE, 00TN, 04FG, 02H5, 04FH, 04FJ, 04FK, 02FQ, 0D0E, 06B5: every number matches its tag.
- **§4.12.** 052A (p. 2475), 051R/051S, 0815, 081R, 080K, 080L, 081S, 081T, 081M, 080B, 0200, 0201 ((1) projective π, (2) dense preimage), 0202.
- **§5.4.** Fulton citations; the computations are in the table below. Fulton is under Not verifiable.

### Library and cross-roadmap checks

- **Mathlib at the pin.** `Ideal.ramificationIdx q R` is a length (`RingTheory/RamificationInertia/Ramification.lean:52`), and `ramificationIdx_tower` needs `[Module.Flat S T]` (`:265`), as §0.30 says. `IsAzumaya` extends `Projective`, `FaithfulSMul` and `Finite` (`Algebra/Azumaya/Defs.lean:60`). Mathlib has no scheme-level `FormallySmooth`, `FormallyEtale`, normal-scheme, Japanese/Nagata, catenary, excellence, Nisnevich, algebraic-space or Chow-group carrier.
- **Tau Ceti at `358314d4`.** It has no henselization (R01 is at `2fd255d9`). It has no étale matrix splitting of Azumaya algebras, so `IsAzumaya.exists_etale_matrix_splitting` is not a duplicate.
- **Overlaps.** `roadmaps grep` finds `IsAzumaya.exists_etale_matrix_splitting` declared only in this roadmap and its revisions (#1656, #1807). Its consumers are IntegralHeckeAndGaloisDeterminants (`README.md:512, 1081`) and ClassicalArithmeticCompletion (`:250`). `scratch/overlaps.md` lists no dropped id and no id that only an open revision defines.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §0.16 catenary (00NI form) | `ℤ`; zero ring; `A[x]_{m'}` of 02JE | `0 ⊂ (p)`: every saturated chain has length 1, bound 1; no primes, vacuous; dimension 3 versus a maximal chain of length 2, so not catenary | Pass |
| §0.16 CM ⇒ universally catenary Check | Noetherian domain of dimension ≤ 1 | depth `R_m = 1 = dim R_m` (any nonzero element of `m`) | Pass |
| §0.22 `nonJapaneseDVR` | `A ⊂ k[[x]]`, `k = 𝔽_p(t₁, t₂, …)`, `f ∉ A` | `f^p = Σ a_i^p x^{ip} ∈ A`, so `L = K(f)` is purely inseparable of degree `p`; 09E1: `R′ ⊇ {h_n}` and finiteness forces `f ∈ A` | Pass (locator R07) |
| §0.30 `ramificationIdxAt`, `x ↦ x²` | `x = 0`; `x = 1`, `char ≠ 2`; `x = 1`, `char 2` | `len k[x]_(x)/(x²) = 2`; `x²−1 = (x−1)(x+1)` with `x+1` a unit gives 1; `(x−1)²` gives 2, excluded by the Check's hypothesis | Pass |
| §0.30 `coheight_apply_eq_one*` | Nagata `A ⊂ B` of 02JE | `B_{mB}` is a DVR (coheight 1) and maps to the closed point of `A` (coheight 2), so the statement fails without normality or finite type, as `:1965–1966` says | Pass |
| §0.30 `coheight_eq_one_of_coheight_apply_eq_one` | generic point of `X` | maps to the generic point of `Y`: coheight 0 ≠ 1, so the hypothesis excludes it; incomparability gives coheight `x ≤ 1` | Pass |
| §0.30 `ramificationIdxAt_comp` | `t ↦ t²` then `t ↦ t³` on `𝔸¹`, `char ∤ 6`, at 0 | `e = 6 = 2·3`; the DVR extensions are torsion-free, hence flat | Pass |
| §0.30 `exists_regularSystem_of_quotient` | `k[x,y]_{(x,y)}`, `I = (y − x²)`; `I = (y² − x³)` | `c = 1`, `y − x² ∉ 𝔪²`; the quotient is not regular, so the hypothesis excludes it | Pass |
| §1.2 `quasiFiniteDescent` | `S = Spec ℝ`, `{Spec ℂ → S}`, `F = h_{Spec ℂ}` | `F ×_S Spec ℂ = Spec ℂ ⊔ Spec ℂ`, separated and LQF; it descends to `Spec ℂ` | Pass |
| §1.5 `Δ ⊔ Γ` Check | `char ≠ 2`; `char = 2` | `Δ ∩ Γ = {x = −x, x ≠ 0} = ∅`, so mono; in `char 2`, `Γ = Δ∖0` overlaps `Δ`, not mono, and the hypothesis is needed | Pass |
| §1.5 `quotientSheaf.restrict` | `R = ∅`, `U′ = U ⊔ U`, `U = Spec k` | `U′/∅ = h_{U⊔U}` (2 points) against `U/∅ = h_U` (1 point) | Pass |
| §1.6 fold Check | `(U ⊔ U)/R`, `R` the kernel pair of the fold | `R = 4` copies of `U`; quotient `h_U` | Pass |
| §1.20 points of `BG`, `G = ℤ/2` | `Spec k ×_{BG} Spec k` | `|G| = 2` points against `|pt ×_{pt} pt| = 1`: surjective, not injective | Pass |
| §1.20 DVR-lift Check | `R = ℂ[[t]]`, torsor `K(√t)` | `v(t) = 1` is odd, so no lift; after `t = u²` the torsor is trivial | Pass |
| §2.4 boundary | Kummer `0 → μ₂ → 𝔾_m →² 𝔾_m → 0` on `Spec ℝ` | `H¹(ℝ, 𝔾_m) = 0`, so the only class has boundary 0 in `H²(μ₂) = ℤ/2` | Pass |
| §2.14 Brown–Gersten negative control | `F = Cone(A[0] → RΓ(a_Nis A))` | `F(∅) = A[1]`; `F(pt) = Cone(A → A) = 0`; `F(pt ⊔ pt) = Cone(A → A²) ≃ A[0]`; `a_Nis H^n F = 0` | Pass |
| §2.14 henselian fibres | `h_{Spec ℂ}` over `Spec ℝ` | fibre at `(Spec ℝ, pt)` `= Hom_ℝ(ℝ, ℂ) = ∅`; at `(Spec ℂ, pt)` `= {id, conj}` | Pass |
| §2.22 Azumaya Checks | `Mat₀(k)`; Lipschitz order at 2; `ℍ ⊔ D_{1/3}` | `0 → End 0` bijective, but faithfulness fails; in `𝔽₂`, `ij = −ji = ji`, so commutative; orders 2 and 3 give lcm 6 | Pass |
| §2.22 `isAzumaya_iff_positive_fibres_mulLeftRight` | `R = 0`; `k × k` with `k` via the first factor | vacuous / faithful; second fibre has rank 0, so not Azumaya on either side | Pass |
| §3.2 Riemann–Hurwitz | `z ↦ z²` on `ℙ¹`; étale double cover of genus 2 | `−2 = 2(−2) + 2`; `g − 1 = 2·1`, so `g = 3` | Pass |
| §3.2 `cohomologyDim_one_eq_zero_of_degree_gt` | `g = 1`, `L = O(P)`; `L = K` | `deg 1 > 0`: `h¹ = 0`, `h⁰ = 1 + 1 − 1 = 1`; `deg K = 2g − 2` excluded (`h¹(K) = 1`) | Pass |
| §3.6 conic Check | `x² + y² + z² = 0` over `ℝ` | `Pic = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br(ℝ)` | Pass (locator R08) |
| §4.1 thickening gloss | `A = k[x_i]/(x_i^i)`, `I = (x₂, x₃, …)` | surjective: yes; `I^m ∋ x_{m+1}^m ≠ 0` for every `m` | **R02** |
| §4.1 formally unramified Check | zero point of `𝔸¹_k` | lifts `0` and `ε`: 2 ≠ 1 | Pass |
| §4.12 `generic_flatness` | `⊔_p Spec 𝔽_p → Spec ℤ` | not quasi-compact; every dense open contains some `(p)`, so not flat; the `[QuasiCompact f]` binder is needed and present | Pass |
| §5.4 `td₂ = (c₁² + c₂)/12` | `ℙ²` | `c = (1+h)³`: `(9 + 3)/12 = 1 = χ(O_{ℙ²})` | Pass |
| §5.4 `c(T_{ℙ¹})` | `ℙ¹` | `c₁ = 2h`, `deg = 2 = 2χ(O)` | Pass |
| `Henselization.*` (headline) | `(ℤ, (5)) → (ℤ₅, (5))`; `I = ⊥`; `I = ⊤` | `f(I) = 5ℤ ⊆ 5ℤ₅`, one lift; colimit `≅ R`; the zero ring (unique map `0 → 0`) | Pass (R01) |
| `Groups.artinBootstrap` | `F = h_X`, `a = 𝟙` | pullbacks `h_T`, étale atlases flat and LFP, conclusion holds | Pass |
| `Formal.grothendieck_existence(_fullyFaithful)` | `A = k[[t]]`, `X = Spec A`, `F_n = A/t^{n+1}` | `M = O`; `g_n = a_n` compatible gives `a ∈ A` | Pass |
| `Formal.algebraize_hom` | `Y = 𝔸¹_A` | compatible `a_n ∈ A/t^{n+1}` correspond to `a ∈ A`, a unique `G` | Pass |
| `DeJong.alteration_theorem` | `ℙ¹`, `Z = ⊤` | `X₁ = X̄₁ = ℙ¹`, `B = ∏_∅ = ⊤`, support `∅ = ∅` | Pass |
| `DeJong.semistable_alteration_theorem` | `X = Spec R`, `Z` the closed point | one component `V(π)`; dimensions `1 = 0 + 1`; support equals the closed point | Pass |
| `weil_bound` | `ℙ¹/𝔽₂`; `y² = x³ − x` over `𝔽₃` | `|3 − 3| = 0 ≤ 0`; 4 points: `|4 − 4| = 0 ≤ 2√3` | Pass |
| `IsNormalScheme.isReduced` | one-tactic probe | closes with `exact isReduced_of_isReduced_stalk X` | **R05** |

### Headline theorems

From the Summary (`:16–23`):

- **Stated in `Suggested.lean`:** henselization with its universal property (`Henselization.*`, see R01), Artin's bootstrap (`Groups.artinBootstrap`), Grothendieck existence (`Formal.grothendieck_existence`, `_fullyFaithful`), algebraization (`Formal.algebraize_hom`), de Jong (`DeJong.alteration_theorem`, `semistable_alteration_theorem`) and the Weil bound (`weil_bound`).
- **Named as not statable in the module docstring, with the carrier each lacks:** Keel–Mori, coherent duality, the Brauer class, the Picard torsors, Schlessinger, GRR and Hodge index.

## Not verifiable

- **Grothendieck, Brauer I/II** (§2.22, the Azumaya docstrings). The Numdam texts (SB 1964–66, items 199 and 287) are in the cache, but this review edits no manifest. I did not check the page-level locators "Théorème 5.1, p. 210" and "Théorème 6.1, p. 214" against them.
- **Fulton 1998** (§5.4), **Hartshorne 1977** and **de Jong 1996** are settled as uncertified, or no legal text was available. I checked the de Jong statements mathematically only.
- **The 50-odd README sections outside the sample.** I read them only where a finding or a headline led there. Ownership against open pull requests was checked through `roadmaps overlaps` and `roadmaps grep` for the names above, not by reading every open README.
- **Elaboration at `1b1ccf4b`/`2fd255d9`.** This review may run Lean only in the worktree, which has the older pins.

## Source issues

- **Misprint** in stacks-project at Definition 37.2.1 (04EX)(4), p. 3179: the source says an nth order thickening has `X` a closed subscheme of `X`; it should be a closed subscheme of `X′`; affects nothing.
- **Misprint** in stacks-project at the paragraph after Definition 37.2.1 (04EX), p. 3179: the source says "nth order thinking"; it should be "nth order thickening"; affects nothing.
