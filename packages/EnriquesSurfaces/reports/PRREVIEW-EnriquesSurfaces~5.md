# Review of EnriquesSurfaces (pull request #1286 at 959683b)

**Verdict:** needs changes

:robot: Independent AI-assisted full re-review (300 changed lines since a85be7e). All five findings of the previous review are repaired (details under "Previous findings"). This head has one blocking finding. Cossec–Dolgachev's Proposition 1, which identifies the two normal kernels, can be stated at the pins on the carriers `Suggested.lean` already defines, and a scratch copy elaborates. The module docstring calls it unstatable for a reason that does not hold. The other four findings are P3 supplier, locator and wording repairs. The headline `reyeReductionImage` was checked computationally and is true.

## R01 (P2) — Cossec–Dolgachev Proposition 1 is statable at the pins but absent

**Location:** `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:21–23` ("Layer 5's normal-closure and integral overlattice comparisons need the geometric Reye lattice and its marking adapter."); `TauCetiRoadmap/EnriquesSurfaces/README.md:529` ("Define W(2) as the kernel of the action on R/2R and prove it equals the normal closure of B,K. Define Wbar(2) by normal closure of B,K,G."), `:576` ("W→Sp₈(F₂) has kernel Wbar(2)").

**Claim:** The normal-kernel identifications cannot be stated without the geometric Reye lattice and a marking.

**Witness:** In β-coordinates, R/2R is `ReyeReduction` and W acts on it through the same ρ as `reyeReductionImage`, so W(2) is `ρ.ker`. B, K and K′ are the maximal-length elements of standard parabolic subgroups, and Mathlib `CoxeterSystem.length` and `Subgroup.closure` express that. The statement in the repair elaborates at the pins with only the `sorry` warning (scratch copy of `Suggested.lean`). Its truth comes from `cossec-dolgachev-1985` lines 65–68 (Prop. 1 (i) and (ii), p. 248) and the uniqueness at lines 33–35. It also needs W→Sp(V) to be surjective, which the computation in the `reyeReductionImage` row below confirms.

**Repair:** Add to Layer 5 of `Suggested.lean` the following, which I elaborated against the pins:

```lean
/-- `w` has maximal length in the standard parabolic subgroup on `J`. -/
def IsParabolicLongest (J : Set (Fin 10)) (w : reyeDiagram.Group) : Prop :=
  w ∈ Subgroup.closure (reyeDiagram.toCoxeterSystem.simple '' J) ∧
    ∀ v ∈ Subgroup.closure (reyeDiagram.toCoxeterSystem.simple '' J),
      reyeDiagram.toCoxeterSystem.length v ≤ reyeDiagram.toCoxeterSystem.length w

/-- Cossec–Dolgachev, Proposition 1: the mod-two congruence kernel is the normal closure
of `B` and `K`; the kernel of the action on the symplectic quotient is that of `B`, `K`, `G`. -/
theorem reyeCongruenceKernels
    (ρ : reyeDiagram.Group →* Module.End (ZMod 2) ReyeReduction)
    (hρ : ∀ i x, ρ (reyeDiagram.toCoxeterSystem.simple i) x =
      x + reyePolar x (Pi.single i 1) • Pi.single i 1)
    (B K K' : reyeDiagram.Group)
    (hB : IsParabolicLongest {0, 2, 3, 4, 5, 6, 7, 8} B)
    (hK : IsParabolicLongest {0, 1, 2, 3, 4, 5, 6} K)
    (hK' : IsParabolicLongest {0, 2, 3, 4, 5, 6, 7} K') :
    ρ.ker = Subgroup.normalClosure {B, K} ∧
      ∀ w, (∀ x y, reyePolar (ρ w x - x) y = 0) ↔
        w ∈ Subgroup.normalClosure {B, K, K' * reyeDiagram.toCoxeterSystem.simple 9} := by
  sorry
```

Remove "normal-closure" from the Layer 5 sentence of the docstring. In the README §5.2 API, add a bullet naming `IsParabolicLongest`, stating that it characterizes the longest elements built through `TauCeti.longestElement`, and naming `reyeCongruenceKernels` as the statement of the two normal-closure descriptions.

## R02 (P3) — The E₇ and E₈ root systems are not in IntegralLattices §6C/6F

**Location:** `README.md:527` ("the native Weyl group of the E₇ or E₈ root system of IntegralLattices §6C/6F, generator by generator"), `:546` (*Needs:* "IntegralLattices §6C/6F for the E₇/E₈ models"), `:25` ("the E₇ and E₈ systems of §5.2 satisfy these hypotheses").

**Claim:** IntegralLattices §6C/6F supplies the E₇ and E₈ root systems to which `TauCeti.longestElement` and RootSystems §2.1 apply.

**Witness:** On main, `TauCetiRoadmap/IntegralLattices/README.md:2054` (6C) is the classification of positive-definite unimodular lattices of rank at most 9 (Iₙ, E₈, E₈⊕I₁), and `:2166` (6F) gives two models of E₈. Neither mentions E₇, and neither supplies a root pairing with a base. `TauCeti.longestElement` needs exactly that (`LongestElement.lean:194`, under `[P.IsRootSystem]` with `b : P.Base`). The native models are `TauCeti.DynkinType.rationalRootSystem` and `TauCeti.DynkinType.rationalBase` (`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Rational.lean:80`, `:87`), together with `cartanMatrix_rationalBase` (`:235`). RootSystems on main names them at `README.md:352–353`.

**Repair:** In the From Tau Ceti paragraph, in §5.2's text and in its *Needs:* line, cite `TauCeti.DynkinType.rationalRootSystem`/`rationalBase` for the valid types E7 and E8, with `cartanMatrix_rationalBase` for matching the restricted T246 matrices after §1.3 reindexing. Keep IntegralLattices only for lattices: the E₇(−1) summand of §5.1 is IntegralLattices 0G (native `typeE₇RootLattice`, `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE.lean:382`).

## R03 (P3) — Locators that do not support the cited statements

**Location and witness, item by item:**

- (a) `README.md:678` reads "Peters–Sterk, §2 and Proposition A.6, pp. 1625–1626". §2 is on pp. 1602–1606 (`peters-sterk` lines 194–338). Proposition A.6 is on p. 1625 only (`peters-sterk` lines 1076–1078).
- (b) `README.md:659` (U3, "prove they generate O⁺(M)") has no locator. `peters-sterk` lines 1008–1009 (Lemma A.2(i), p. 1623) state O↑(E₁₀(−1)) = W(E₁₀(−1)), and `dolgachev` lines 413–419 (§3, p. 11) state O(E₁₀) = W(E₁₀)×{±1}.
- (c) `README.md:469` reads "Dolgachev, §5, pp. 16–18". Only p. 16 mentions Reye congruences (`dolgachev` lines 622–624, dimension 9). The web/pencil definition is in §4, p. 15 (lines 583–589). Pages 17–18 are about Nikulin's invariants.
- (d) `README.md:353` reads "Dolgachev, §4, pp. 12–13" for the "sextic-plus-two-distinguished-lines branch models" of `:340`. Those pages give only the octic branch curve (`dolgachev` lines 468–470). The two lines and the sextic with a double point and two tacnodes are in Cossec–Dolgachev–Liedtke §1.6, printed p. 247 (`enriques-one` lines 12298–12302).
- (e) `README.md:109–111` says the groupoid is "a specialization of the supplied polarized isomorphism groupoid", citing AlgebraicModuliForArithmeticGeometry §2 and §7.3. At that roadmap's head, §2 supplies unpolarized `homAndIsomSchemes` and `automorphismGroupScheme` (§§2.1–2.2), and §7.3 supplies the Picard stack of invertible modules with all isomorphisms. The polarized object is §7.6.3 `polarisedIsomScheme`, and it is class-level.

**Repair:** (a) "§2, pp. 1602–1606, and Proposition A.6, p. 1625". (b) Add "(Peters–Sterk, Lemma A.2(i), p. 1623; Dolgachev, §3, p. 11)" to U3. (c) "Dolgachev, §4, p. 15 and §5, p. 16". (d) Add "Cossec–Dolgachev–Liedtke, §1.6, p. 247" for the branch model. (e) Say the groupoid is constructed as the fibre product of §2.1's Isom with §7.3's Picard-stack isomorphisms, and cite §7.6.3 for its class-level comparison.

## R04 (P3) — Embedded resolution of plane curves is a standard theorem, planned here without a citation

**Location:** `README.md:338` ("Supply the finite point-blowup embedded resolution of the actual reduced plane branch curve in every allowed characteristic"), `:355` (*Needs:* "the embedded plane-curve resolution target in this subsection").

**Claim:** This subsection must supply embedded resolution of plane curves in positive characteristic, as an unlocated target.

**Witness:** Stacks, Lemma 54.15.6, tag 0BIC (resolve chapter fetched as `stacks-0C5R`, lines 2016–2021, p. 45) covers every characteristic. Let X be regular of dimension 2 and Z ⊂ X a proper closed subscheme whose one-dimensional components have finite normalization. Then finitely many blowups in closed points make the inverse image of Z an effective Cartier divisor supported on a strict normal crossings divisor. A reduced plane curve over a field satisfies the hypothesis.

**Repair:** Cite Stacks Lemma 54.15.6 (0BIC) for the embedded resolution step and remove it from the *Needs:* line as a target of this subsection. Keep as targets here only the double-cover steps: the parity transform and the extra blowups at crossings of two odd branch components.

## R05 (P3) — Undefined abbreviation and process wording

**Location:** `README.md:129` ("AM7.3 `picard_infinitesimal_lifting`", "SchemeAndStackFoundations4.6's"); `:246` ("IntegralLattices6A"); `:475` ("without assuming an uncommissioned reductive GIT theorem"); `:694` ("These outputs commission the cited generic unnodal comparison").

**Witness:** The README defines "AM" nowhere. The declaration is AlgebraicModuliForArithmeticGeometry §7.3 `picard_infinitesimal_lifting` (line 9398 of that roadmap's README at its head). "Commission" and "uncommissioned" describe the planning process, which the timeless-README rule excludes.

**Repair:** Write "AlgebraicModuliForArithmeticGeometry §7.3", insert the missing spaces in run-together citations ("SchemeAndStackFoundations §4.6", "IntegralLattices §6A"), and reword the two sentences, for example "without assuming a reductive GIT theorem" and "These outputs constitute the cited generic unnodal comparison".

## Previous findings

- R01 (general Coxeter faithfulness owned by RootSystems) — **repaired.** `README.md:9` now says "RootSystems §§1.1–1.4 supplies the general theory … Section 5.2 owns only its T246 application". §5.2 (`:525`) consumes `geometric_sign_criterion`, `geometric_faithfulness` and `integral_geometric_realization`, which are on main at RootSystems `README.md:474`, `:517`, `:566`. `Suggested.lean` no longer declares `coxeterGeometricFaithful` or `reyeGeometricFaithful`.
- R02 (RootSystems "Layer 3/Layer 4") — **repaired.** `:25` cites the natives `CoxeterSystem.strongExchange` (`StrongExchange.lean:413`), `CoxeterSystem.deletionCondition` (`:463`), `TauCeti.matsumoto` (`Matsumoto.lean:138`) and `TauCeti.longestElement` (`LongestElement.lean:194`), and U3 (`:659`) cites the native exchange. No "Layer 3/4" attribution remains. The E₇/E₈ model attribution is a new issue, R02 above.
- R03 (catalogue in `Suggested.lean`) — **repaired.** The file has 83 lines and 8 declarations, all needed by the headline.
- R04 (K3Surfaces K7.C) — **repaired.** `:11` and `:639` now read "K3Surfaces states no Enriques canonical-cover comparison, and §6.2 U0 owns it". This matches K3Surfaces at its head (`README.md:43`, `:1132`).
- R05 (simple connectivity in K3Surfaces K2) — **repaired by the supplier.** K3Surfaces at its head (2ddcd6be) §2.1 `README.md:511` now proves "simple connectivity of the K3 surface and torsion-freeness of integral H²". The citation at `:219` therefore resolves.

## Verified sound

**Gate, dependency check, build.** The worker's gate at 959683b passes every check. I reran the prescribed dependency check against the candidate order (where EnriquesSurfaces is line 134, after K3Surfaces at 133) and it returned exactly:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. A rerun of the full gate with the default order reports only "NOT IN ORDER: EnriquesSurfaces (insert it after its last supplier)". That is not a finding before intake, and the candidate order places it correctly. `lake env lean` on `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`) finished in 25 s with exactly one `declaration uses 'sorry'` warning (line 73). Nothing changes outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty), and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Signatures.** `#check @` on all 8 declarations in one scratch file matches the README statements exactly. There is no `variable` block, so no binder can be lost. The checks were `reyeAdjacent : Fin 10 → Fin 10 → Prop`, the decision instance, `reyeCoxeterEntry : Matrix (Fin 10) (Fin 10) ℕ`, `reyeDiagram : CoxeterMatrix (Fin 10)`, `ReyeReduction : Type`, the two forms, and `reyeReductionImage` as quoted in `signatures.md`. Every backticked own-name in the README is declared. There is no sorry'd data, `set_option`, admitted example or stand-in carrier.

**Headline inventory and padding.** The README's headlines by layer:

- E1: canonical cover, Pic→Num kernel {O,K}, Witt lift, Picard specialization, Num ≅ U⊕E₈(−1).
- E2: hyperelliptic classification, double plane.
- E3: presentation equivalence.
- E4: Reye recognition, parameter quotient.
- E5: T246 realization (RootSystems §1.4 instance, a README target), normal kernels (R01), full mod-two image.
- E6: Aut ≅ W̄(2) on the generic nodal locus, curve transitivity, Aut ≅ Γ(2) = W_T237(2), lifting criterion, generic open.
- E7: the counts.

Apart from R01, the docstring correctly names the missing carrier of each unstated headline: the surface predicate, the Num quotient, specialization maps, the presentation groupoid, the web family, markings and periods. One-tactic probe: `simp` leaves `reyeReductionImage` unsolved, so it is not padding. `decide` confirms the Check values q(e₀+e₄)=1, M₀₄=3 and M₀₃=2.

**Sources (seeded sample and flagged locators).** The texts were fetched through the sources service without manifest edits, with ids `dolgachev` (arXiv 1412.7744v2), `cossec-dolgachev-1985` (author copy), `martin` (arXiv 1908.00049v1), `peters-sterk` (TU/e copy), `enriques-one` (2024 manuscript), `stacks-089A`, `stacks-0BXJ`, `stacks-0C5R`/`stacks-0C5S` (resolve chapter) and `davis`. Page offsets: `enriques-one` pdf = printed + 16; `peters-sterk` pdf 28 = p. 1625; `davis` pdf 127 = p. 108.

| Target | Locator opened | Result |
| --- | --- | --- |
| 0.3 | AlgebraicModuliForArithmeticGeometry (#853 head) §2.1 `homAndIsomSchemes`, §2.2 `automorphismGroupScheme`, §7.3 `PicardStackSpaces`, §7.6.3 `polarisedIsomScheme` | Ingredients exist; "supplied polarized groupoid" overstated (R03e) |
| 1.2 | SchemeAndStackFoundations main §4.10 (`:5487`, Grothendieck existence), §§5.9–5.10 (`:7129`, `:7175`); ComplexComparisonPartII (#848) C3.2d.1–2 | Derived construction; hypotheses H¹(O)=H²(O)=0 stated; supported |
| 1.3 | `dolgachev` lines 319–334 (§3, pp. 8–9: H²(S,ℤ)=Pic, unimodular, signature (1,9), U⊥E₈); C1.9, C5.4 (exponential at #848 `:3709`) | Supports |
| 1.4 | `dolgachev` lines 272–284 (torsion is ⟨K⟩); EtaleCohomologyFoundations, C6.3/C6.5/C6.6 for the integral comparisons | Supports as cited ("integral refinement uses the stated suppliers") |
| 1.5 | `dolgachev` lines 328–334 (p. 9); IntegralLattices main 6A `:2019` (t₋ ≥ t₊ ⇒ U^{t₊}⊕E₈(−1)^k) | Supports |
| 2.1 | `enriques-one` lines 14195–14206 (Prop 2.6.1, pp. 290–291), 14245–14248 (Prop 2.6.4, p. 292), 14358–14368 (Cor 2.6.5, p. 294), 14963–14971 (Prop 3.2.1, p. 308) | Hypotheses (big nef, Φ=1, D²=2n≥2) and conclusions match |
| 2.3 | `dolgachev` lines 468–470 | Background only; see R03d, R04 |
| 3.2 | `stacks-0BXJ` lines 3204–3209 (Lemma 31.29.5); `stacks-0C5R` lines 2335–2337, 2390–2394 (Lemmas 54.17.1–2); `enriques-one` lines 10108–10120 (Thm 1.1.3, Rem 1.1.4(1), p. 201) | Supports |
| 4.1 | `cossec-dolgachev-1985` lines 77–82 (Prop 2, p. 248); `dolgachev` lines 583–589, 622–624 | CD supports; Dolgachev page range loose (R03c) |
| 4.2 | `cossec-dolgachev-1985` lines 16–20 (§1, p. 247), 81–82 (§4, p. 248) | Supports ("9-dimensional variety") |
| 5.1 | `peters-sterk` lines 1038–1049 (Lemma A.5, pp. 1624–1625: R₁₀ = E₇(−1)⊥⟨−2⟩⊥U ≅ T₂,₄,₆, r₊·β₉ = −2) | Supports |
| 5.3 | `cossec-dolgachev-1985` lines 32–35 (§2, p. 247), 56–68 (§3 and Prop 1, p. 248: B, K, G = w₀·s₉) | Supports; full-image refinement recomputed below |
| 6.2 | `peters-sterk` lines 1076–1078 (Prop A.6, p. 1625), 194–338 (§2, pp. 1602–1606), 1008–1009 (Lemma A.2(i)) | Statements supported; pages wrong and U3 locator missing (R03a,b) |
| 7.1 | `cossec-dolgachev-1985` lines 42–46 (Thm 2, p. 247), 112–115 (§5, p. 249: orbit/stabilizer method) | Supports |
| 7.2 | `cossec-dolgachev-1985` lines 21–24 (§1), 42–46, 117–118 ([AS] reference) | Supports the counts and the referral |
| §5.2 standard form | `davis` lines 4738, 4745 ((6.32)–(6.33), p. 108) | Supports |

**Pinned API opened.** In Tau Ceti `a91d3aa`:

- `CoxeterSystem.geometricRepresentation` (`TauCeti/GroupTheory/Coxeter/Geometric.lean:479`) and `geometricRepresentation_simple` (`:485`).
- `strongExchange` and `deletionCondition` (`StrongExchange.lean:413`, `:463`), with arbitrary index type `{B W : Type*}` at `:80`.
- `exists_isMinimalCosetRep` and `length_mul_of_isMinimalCosetRep` (`Parabolic.lean:236`, `:280`).
- `TauCeti.matsumoto` (`Matsumoto.lean:138`).
- `TauCeti.longestElement` (`LinearAlgebra/RootSystem/LongestElement.lean:194`), under `[Finite ι] [IsDomain R] [P.IsCrystallographic]` (`:120`), `[CharZero R]` (`:87`), `[P.IsReduced]` (`:156`) and `[P.IsRootSystem]`, which match the README's hypotheses.
- `TauCeti.coxeterMatrixOfBase` (`RootSystem/Coxeter/Matrix.lean:278`).
- `rationalRootSystem`, `rationalBase` and `cartanMatrix_rationalBase` (`SimplyConnectedRootDatum/Rational.lean:80`, `:87`, `:235`).
- `typeE₇RootLattice` (`IntegralLattice/RootLattice/TypeE.lean:382`).
- `globalSectionsSmul_naturality` and `baseRingToGlobalSections` (`AlgebraicGeometry/Modules/GlobalSections.lean:143`, `:199`).

The pinned Tau Ceti has no Coxeter-side longest element in `GroupTheory/Coxeter/`, which is why R01 uses a maximal-length predicate.

**Cross-roadmap citations resolved.**

- On main:
  - RootSystems §§1.1–1.4 (`:430`, `:462`, `:515`, `:564`), §2.1 (`:616`, `weylCoxeterHom_injective`/`_surjective`), and the Enriques boundary (`:63–68`, `:1168`).
  - IntegralLattices 6A (`:2019`), 6C (`:2054`), 6F (`:2166`), 0G (`:438`) and the (t₊,t₀,t₋) convention (`:258`).
  - SchemeAndStackFoundations §2.11 (`:3656`), §2.20 (`:4275`), §4.6 (`:5291`), §4.9 (`:5448`), §4.10 (`:5487`), §4.11 (`:5528`), §4.13 (`:5643`), §5.9 (`:7129`) and §5.10 (`:7175`).
- At open heads (line numbers of each README):
  - K3Surfaces (#1285): K0.A (`:247`), K2 (`:503`, `:511`), K6.A (`:749`), K6.B (`:791`), K7.A (`:838`), K7.B (`:974`), §7.3 (`:1065`).
  - WeilConjectures (#1208): WC.7 (`:1540`), with the Enriques condition and its "no classical-only hypothesis" clause at `:1756–1762`.
  - AbelianSchemesAndArithmeticModuli (#849): A4.8 (`:2324`), Stacks 089A.
  - ComplexComparisonPartII (#848): C1.9 (`:1854`), C3.2d.1 (`:2319`), C3.2d.2 `relative_picard_algebraicSpace` (`:2339`), C5.4 (`:3421`), C6.3 `artinComparison` (`:4603`), C6.5 `artinSmoothTrace` (`:4819`), C6.6 `adicArtinComparison` (`:4857`).
  - AlgebraicModuliForArithmeticGeometry (#853): §§1.1–1.3 (`:305`, `:504`, `:601`), Layer 2 (`:1070`), §3.5 (`:1810`), §7.3 `picard_infinitesimal_lifting` (`:9398`), whose hypothesis (small Artinian thickening, kernel killed by the maximal ideal) holds for W(k)/pⁿ⁺¹→W(k)/pⁿ. Also §7.6.1 (`:9647`) and §7.6.1a (`:9712`).
  - NeronModelsAndSemistableAbelianVarietiesPartII (#870): §2.1 (`:3784`).
  - FourManifolds (#936): §7.3 "The Enriques cover" (`:2976`).
  - EnriquesSurfacesAndIntegralNonexistence (#1488) cites E1a–E1f, which `README.md:50` defines.

The overlap leads "IntegralLattices §6A/§6C only in #1797" are false positives: main has both milestones as labelled paragraphs at `:2019` and `:2054`.

**Ownership by object.** I searched main and all 466 open heads (`roadmaps grep`) for `T2,4,6|T246|Reye`, for `T2,3,7|W(E10)|Enriques lattice`, and for all Enriques mentions. T246/Reye objects are owned only here, and RootSystems on main assigns them here explicitly. EnriquesSurfacesAndIntegralNonexistence (#1488) owns the characteristic-two and arbitrary-field extensions and consumes E0–E1f. K3Surfaces consumes no Enriques result (`:43`, `:395`). CohomologyComparisons §5.11 is a characteristic-two BMS lift, a different object. AlgebraicModuliForArithmeticGeometryPartII uses Enriques surfaces only in Checks. There is no second owner.

**Adversarial table.** Values were computed by hand, in pure-Python scripts (exact rational elimination, F₂¹⁰ enumeration, random Schreier–Sims), or with `decide` at the pins.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.3 scalar kernel | S geometrically integral; S⊔S; λ=2 then 3 | H⁰(O)=k ⇒ Aut(O)=k×; k××k×; 6 on H⁰, identity on P(H⁰) | holds |
| §0.3/§3.1 left action | a,b ∈ Aut(S) | ((ab)⁻¹)* = (b⁻¹a⁻¹)* = (a⁻¹)*∘(b⁻¹)*, so (ab)·L = a·(b·L) | holds |
| §1.1 lift obstruction | W(k)/pⁿ⁺¹→W(k)/pⁿ | kernel pⁿW/pⁿ⁺¹W ≅ k, square-zero, killed by p; H²(T)⊗I = 0, H²(O)⊗I = 0 | holds |
| §1.1 Pic→Num kernel | L numerically trivial, L≠O | χ(L) = 1 + ½L(L−K) = 1 ⇒ h⁰(L)+h⁰(K−L) ≥ 1 ⇒ L = K | holds |
| §1.2 reduction of Pic | thickening as above | H¹(O)⊗I = H²(O)⊗I = 0 ⇒ Pic(𝒮ₙ₊₁)→Pic(𝒮ₙ) bijective | holds |
| §1.2 RR polarization | Enriques isotropic F,G, F·G=1; P¹×P¹ | χ: 2−1−1+1 = 1; 4−2−2+1 = 1 | holds |
| §1.2 vertical class | regular model over R′ | special fibre = div(π) integral ⇒ class 0 | holds |
| §1.2 automorphisms | trivial line over R | Aut = R× ≠ {1} | holds |
| §1.3 Chern sign | u = 0, 1; O(±1) on P¹ | exp(2πiu) = 1, kernel ℤ; degrees 1, −1 | holds |
| §1.3 integral Pic | H¹(O)=H²(O)=0 | Pic ≅ H²(S,ℤ) ≅ ℤ¹⁰⊕ℤ/2; c₁(K) order 2, rational image 0; signature (1,0,9) | holds |
| §1.4 two-primary tower | ℓ=2, n=1,2,3 | H³(S,ℤ) ≅ H₁(S,ℤ) = ℤ/2 (π₁(S)=ℤ/2 via K3 §2.1); H³(C)[2ⁿ] = ℤ/2; transitions ×2 = 0; inverse limit 0 | holds |
| §1.4 odd ℓ | ℓ = 3 | ℤ/2⊗ℤ₃ = 0, so K has zero image | holds |
| §1.5 normal form | (t₊,t₋)=(1,9); comparison lattice | 6A: k = 8/8 = 1, U⊕E₈(−1), det −1; U⊕E₇(−1)⊕⟨−2⟩: (−1)(−2)(−2) = −4; scaling by 2: det×2¹⁰ | holds |
| §1.6 Φ | D = 2F₁+F₂ | D² = 4, D·F₁ = 1 ⇒ Φ = 1; D = 0 gives 0, excluded | holds |
| §2.1 squares | F₁+F₂, 2F+R, 2F₁+F₂, 3F+R | 2, 2, 4, 4; (2F+R)·R = 0 (R fixed at n=1); (3F+R)·R = 1 | holds; CDL 2.6.1 |
| §2.1 n=2 | h⁰ = D²/2+1 | 3; moving square 4−1−1 = 2 ⇒ degree 2 onto degree-(n−1)=1 surface in P² | holds; CDL 2.6.5 |
| §2.2 canonical formula | A = O(4), O(3) on P² | ω_Y = f*O(1); f*O | holds |
| §2.3 branch transform | m = 1, 2, 3 | B′ = strict+E, strict, strict+E; A′ = σ*A, σ*A−E, σ*A−E; 2A′ = σ*B−2⌊m/2⌋E = B′ | holds |
| §2.3 odd–odd crossing | t² = xy, chart y = xv, t = xw | w² = v smooth; origin of t²=xy singular | holds |
| §3.2 square root | Pic(P²)=ℤ; b ∈ H⁰(O(8)) | A = O(4) unique; b ↦ c²b via t ↦ ct, c ≠ 0 | holds |
| §3.2 minimal models | P², P¹×P¹ | ρ = 1, 2; κ = −∞, so Remark 1.1.4(1) does not apply | holds |
| §3.3 isotropic pair | h = f+g; e = af+bg+v, h·e=1, e²=0 | a+b = 1 ⇒ ab ≤ 0 ⇒ v² = −2ab ≥ 0 ⇒ v = 0, e ∈ {f,g} | pair unique; holds |
| §4.1 degeneracy | maps 4→3 of rank ≤ 2 | codim (4−2)(3−2) = 2 in dim Gr(2,4) = 4; rank 2 ⇒ kernel 2 (pencil), rank 3 ⇒ kernel 1 | holds |
| §4.1 symmetroid | det of 4×4 linear symmetric | degree 4 vs Plücker degree 10 | holds |
| §4.2 dimensions | Gr(4,10), PGL₄ | 24, 15, 24−15 = 9; trivial action leaves 24 | holds |
| §5.1 Gram (f₁..f₉,δ) | all entries | det −1; δ² = 10, δ·fᵢ = 3; f₁₀ = 3δ−Σ₁⁹fᵢ verified | holds |
| §5.1 β pairings | 100 pairs | βᵢ² = −2; value 1 exactly on {(0,4),(1,2),…,(8,9)}; det −4; coordinate det 2 | holds |
| §5.1 r | r = δ−2f₁₀ | r² = −2; r·β = (0,…,0,−2); r·f₁ = 1 ⇒ R = {x : x·r even} by index | holds |
| §5.2 A = 2B | m = 1, 3, 2 | 2·(1, −½, 0) = (2, −1, 0) = (A₀₀, A₀₄, A₀₃); β₀ ↦ β₀−2β₀ = −β₀ | holds |
| §5.2 signature | A₉ chain minor, det A | 10 > 0, −4 < 0 ⇒ (9,0,1) | holds |
| §5.2 subdiagrams | {0,2..8}, {0..6}, {0,2..7} | arms (1,2,4), (1,3,2), (1,2,3): E₈, E₇, E₇; det −Gram 1, 2, 2; w₀ lengths 120, 63, 63 | holds |
| §5.2 E₇/E₈ models | IntegralLattices 6C/6F | 6C: unimodular definite rank ≤ 9; 6F: E₈ only; no root pairing | wrong supplier (R02) |
| §5.3 q | 0, e₀, e₀+e₄, u, z, u+z | 0, 1, 1, 0, 1, 1 | holds; `decide` for e₀+e₄ |
| §5.3 radical | all 1024 vectors | {0, u, z, u+z} = bit-sets {∅, {0,5,7,9}, {1,3,5,7,9}, {0,1,3}} | holds |
| §5.3 generators mod 2 | all pairs; all x | adjacent products order 3, nonadjacent 2; sᵢ preserve q on 1024 vectors, fix radical | holds |
| §5.3 B, K, G mod 2 | integral w₀ matrices | B ≡ K ≡ id; G ≡ (x ↦ x + x₈u) on 10/10 basis vectors; G(e₈) = e₈+u | holds |
| §5.3 orders | Sp₈(F₂) | 2¹⁶·3·15·63·255 = 47,377,612,800 = 2¹⁶3⁵5²7·17 | holds |
| `reyeReductionImage` | ⟨ρ(sᵢ)⟩ against radical-fixing q-isometries | lower bound (Schreier–Sims, base e₀..e₉): 510·252·128·1·64·30·16·6·4·1 = 12,128,668,876,800; upper bound \|V*\|·\|Sp(V)\| = 2⁸·47,377,612,800 = same | true; `simp` fails, not padding |
| `reyeCongruenceKernels` (R01) | scratch elaboration | elaborates with only `sorry`; truth from CD Prop. 1 and the surjection W→Sp(V) above | statable, absent (R01) |
| §6.1 primes | p = 11; 2, 3, 5, 7, 17 | 11 ∤ \|Sp₈(F₂)\|; each listed prime divides | holds |
| §6.1 freeness | [x:y] ↦ [−x:y] | fixes [0:1], [1:0] in characteristic 0 | holds |
| §6.2 U0 scaling | e·f = 1 | (π*e)·(π*f) = 2 | holds |
| §6.2 U1 | e′−f′ ∈ U(2) ⊂ M(2); e−2f ∈ U | squares −4, −4; divisibility 2, 1 | holds |
| §6.2 M(2) | any x | x²_{M(2)} = 2x²_M ∈ 4ℤ; \|A_{M(2)}\| = \|M/2M\| = 2¹⁰ | holds |
| §6.2 U2 signs | ±id on A_T | A_T ≅ (ℤ/2)¹⁰ has exponent 2 ⇒ +id ≡ −id | holds |
| §6.2 U3 | α basis | α₀ = e₀−e₁−e₂−e₃ in ℤ^{1,10}; det −1; α₀ meets α₃; coordinate det −1 | holds; locator R03b |
| §6.3 527 | split q on M/2M | 527 nonzero singular vectors = `martin` line 154 | holds |
| §7.1 orbit identity | (S₃, A₃, ⟨(12)⟩); H = 1; H = W | 1 = 1; 3 = 3; 1 = 1 | holds |
| §7.2 counts | 34,780; 136 | 2²·5·37·47, with 37, 47 ∤ \|Sp₈\|; 2³·17 = 136 | holds |
| `reyeCoxeterEntry` | (0,4), (0,3), (0,0) | 3, 2, 1 | holds; `decide` |

## Not verifiable

- **Averbukh, Chapter X** (in Shafarevich (ed.), *Algebraic surfaces*, Proc. Steklov 75, 1964). There is no legal text through the sources service. The precise relation behind 34,780/136 remains uncertified, as `README.md:763` states. Cossec–Dolgachev's reference [AS] (`cossec-dolgachev-1985` line 117) names only the editor, so the attribution of Chapter X to Averbukh could not be checked against a cached text.
- **Cossec–Dolgachev 1985 is an announcement.** Proposition 1 and Theorems 1–3 have proof sketches only. The roadmap treats them as construction targets, which is consistent.
- **Cossec–Dolgachev–Liedtke manuscript typography.** The extraction's font map is defective (digits are remapped). Statements were read from context: for example, "Q" stands for 1 and "R" for 2 in Prop 2.6.1.

## Source issues

- **Error** in martin at Caveat 1.6, printed p. 3: the source says O⁺(10,F₂) is the automorphism group of a nondegenerate symmetric bilinear form of Witt defect 0; it should be the isometry group of the split quadratic form, a proper subgroup of the symplectic group of its polar form; affects a stated result.
- **Error** in dolgachev at §6 before Theorem 7, printed p. 25: the source says the orthogonal group of R/2R is 2⁸⋊Sp(8,F₂); it should say the subgroup fixing the polar radical pointwise, since an isometry may also exchange the two radical vectors of q-value 1; affects a stated result.
- **Misprint** in peters-sterk at the proof of Lemma A.5(iii), printed p. 1625: the source says the ten nodes of T₂,₃,₆; it should say T₂,₄,₆; affects the proof.
- **Misprint** in stacks-0C5R at the proof of Lemma 54.17.1 (tag 0C5R), printed p. 52: the source says V contains all codimension-one points of V; it should say of Y; affects the proof.
- **Error** in stacks-0BXJ at Lemma 31.29.5 (tag 0BXJ), printed pp. 70–71: the source says Pic(Pⁿ_R) = ℤ for a UFD R with no restriction on n; it should require n ≥ 1, since P⁰_R = Spec R has trivial Picard group; affects a stated result.
