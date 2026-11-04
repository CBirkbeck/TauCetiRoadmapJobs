# GATE-LocalFieldsRamification~2: answers to the review of `9fe00eb`

Commit `14889ced` ("LocalFieldsRamification: review repairs (consume Tau Ceti; state Sen congruence and
Hasse–Arf only)"). Files touched: `TauCetiRoadmap/LocalFieldsRamification/README.md` (1609 → 495 lines) and
`TauCetiRoadmap/LocalFieldsRamification/Suggested.lean` (2143 → 78 lines).

## H01 (CBirkbeck) — applied

The universal claim "the two orders differ as soon as one step is wild" (old README:933) is gone. The new
Conventions section says the order of composition is part of the tower statement and the two orders "can differ,
but they need not". It adds both witnesses as Checks: the positive control `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(ζ_8)`, where the
correct order gives `9/4` at `4` and the reversed order gives `2`, and the negative control `L/ℚ_2` unramified
quadratic with `M = L(√2)`, where both orders give `3`.

## H02 (CBirkbeck) — applied

At the brief's Tau Ceti pin `358314d`, every overlap the review lists exists. The README now lists each one under
*Scope and ownership → Already in the library* and under *Exact supplier contracts → From Tau Ceti*, giving the
exact name and file of every consumed declaration. The duplicate targets, aliases, wrappers and local carriers
are deleted: `wildInertia`, `maximalTame`, `IwasawaGroup` and `freeIwasawaCoordinate` are among them. This is
not a re-plan. Every milestone of the original roadmap is either proved at the pin and cited, or kept as a
target in Layers 0–2.

What remains is:
- Layer 0: the comparison of `U(ℚ_p, i)` with `p^i ∣ u − 1`, the unshifted norm inclusion and the dyadic
  `2^{N+2}` count.
- Layer 1: Sen's congruence.
- Layer 2: Hasse–Arf.

The characteristic-2 inseparable control and the marked order-21 tame quotient were not added as Checks. They
test Tau Ceti's `maximalTameExtension` and `tameQuotientEquiv`, which this roadmap no longer defines.

## H03 (CBirkbeck) — applied

`Suggested.lean` now states `pow_succ_dvd_lowerIndex_sub`. Its hypotheses are:
- a totally ramified Galois `L/K` with `ringChar 𝓀[K] = p` and `finrank = p ^ r`;
- `σ` with `Subgroup.zpowers σ = ⊤` and `j + 1 < r`;
- `lowerIndex 𝒪[L] (σ ^ p ^ j) = b₀ + 1` and `lowerIndex 𝒪[L] (σ ^ p ^ (j+1)) = b₁ + 1`.

Its conclusion is `(p : ℤ) ^ (j+1) ∣ b₁ − b₀`. The theorem uses only native carriers (`TauCeti.IsLocalRing.lowerIndex`,
`TauCeti.IsTotallyRamified`). README 1.2 states it, and 1.1 and 1.3 give the complete lower-break list and
upper-break integrality as README targets. The list is elementary group theory of a cyclic filtration, so it is
not a headline.

The source is `fesenko-vostokov` line 4166–4237 (III (4.3), Proposition, pp. 92–93). There, part (3) with
`k₁ = p^{j+1}`, `k₂ = p^j` gives exactly this divisibility. The README Checks are `ℚ_2(ζ_16 + ζ_16⁻¹)` (breaks
`2, 4`, upper breaks `2, 3`) and the excluded `C₄` filtration with breaks `2, 3`; `r = 1` is empty.

## H04 (CBirkbeck) — applied

`Suggested.lean` keeps only the two headlines `pow_succ_dvd_lowerIndex_sub` and `hasseArf`. The rest is deleted:
- every alias and closed wrapper, including `upperRamificationGroup_quotient` and `psiNat_eq_native`;
- `padicResidueFieldEquiv_residue`, `coe_psiNat` and the other definitional statements;
- the topology instances and every `example`;
- `Q3Sqrt3` with `q3Sqrt3_finrank_and_totallyRamified` and `norm_four_not_mem_unitFiltration_two`.

The values `v_3(16 − 1) = 1 < 2` and `ψ_{ℚ_3(√3)/ℚ_3}(2) = 4` are now README Checks (Conventions and 0.2).
`hasseArf` is restated on Tau Ceti's `UpperJump` with Mathlib's `IsAbelianGalois`. It no longer carries a local
`UpperJump` definition or a hand-written commutativity hypothesis.

## H05 (CBirkbeck) — applied differently

The README now has the standard shape: Summary, Scope and ownership, Conventions, Exact supplier contracts,
How to read the build, then Layers 0–2 with numbered `### k.n` subsections. Each layer has *Needs:* lines per
statement, an API in prose, at least three Checks per target, and Examples and Dependencies sections. After
H02, unit filtration, Herbrand functions, wild inertia and the Iwasawa group are Tau Ceti definitions, not this
roadmap's. So their computed controls are Checks on the conventions rather than per-definition Check lists:
- `U(ℚ_2,0)/U(ℚ_2,1)` of order 1, `5 ∈ U₂ ∖ U₃`, `2 ∉ U₀`;
- `φ(2) = 3/2`, `ψ(2) = 3` for `ℚ_2(ζ_8)`;
- the identity and unramified cases;
- `ζ_7 ↦ ζ_7^2` for arithmetic Frobenius.

The ordering "different/trace before the above-break norm" concerned a target that is now
`TauCeti.normGradedMap_after_break`, so it no longer needs stating.

## H06 (CBirkbeck) — applied differently

`ClassFieldTheory.tateH` and the other unresolved names (`eulerCharacteristic_finrank_fp`,
`normResidue_uniformizer`, `rank_absoluteGaloisGroup`, the LeanBridge names) went with the sections that cited
them. The README now cites other roadmaps only by name and layer (ClassFieldTheory Layers 5–8 and Layer 7,
checked on main). The relative links to `ProfiniteProPGroups`, `NumberFieldArithmetic` and `LocalGaloisGroups`
are gone, and those roadmaps are named in plain text. `roadmaps resolve` on the new README reports no
unresolved cross-roadmap citation or Lean name.

Locators are now precise where checked:
- Fesenko–Vostokov is cited with edition, section and printed pages, against `fesenko-vostokov` lines
  4131–4237, fetched through the sources service from the author-hosted copy.
- Serre and Neukirch are cited at section level only (Serre IV §§1–3, V §§6–7; Neukirch II §5), because their
  texts were not read. They are paywalled and should be recorded as `uncertified`.

`sources.toml` was not created: this job may edit only `README.md` and `Suggested.lean`. The worker should add
four entries:
- `fesenko-vostokov` (author-page, III (4.3), pp. 91–93);
- Serre *Local Fields* (`uncertified`);
- Neukirch (`uncertified`);
- Sen 1969 (`uncertified`).

The LeanBridge audit table was dropped with the targets it mapped. Every one of them is proved in Tau Ceti.

## H07 (CBirkbeck) — applied

The following are gone:
- "accepted roadmap", "Material extracted from the former … portfolio" and "this PR";
- the LeanBridge contact-status paragraph;
- the `Supplied.*` and alias narrative.

The module docstring now uses the required form ("target signatures"; the roadmap is README.md; the headlines
open at the pins; none is unstatable). A grep of both files finds no `#<digits>`, "PR", "now", "current",
"originally" or "removed".

## H08 (CBirkbeck) — answered

The "Verified sound" section checked Mathlib `6b7abb3` / Tau Ceti `a91d3aa`. Those are the pins in this branch's
own `lake-manifest.json`, and they are what `lake build` in the worktree uses. The content repository's pins,
which this job checks against, are Mathlib `f6090c7` / Tau Ceti `358314d`.

The new `Suggested.lean` imports only `Herbrand.Jump`, `RamificationGroup` and `RamificationIndex`, which exist
at both pins, and it builds at `a91d3aa`. Three README supplier names exist only at `358314d`:
- `TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField`;
- `TauCeti.LocalFieldsRamification.UpperJump.exists_eq_intCast_of_exponent_prime` (both in `Herbrand/CyclicReduction.lean`);
- `TauCeti.toTameQuotient_mul_tameInertiaHom_mul_inv` (`Tame/Quotient.lean:401`).

They are correct at the brief's pins. They will resolve in the build once the branch is rebased onto main's
manifest.

## Further consequences for the human reviewer

- Some consumers name declarations in the `TauCetiRoadmap.LocalFieldsRamification` namespace that this revision
  deletes because they were aliases:
  - MassFormula (README:144);
  - ClassFieldTheory (README:1103 `card_powerClasses_mixed`, :1202 `localLogarithm`);
  - LocalGaloisGroups (§ "From `TauCetiRoadmap.LocalFieldsRamification`").

  Each has a Tau Ceti counterpart in the new supplier contracts, such as `TauCeti.card_powerClasses` and
  `TauCeti.deepUnitExpLogEquiv`. Those READMEs are outside this job.
- Two open roadmaps cite this roadmap by old layer number, which no longer matches: ArithmeticGaloisRepresentations
  cites "§3a.3" (never a section here) and PadicPeriodRings cites "Layer 2/3". Hasse–Arf is now Layer 2 and Sen
  is Layer 1.
- One item was dropped with no replacement target: the comparison of `Gal(AlgebraicClosure K/K)` with
  `Gal(separableClosure K/K)` as topological groups. No remaining target needs it, and every Tau Ceti carrier
  uses `AlgebraicClosure`.

## Ownership

Searches with `roadmaps grep` over main, 397 open heads and the board found no other owner. "Hasse.Arf" hits only
consumers: ArithmeticGaloisRepresentations, AlgebraicCurves, FiniteFlatGroupsAndIntegralPadicHodgeTheory,
NeronModelsAndSemistableAbelianVarieties and PadicPeriodRings, and each cites this roadmap. "Sen's congruence"
hits only this roadmap. The board's LocalFieldsRamificationPartII design covers general valued fields, with no
Hasse–Arf or Sen target. This roadmap therefore stays the owner of both headlines. No declaration of
`Suggested.lean` reuses a fully qualified name from another roadmap. No notion was moved down from a later
roadmap, and no roadmap supplier is cited.

## Elaborated signatures (`#check` record)

All 147 backticked library names of the new README and the two theorems were checked with `#check @name`. They
were appended temporarily to `Suggested.lean` together with imports of every `TauCeti.NumberTheory.LocalField.*`
and `…/Profinite/*` module, elaborated in one build, and then reverted.

- At `a91d3aa`, the only failures were the three names listed in H08, plus the file name `Padic.lean`, which is
  a false positive.
- A grep of the `358314d` sources found all names.

Elaborated types:
- `pow_succ_dvd_lowerIndex_sub : ∀ K … L … [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L] (p r : ℕ), ringChar 𝓀[K] = p → IsTotallyRamified K L → finrank K L = p ^ r → ∀ σ, zpowers σ = ⊤ → ∀ j, j + 1 < r → ∀ b₀ b₁, lowerIndex 𝒪[L] (σ ^ p ^ j) = ↑(b₀+1) → lowerIndex 𝒪[L] (σ ^ p ^ (j+1)) = ↑(b₁+1) → ↑p ^ (j+1) ∣ ↑b₁ − ↑b₀`.
- `hasseArf : ∀ K … L … [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsAbelianGalois K L] (u : RamificationIndexDomain), UpperJump K L u → ∃ z : ℤ, ↑u = ↑z`.

Both match the README statements. Every binder is in the declaration's own signature (there are no section
`variable`s), so nothing was dropped.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Sen, `pow_succ_dvd_lowerIndex_sub` | `ℚ_2(ζ_16+ζ_16⁻¹)/ℚ_2`, `r=2`, `j=0` | lower breaks via quotient of `ℚ_2(ζ_16)` (upper `2,3`): `b₀=2`, `b₁=4`; `2 ∣ 2` | holds | none |
| Sen | degree-`p²` subfield of `ℚ_p(ζ_{p³})`, `p` odd | upper `1,2` → `b₀=1`, `b₁=1+p`; `p ∣ p` | holds | added as Check |
| Sen | `r = 0, 1` | `j+1<r` unsatisfiable | vacuous, matches source (no `b_r`) | Check |
| Sen | abstract `C₄`, breaks `2,3` | `2 ∤ 1` | excluded, as intended | Check |
| Sen | tame case (residue char `≠ p`) | `i(τ)=1` for all `τ≠1`, so `b₀=b₁=0`; true, but excluded by `hp` | hypothesis kept as in the source | none |
| Sen, hypothesis satisfiability | totally ramified ⇒ `σ^{p^j} ∈ G_0 ∖ {1}` ⇒ `1 ≤ i < ⊤` | `b₀, b₁ : ℕ` exist | non-vacuous | none |
| Sen, ℕ-subtraction junk | conclusion in `ℤ` | `b₁ − b₀ = 2` (not truncated) | ok | none |
| Hasse–Arf | degree 1 | no `u` with strict drop | vacuous, true | Check |
| Hasse–Arf | unramified quadratic | `G^v = G` for `v ≤ −1`, trivial for `v > −1`: single break `−1` | integer | Check |
| Hasse–Arf | `ℚ_2(ζ_8)` (`C₂×C₂`) | lower `1,3`; `φ(1)=1`, `φ(3)=1+2/2=2` | integers | Check |
| Hasse–Arf | `ℚ_2(ζ_16)` (`C₂×C₄`) | lower `1,3,7`; `φ = 1, 2, 2+4/4 = 3` | integers | Check |
| Hasse–Arf | `u ∈ (−1,0)` | `G^v = G_0` on `(−1,0]` | no break, as the route claims | route text |
| Hasse–Arf | quaternion (non-abelian) | Serre IV §3 Ex. 3: non-integral break | `IsAbelianGalois` needed | Check |
| 2.1 reduction | `ℚ_3(ζ_9)/ℚ_3` (`C₆`) | upper breaks `0, 1`; `E` = cubic subfield keeps `1`; `0` excluded | holds | Check |
| 2.1 reduction | `F₀`-invariance | `H_t = H ∩ G_t = G_t` for `t ≥ 0`, same `#G_0` denominator | upper filtrations agree on `[0,∞)` | route text |
| 0.1 `U(ℚ_p,i)` | `5` in `ℚ_2`; `−1` in `ℚ_3`; `i=0` | `v_2(4)=2`: in `U₂`, not `U₃`; `3 ∤ −2`; `1+ℤ_3=ℤ_3` not a group | holds | Checks |
| 0.2 unshifted norm | `ℚ_3(√3)`, `i=2` | `φ(2)=1`; `N(4)=16 ∈ U₁ ∖ U₂` | holds; unshifted `U₂` refuted | Checks |
| 0.2 | `ℚ_2(ζ_8)`, `i=2` | `⌊3/2⌋=1`; `ψ(1)=1 ≤ 2`; `⌈φ⌉=2` needs depth `ψ(2)=3 > 2` | floor is right | Check |
| 0.3 dyadic count | `ℚ_2`; `ℚ_2(√2)`; `ℚ_2(√5)`; `ℚ_3` | `8`; `4·2²=16`; `4·4¹=16`; `4` (hypothesis fails) | holds; `4·2^e` gives `16, 8` | Checks |
| Convention: valuation | `12 ∈ ℚ_2` | `v=2`, `‖12‖=1/4` | ok | Check |
| Convention: Herbrand | `ℚ_2(ζ_8)` | `φ(2)=3/2`, `ψ(2)=3`; wrong slope gives `φ(2)=3` | ok | Check |
| Convention: tower order | `ℚ_2⊂ℚ_2(√2)⊂ℚ_2(ζ_8)` at `4` | breaks `2` (`L/K`) and `1` (`M/L`); `φ_{L/K}(5/2)=9/4=φ_{M/K}(4)`; reversed `φ_{M/L}(3)=2` | order matters | Check |
| Convention: tower order | unramified `L`, `M=L(√2)` at `4` | `φ_{M/L}(4)=2+1=3`; both orders `3` | old README claim false | repaired (H01) |
| Convention: Frobenius | `ℚ_2(ζ_7)` (cubic) | arithmetic `ζ↦ζ²`, geometric `ζ↦ζ⁴` (`2·4≡1 mod 7`) | distinguishes (quadratic would not) | Check |
| Convention: lower quotient failure | `ℚ_2(ζ_8)`, `H={1,7}` | `G_3H/H = G/H`; `v(2√2)=3` ⇒ `(G/H)_3=1` | ok | Check |
| 1.1 break list | `ℚ_2(√2)` | `v(−2√2)=3` ⇒ break `2` | ok | Check |
| 1.3 upper breaks | `ℚ_2(ζ_16+ζ_16⁻¹)` | `u₁ = 2 + 2/2 = 3`; `C₄` gives `5/2` | ok | Check |

## Sources

- `fesenko-vostokov` was fetched with `sources fetch` (author-page licence class). Its locators were checked at
  lines 4131–4189 (Hasse–Arf theorem and the reduction, p. 91) and 4166–4237 (the Proposition and its proof,
  pp. 92–93). The extraction renders `⩾` as `>`; the inequality in part (3) was read as `≥`, which is consistent
  with its use for `p^{m−1} ∣ (n − n₁)` at line 4164.
- Serre, Neukirch and Sen are cited at section level and were not read. No text is listed in
  `needs-references.toml`.
- Ownership against open pull requests was checked through the brief's sibling checkouts and `roadmaps grep`.

## Build and gate

- `lake build TauCetiRoadmap.LocalFieldsRamification.Suggested`: `Build completed successfully (9004 jobs).`
  The only diagnostics are two `declaration uses 'sorry'` warnings (lines 51, 69).
- Gate: `gate LocalFieldsRamification: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`):

```text
depcheck: 174 roadmaps, 1178 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.
