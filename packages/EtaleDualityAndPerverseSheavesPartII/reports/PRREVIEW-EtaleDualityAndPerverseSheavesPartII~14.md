# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 36a358a)

**Verdict:** needs changes

This is an incremental re-review of the 18 lines that changed since ba18301. All of them are in `README.md`; `Suggested.lean` is unchanged.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is the previous review's R01, carried forward. No repair report marks it as not actionable. The repair is in PurityForFlatCohomology, whose head (96339c0e) has not moved since the last review.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements".
- `README.md:1642`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 have a single owner, this roadmap.

**Witness:** PurityForFlatCohomology (#1840 at 96339c0e) also claims them:
- `README.md:205–206` and `:3131–3132` name this roadmap as the importer of its §§1.4–1.5.
- §1.4 (`:1057`) states local étale duality on excellent regular local rings, and §1.5 (`:1110`) states local Lefschetz.
- `:1151` (the *Needs* of §1.6) cites §1.5.

**Repair** (in PurityForFlatCohomology; this folder needs no change):
- Delete §§1.4–1.5 and the importer bullets at `:205–206` and `:3131–3132`.
- Cite this roadmap's §§5.7, 6.11, 6.12 and 7.3 instead.
- At `:1151`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

The ownership should go this way because the theorems rest on this roadmap's Layers 0–6, and PurityForFlatCohomology's §1.4 *Needs* lists none of those layers.

**Test, rerun at 96339c0e:** I made the `:1151` edit on a scratch copy of the PurityForFlatCohomology README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #220 to #388, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. A `moved:` line is not a defect.
- Without `--movable`, it prints `UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#388) at README lines [1151]`.

## R02 (P3) — §5.9 (ii) uses Artin's fixed-field theorem without naming its pinned declaration

**Location:**
- `README.md:1062`: "the fixed field κ̃ of the subgroup that element generates has [κ̄ : κ̃] = ℓ by Artin's theorem on fixed fields of finite groups".
- The *Needs* at `:1070` lists only the Mathlib declarations `Field.absoluteGaloisGroup`, `IsFormallyReal`, `ringKrullDim` and `HenselianLocalRing`.

**Claim:** every input of the route is a target, a named supplier section or a named pinned declaration, and the *Needs* line lists them one by one.

**Witness:** the R03 repair added this step. Its input is Mathlib `FixedPoints.finrank_eq_card` (`Mathlib/FieldTheory/Fixed.lean:346`, namespace `FixedPoints` from `:339`): for a finite group acting faithfully on a field F, F has degree equal to the order of the group over the fixed subfield. Neither `:1062` nor `:1070` names it.

**Repair:**
- At `:1062`, after "by Artin's theorem on fixed fields of finite groups", add "(Mathlib `FixedPoints.finrank_eq_card`)".
- At `:1070`, add `FixedPoints.finrank_eq_card` to the Mathlib list.

**Test:**
- I applied both edits to a scratch copy and ran `roadmaps resolve` on it. It reports no new unresolved citation.
- The step's instances:
  - H = {1, complex conjugation} acts faithfully on ℂ with fixed field ℝ, and the degree is 2 = |H|.
  - For an involution of G_ℚ acting on ℚ̄, the fixed field is ℚ̄ ∩ ℝ, of index 2.

## Previous findings

- R01 — not repaired: `README.md:23` and `:1642` are unchanged. PurityForFlatCohomology at 96339c0e still states §1.4 (`:1057`) and §1.5 (`:1110`), names this roadmap their importer (`:205`, `:3131`), and cites §1.5 at `:1151`. Raised again as R01.
- R02 — repaired: `:23` now reads "Serre's theorem … is NoncommutativeAndEquivariantIwasawa §0.11". `:1062`, `:1068`, `:1070` and `:1096` cite §0.11, and there is a new contract `### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa` (`:142–144`).
- R03 — repaired: `:1062` now reads "a subfield κ̃ of an algebraically closed field C with 1 < [C : κ̃] < ∞ is real closed, and [C : κ̃] = 2". The new Check at `:1086` excludes the separable closure of 𝔽_p(t). The repair introduced R02.
- R04 — repaired: `:1068` now runs the Sylow reduction, the Kummer comparison with F(π^(1/ℓ)) and `TauCeti.IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp`. `:1070` and the Tau Ceti contract at `:70` name all three pinned declarations.

## Verified sound

**Gate, dependency check, build and signatures, run on this head:**
- The gate prints `set_option=0 blob=0 latex=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's `gate.md` also shows `build=0`.
- The required movable dependency check prints, in full: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists no paths.
- `lake env lean` on `Suggested.lean` exits 0 in 15 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 331.
- `Suggested.lean` is unchanged since ba18301 (`git diff` is empty). It has 11 declarations: 8 theorems and 3 structures.
- `README.md:156` still says "eight headline signatures", which matches the file.
- I did not rerun `#check`. `scratch/signatures.md` for this head shows `cohomologicalDimension_fractionRing_eq` with binders `IsDomain`, `HenselianLocalRing`, `IsGRing`, `ringKrullDim A = ↑d`, `Fact ℓ.Prime`, `IsUnit ↑ℓ` and `ℓ ≠ 2 ∨ ¬IsFormallyReal (ResidueField A)`. These are exactly those of the §5.9 statement (`:1050–1052`).
- The one-tactic padding probe of the previous report (all 8 theorems fail) still applies to this unchanged file.

**R02 repair: NoncommutativeAndEquivariantIwasawa, read with `roadmaps show --pr 1307` at e311e48:**
- §0.11 is at `README.md:483`. At `:493` it states the target cd_p_eq_of_isOpen_of_noPTorsion: for a profinite group G with no element of order p and an open subgroup U, cd_p G = cd_p U.
- The infinite case is covered: "If cd_p U = ∞ then cd_p G = ∞", and otherwise Serre's tensor-induction argument applies.
- `:56` fixes an arbitrary prime p, as the contract at `:144` says. `:505` is the API bullet, and `:517` is the negative control G = ℤ/p, U = 1.
- In the merge order, NoncommutativeAndEquivariantIwasawa is line 29 and this roadmap is line 388.
- The pull request's depends-on list and its merge-order paragraph both name #1307.
- The pinned finite case `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` (`CohomologicalDimension/OpenSubgroup.lean:111`) needs only cd_p G ≠ ⊤. So `:144` is right that §0.11 matters only when the dimension is infinite.

**R04 repair: the pinned Tau Ceti declarations opened:**
- `Topology/Algebra/Group/Profinite/Sylow/Basic.lean:62` defines `IsProPSylow`: closed, pro-p, with p-prime index in every quotient by an open normal subgroup.
- `Sylow/Existence.lean:102` is `exists_isProPSylow`. It needs a compact, totally disconnected topological group.
- `Sylow/CohomologicalDimension.lean:95` is `IsProPSylow.cohomologicalDimensionAt_eq`, with variables at `:57–58` (compact, totally disconnected).
- `ProP/CohomologicalDimension.lean:133` is `IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp`, with variables at `:98–104` (compact, `IsProP`). `cohomFp` is continuous cohomology with trivial `ZMod p` coefficients (`ContCohomology/TrivialFp.lean:34`, coefficient object `trivialFp` at `:73`).
- `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:374,380` give the compact and totally separated instances on `Field.absoluteGaloisGroup`.
- `CohomologicalDimension/ClosedSubgroup.lean:80` is `cohomologicalDimensionAt_le_of_isClosed`.
- The dropped `cohomologicalDimensionAt_eq_of_isClosed_of_forall_not_dvd_index` and the `IndexNotDvd` module are no longer mentioned anywhere in the README.

**R04 repair: the route against SGA4 X 2.2(i) (SGA4 lines 1277–1322, pp. 47–49), step by step:**
- Sylow reduction with normalization in the corresponding extension (SGA4 lines 1281–1283).
- The pro-ℓ criterion CG I Prop. 20 (SGA4 line 1284).
- The Kummer computation H¹(I, μ_ℓ) = ℤ/ℓ (SGA4 lines 1286–1290).
- The two-row Hochschild–Serre spectral sequence with bijective d₂ for large n (SGA4 lines 1291–1296).
- The base change to R[x′], x′^ℓ = x, which kills the class (SGA4 lines 1297–1322).
- The README's deduction "d₂ = id ∘ d₂ = d₂′ ∘ 0" needs only the F side to be finite, which is slightly weaker than the source's "all maps are isomorphisms".

**R03 repair: SGA4 lines 1234–1235 (p. 45):**
- The source recalls the theorem for an algebraically closed field and cites [7]. That is Artin–Schreier, *Eine Kennzeichnung der reell abgeschlossenen Körper* (1927; SGA4 line 1653).
- The README's derivation of the torsion statement is correct: Mathlib's `Field.absoluteGaloisGroup` is defined through `AlgebraicClosure`, then Artin's theorem gives index ℓ, then Artin–Schreier, then κ ⊆ κ̃ formally real.
- Remark, no change requested: the recall at SGA4 line 1235 says only that κ̃ is orderable. "Real closed" is the content of its reference [7]. The route needs only that κ̃ is formally real, and real closed implies this: Mathlib's `IsRealClosed` extends `IsSemireal` (`FieldTheory/IsRealClosed/Basic.lean:52`).

**Duplication by object (searched with `roadmaps grep` over main and the open heads, and grepped in the pins):**
- The Artin–Schreier theorem on finite-index subfields of algebraically closed fields, and torsion in absolute Galois groups:
  - No roadmap owns it. The only hit, FiniteFlatGroupsAndIntegralPadicHodgeTheory `:499`, is about Artin–Schreier group schemes.
  - In Mathlib it is a TODO (`FieldTheory/IsRealClosed/Basic.lean:29`).
  - Tau Ceti's `FieldTheory/RealClosure/FiniteExtension.lean:40,53` and `Galois.lean:53,67` prove only the converse direction (finite extensions of a real closed field).
  - So §5.9 is the owner.
- Serre's open-subgroup theorem: only NoncommutativeAndEquivariantIwasawa §0.11, now cited.
- `scratch/overlaps.md` lists no other pull request changing this roadmap, no id cited here that an open pull request drops, and no id cited here that only an open revision defines.

**Seeded sample:**
- None of the 15 seeded targets lies in the changed passages. The Layer 5 Dependencies line (`:1096`) changed only in its §5.9 clause.
- The seeded targets were verified at their locators in earlier rounds.
- The README flags no locator as unverified.
- The declared gaps are unchanged. gap:henselian-quasi-excellent-catenary is still the only gap §5.9 consumes.

**Remark on untouched text:** the `scratch/citations.md` leads at `:21` (PerfectoidQuotientsPartII, merge order line 219) and at `:25` and `:120` (EtaleCohomologyFoundations Lean names) are on unchanged lines that earlier reviews passed.

**Adversarial table.** Rows marked "prev. r13" are carried from the previous report: the statements they test are untouched. All other rows test changed text.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §5.9 Artin–Schreier, new wording (`:1062`) | ℂ ⊃ ℝ; ℚ̄ ⊃ ℚ̄∩ℝ; 𝔽̄_p; C = 𝔽_p(t)^sep ⊃ C^p | [ℂ:ℝ] = 2, ℝ real closed; index 2, real closed; 𝔽̄_p = 𝔽̄_p^p, no proper subfield of finite index; t^(1/p) ∉ C, so C is not algebraically closed and is excluded | holds; the "algebraically closed" hypothesis is needed |
| §5.9 torsion consequence (`:1062`) | G_ℝ, G_ℚ, G_𝔽_p, G_ℚ(i), G_ℚ₃ | ℤ/2 and ℝ orderable; conjugation has order 2 and ℚ ⊂ ℝ; Ẑ torsion-free and −1 = (p−1)·1²; −1 = i², torsion-free; −1 = 1² + u² with u² = −2 (Hensel), torsion-free | holds |
| Artin's fixed-field step (`:1062`, R02) | ⟨conjugation⟩ on ℂ; an involution of G_ℚ on ℚ̄ | \|H\| = 2 = [ℂ:ℝ]; [ℚ̄ : ℚ̄∩ℝ] = 2 | holds; input not named |
| (ii) via NCEI §0.11 (`:1068`, `:144`) | κ = ℂ(t₁, t₂, …), κ′ = κ(t₁^(1/ℓ)); NCEI negative control G = ℤ/ℓ, U = 1 | cd_ℓ κ = ∞ (symbols {t₁,…,t_n} ≠ 0), no ℓ-torsion since i ∈ κ, so cd_ℓ κ′ = ∞ and the pinned `_ne_top` lemma does not apply; 0 vs ∞ | §0.11 is needed and correctly hypothesised |
| (i), infinite case (`:1068`) | ℝ((t)), ℓ = 2; ℂ(t₁, t₂, …)((π)) | Sylow P = ℤ/2, H¹(I, μ₂) = ⟨t⟩ = ℤ/2, F′ = ℝ((t^(1/2))), H^(n−1)(ℤ/2, ℤ/2) = ℤ/2 ≠ 0 for all n, so cd₂ F = ∞ = ∞ + 1; ∞ = ∞ + 1 | holds |
| (i), d₂ argument where cd_ℓ κ is finite | 𝔽_q((t)), ℓ ∤ q | Sylow ℤ_ℓ; H^(n−1)(ℤ_ℓ, ℤ/ℓ) = 0 for n ≥ 3, so no contradiction; cd = 2 = 1 + 1 | consistent |
| Normalization step (`:1068`) | V = ℤ_p, G_κ = Ẑ, P = ℤ_ℓ | residue field ⋃_(ℓ∤m) 𝔽_(p^m), unramified with value group ℤ, so again a henselian DVR; cd_ℓ = cd_ℓ ℤ_ℓ = 1 = cd_ℓ 𝔽_p | holds |
| `IsProP.…_subsingleton_cohomFp` (`:70`) | ℤ_ℓ, n = 1; ℤ/ℓ; S₃ at ℓ = 3, n = 0 (not pro-3) | H² = 0, so cd ≤ 1; H^(n+1) = 𝔽_ℓ ≠ 0, so cd = ∞; H¹(S₃, 𝔽₃) = 0 but cd₃ S₃ = ∞ | pro-ℓ hypothesis, hence the Sylow reduction, needed |
| `IsProPSylow.cohomologicalDimensionAt_eq` (`:70`) | S₃ at ℓ = 3 and 2; Ẑ | A₃: ∞ = ∞; ⟨(12)⟩: ∞ = ∞; ℤ_ℓ: 1 = 1 | holds |
| New Check, Artin–Schreier control (`:1086`) | C = 𝔽_p(t)^sep | [C : C^p] = [𝔽_p(t) : 𝔽_p(t^p)] = p; C^p ≅ C by Frobenius; characteristic p, so not real closed | true; separates the algebraically closed form from the separably closed misstatement |
| `cohomologicalDimension_fractionRing_eq` / §5.9 (prev. r13) | ℤ_p, ℓ ≠ p; ℤ₃, ℓ = 2; d = 0 | 2 = 1 + 1; 2 = 1 + 1; c = 0 + c | holds |
| same, negative controls (prev. r13) | (ℝ[x,y]/(x²+y²))^h at ℓ = 2, 3; ℝ⟦t⟧, ℓ = 2 | 1 vs ⊤, excluded; 1 = 1 + 0; ∞ = 1 + ∞, excluded though true | hypothesis needed, not necessary |
| same, hypotheses used (prev. r13) | ℤ_(p), ℓ = 2; 𝔽_p⟦t⟧, ℓ = p | cd₂ ℚ = ∞ ≠ 2; ≤ 1 vs 2 | henselian and `IsUnit ℓ` needed |
| §5.9 lower-bound induction (prev. r13) | 𝔽_q⟦x,y⟧, 𝔮 = (x) | 2 ≥ 1 + 1; 3 = 2 + 1 | holds |
| §5.9 Hensel step (prev. r13) | ℤ₃, ℓ = 2 | −2 = u², −1 = (1/u)² + (1/u)² | holds |
| §5.9 (i), (ii) values (prev. r13) | ℂ((t)); 𝔽_q((t)); 𝔽_{q²}/𝔽_q; ℂ/ℝ at ℓ = 3, 2 | 1; 2; 1 = 1; 0 = 0; 0 < ∞, excluded | holds |
| §5.7 henselian bound (prev. r13) | Spec ℤ_p, U = Spec ℚ_p; ℝ⟦t⟧ | 2 ≤ 1 + 1; ∞ ≤ 1 + ∞ | holds |
| §6.11 with ℤ/n (prev. r13) | n = 6, 4, d = 1; d = 0 | ℤ/2 × ℤ/3; ℤ/4; K = Λ | holds |
| Codimension convention and §5.1 Check (prev. r13) | 𝔸²_k, V(y) ⇝ origin | 1 vs 2; identity 0 vs 2 | holds |
| §§2.2–2.3 routes (prev. r13) | #1796 §§PA.4.1/4.3/4.4; sign action on 𝔸² | correct sections; uw − v², ℤ/2 | holds |
| §0.1 alt/S (prev. r13) | Spec k; 𝔸¹_k | dim 0; [k(t):k] = ∞ | holds |
| §0.2 alt_ℓ′ (prev. r13) | ℤ[i]/ℤ at ℓ = 3, 2 | 2 ∈ 3′; 2 ∉ 2′ | holds |
| §0.4 (prev. r13) | 𝔽_p(t), ℓ = p | k^sep lacks t^(1/p) | holds |
| §0.5 (prev. r13) | k⟦t⟧ vs k, a = 1 | gr¹: k vs 0 | not 1-isomorphic |
| §0.7 (prev. r13) | T complete; T henselian | III 6.2 via excellent T_(t) | holds |
| §0.8 (prev. r13) | Spec ∏ 𝔽₂; Bl₀ 𝔸²_ℂ | no finite subfamily; diagonal misses (e, e′) | holds |
| `cohenGabber_equivariant` (prev. r13) | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; char 2 | 2; 6; \|G\| = 0, excluded | holds |
| §2.1 (prev. r13) | ℙ¹_L, [L:K] = 2 | L ⊂ L(t) algebraic over K | geometric irreducibility needed |
| §2.3 Check (prev. r13) | x³ + x² + 2x + t over 𝔽₃[t]_(t), ℓ = 2 | 𝔽₃ × 𝔽₉; degree 3 | not alt_2′ |
| §2.4 (prev. r13) | Spec k, Z = ∅; Bl₀ 𝔸²_ℂ | the whole point; Rj_*Λ = 0 on E × E | holds |
| §3.4 (prev. r13) | π = id; torsion F | equivalence; D⁺(T, ℤ/n) | holds |
| §4.1 (prev. r13) | ILO XIX 2.2 | stalk dimensions 2 and 1 | QE needed |
| §5.4 (prev. r13) | 𝔸¹_k → Spec k | 1, 0; 0, −1 | holds |
| §6.6 (prev. r13) | trait, n = 5 | 4 automorphisms; pinned 1 | holds |
| §6.10 (prev. r13) | ℤ/6, 𝔽₂ ⊕ 𝔽₃[1] | −2, 0; −3, −1 | holds |
| §7.1 (prev. r13) | d = 1; f = 0 | H^i(η) = 0, i > 1; empty open | holds |
| §7.3 (prev. r13; R01) | k⟦x,y⟧, f = x, i = 0, 1, 2 | 0 → 0; 0 → 0; 0 → ℤ/ℓ(−1) | range sharp |
| `cohenGabber_equalCharacteristic` (prev. r13) | d = 0; cusp at p = 2, 3 | κ⟦⟧ = κ; degrees 3, 2 | holds |
| `cohenGabber_mixedCharacteristic` (prev. r13) | W[π]/(π^ℓ − p)⟦x⟧, μ_ℓ | ℓ; invariant degree 1 | holds |
| `partialAlgebraization_equalCharacteristic` (prev. r13) | k⟦x,y⟧/(xy) | B = k, 0 = 1 − 1 | holds |
| `partialAlgebraization_mixedCharacteristic` (prev. r13) | p = 3, ℓ = 2 | A′ = W⟦x⟧, dim 2 | holds |
| `affineLefschetz_strictlyLocal` (prev. r13) | n = 0, 1; punctured k⟦x,y⟧ | IsUnit 0 false; H³ = ℤ/ℓ(−2) | each hypothesis used |
| `cohomologicalDimension_le_of_strictlyLocal` (prev. r13) | k⟦t⟧, d = 1; d = 0 | H¹(η) ≠ 0; excluded | sharp |

## Not verifiable

- **Ser65** is settled as uncertified and I did not read it. I checked its statement through SGA4 line 1233 and NoncommutativeAndEquivariantIwasawa §0.11 (`:493`).
- **Artin–Schreier (1927)** is SGA4's reference [7]. It is not in the manifest and I did not read it. The README cites the theorem through SGA4 lines 1234–1235, which recall it in the weaker "orderable" form; that form is enough for the route.
- **No local checkout of NoncommutativeAndEquivariantIwasawa (#1307).** I read it with `roadmaps show --pr 1307`; its README line numbers are the `roadmaps show` line minus the one-line header. I read PurityForFlatCohomology (#1840) in its checkout at 96339c0e.

## Source issues

- **Misprint** in SGA4 at Exposé X, proof of Théorème 2.1, case a), p. 45: the source says an algebraically closed field has no subfield of finite index unless ℓ = 2 and the subfield is orderable; it should say no proper subfield of index ℓ, since the field itself has finite index 1; affects nothing.
- **Misprint** in SGA4 at Exposé X, proof of Théorème 2.2(i), p. 49 (retyped edition, line 1321): the source says H¹(H, μ_ℓ) is ℤ/r; it should be ℤ/ℓ, as computed in (2.2.2); affects nothing.
