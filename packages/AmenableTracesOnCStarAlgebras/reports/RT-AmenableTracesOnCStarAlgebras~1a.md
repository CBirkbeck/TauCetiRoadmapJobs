<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6849298215 -->
Red team round 1 pass a (claude) of 6e93daa

Verdict: needs_changes

1. **F01** (P2) the comparison of `generatedCStarAlgebra lam` with D2's `ℂ ⋊_r Γ` is asserted, not owned

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:1849-1852`: "with its dense group
   ring and expectation it is OperatorAlgebraDynamics D2's reduced group C*-algebra, and the
   canonical trace … is a faithful tracial state"; used at `README.md:1859-1860` ("(i) ⇒ (ii) because
   `C*_r(Γ) = ℂ ⋊_r Γ` is nuclear for amenable `Γ`").

   **Claim.** The headline `amenable_tfae_generatedCStarAlgebra` is about the concrete algebra
   `generatedCStarAlgebra lam` on `lp (fun _ : Γ => ℂ) 2`. Its route (i) ⇒ (ii) takes nuclearity from
   D2, which proves it for the reduced crossed product `A ⋊_r G` built from Tau Ceti's regular
   covariant representation on `L²(G, μ; H)`. The star isomorphism between the two carriers, for an
   arbitrary discrete `Γ`, is a prose identity here: it is not a target of §7.3, and no cited section
   states it.

   **Witness.** `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:1466-1470` (D2 carrier: the regular
   covariant representation and `L²(G,A)`), `:1548-1549` (nuclearity for `A ⋊_r G`), `:1833-1838`
   (D2.FreeGroups states results on `generatedCStarAlgebra` for free groups only). No line of D2 or
   D2.FreeGroups states `generatedCStarAlgebra lam ≅ ℂ ⋊_r Γ` for general `Γ`. Also
   `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean:337` already declares
   `generatedCStarAlgebra` with the same body; the README and the module docstring name the
   restatements of C6.1, C8.1, V4, V13a and §2.1 but not this one.

   **Repair.** In §7.3 replace the sentence quoted above by a proved target, and name the restatement:

   > The definition `generatedCStarAlgebra` of `Suggested.lean` restates the definition of the same
   > name of OperatorAlgebraDynamics D2.FreeGroups. Prove the comparison with D2: for the counting
   > measure on `Γ` (a Haar measure of the discrete group; no countability is used), the coordinate
   > unitary `W : lp (fun _ : Γ => ℂ) 2 → L²(Γ, count)`, `W δ_h = 1_{{h}}`, intertwines `λ_g` with
   > the regular unitary `u_g` of D2 for the trivial action on `ℂ` (both send `δ_h` to `δ_{gh}`), so
   > `x ↦ WxW*` is a star isomorphism of `generatedCStarAlgebra lam` onto `ℂ ⋊_r Γ` carrying the span
   > of the `λ_g` onto the finite sums `Σ c_g u_g`. Nuclearity for amenable `Γ` (D2), the faithful
   > expectation and the canonical trace `τ_Γ(x) = ⟪δ_e, xδ_e⟫` (D2.FreeGroups) are transported along
   > it.

   Add an API bullet "`generatedCStarAlgebra lam ≅ ℂ ⋊_r Γ`, compatibly with the group ring and
   `τ_Γ`", add the same restatement clause to the OperatorAlgebraDynamics bullet of "Scope and
   ownership" and to the module docstring of `Suggested.lean` (next to the C6.1/C8.1/V4/V13a/§2.1
   sentence). Tested on the instances: `Γ = 1` gives `ℂ ≅ ℂ`; `Γ = ℤ` gives `Wλ_1W*` = the shift
   `f ↦ f(· − 1)` of `L²(ℤ, count)`, D2's `u_1`, and `C(𝕋)` on both sides (README Check of §7.3).

2. **F02** (P3) §4.5 cites C8.2 for a statement C8.2 does not make

   **Location.** `README.md:356-359` ("from C8.2 the finite-set compression step: … a u.c.p.
   `φ : A → M_n`, there are isometries `V_m : ℂⁿ → H` with `‖φ(a) − V_m* a V_m‖ → 0`") and
   `README.md:1392-1396` ("the compression step of CStarAlgebras C8.2"; *Needs:* lists only C8.2).

   **Claim.** C8.2 states this compression theorem for u.c.p. maps into `M_n`.

   **Witness.** `TauCetiRoadmap/CStarAlgebras/README.md:1619-1629`: C8.2 states absorption of a unital
   *representation* `ρ` (`U_n π(a) U_n* − (π(a) ⊕ ρ(a)) → 0`) and says only "Develop the finite-set
   isometry and compression approximations"; no u.c.p. statement.

   **Repair.** In §4.5 replace "(the compression step of CStarAlgebras C8.2)" by: "(by Stinespring,
   CStarAlgebras C4.2, `φ_n = W*ρ(·)W` with `ρ` a unital representation on a separable `K` and
   `W : ℂ^{k_n} → K` an isometry; C8.2 gives unitaries `U_m : H → H ⊕ K` with
   `U_mπ(a)U_m* − (π(a) ⊕ ρ(a)) → 0`, and `V_m = U_m*(0 ⊕ W)`)"; reword the C8.1–C8.3 contract line
   to "from C8.2, absorption of a unital representation on a separable space, from which §4.5 derives
   the compression step"; add C4.2 to the *Needs:* of §4.5 and to the Layer 4 Dependencies. Tested:
   `V_m*π(a)V_m = W*·P_K U_mπ(a)U_m* P_K·W → W*ρ(a)W = φ_n(a)`; `K` is separable since `A` is and
   `k_n < ∞`.

3. **F03** (P3) no Check pins the opposite-algebra convention of the tensor form

   **Location.** `README.md:1349-1351` (condition (d), "`|Σᵢ τ(aᵢbᵢ)| ≤ ‖Σᵢ π(aᵢ) ⊗ ρ(bᵢᵒᵖ)‖`") and
   its Lean form `isAmenableTrace_iff_norm_sum_le` (`Suggested.lean:196-203`); Checks at
   `README.md:1330-1338` and `1370-1377`.

   **Claim.** The Checks determine the convention (`ρ` a representation of `Aᵒᵖ`, not of `A`).

   **Witness.** The only two-term value given, `μ_τ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/n ≤ 1`, also holds for the wrong
   model `ρ : A → B(K)`; the commutative Checks cannot see the difference. In `M_n`,
   `x = Σ_{ij} e_{ij} ⊗ e_{ji}ᵒᵖ`: `Σ tr_n(e_{ij}e_{ji}) = n`; with `ρ(bᵒᵖ) = bᵀ` the norm is `n`;
   with `ρ = id` the element is the flip, of norm `1`.

   **Repair.** Add to the Checks of §4.4:

   > - Convention control for (d): in `M_n` with `τ = tr_n`, `π = id` on `ℂⁿ` and the faithful
   >   representation `ρ(bᵒᵖ) = bᵀ` of `M_nᵒᵖ`, the family `(e_{ij}, e_{ji})_{i,j}` gives
   >   `Σ τ(e_{ij}e_{ji}) = n` and `Σ e_{ij} ⊗ e_{ij} = n·P` for the rank-one projection `P` onto
   >   `n^{-1/2}Σ e_i ⊗ e_i`, of norm `n`: equality. Taking a representation of `A` instead of `Aᵒᵖ`
   >   (`ρ = id`) gives the flip `Σ e_{ij} ⊗ e_{ji}`, of norm `1 < n` for `n ≥ 2`, and the inequality
   >   would fail for the amenable trace `tr_n`.

4. **F04** (P3) `IsNormalState` has no discriminating Check

   **Location.** `README.md:1428-1430` (definition) and the Checks of §4.6, `README.md:1457-1465`.

   **Claim.** Each definition has at least three discriminating Checks.

   **Witness.** The four Checks of §4.6 (`M_n`, `L∞[0,1]`, `L(F₂)`, `H = 0`) all test injectivity;
   none exhibits a functional that fails normality, so the predicate "every positive functional"
   passes them all.

   **Repair.** Add to the Checks of §4.6:

   > - Normality, positive control: on `M = ℓ∞(ℕ) ⊆ B(ℓ²)`, `τ(x) = Σ_{n≥0} 2^{-n-1}x_n` is normal;
   >   on the increasing indicators `1_{[0,m]} → 1` (strongly) it takes the values
   >   `1 − 2^{-m-1} → 1 = τ(1)`.
   > - Normality, negative control: for a free ultrafilter `U`, `σ(x) = lim_U x_n` is a tracial state
   >   of `ℓ∞(ℕ)` with `σ(1_{[0,m]}) = 0` for every `m` and `σ(1) = 1`, so it is not normal; it is not
   >   faithful either (`σ(e₀) = 0`). It is amenable (§7.1) and `ℓ∞(ℕ)` is injective, consistent with
   >   the direction of the theorem that uses neither hypothesis.
   > - On `M_n ⊆ B(ℂⁿ)` strong convergence is norm convergence, so every positive functional is
   >   normal, in particular `tr_n`.

One P2 (a comparison the route of a Lean headline uses and no target or supplier states) and three
P3 (one supplier step, two Checks). No statement of `Suggested.lean` or of the README was found
false. Dependency check, run on the package README:

    depcheck: 206 roadmaps, 1900 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. FactorRigidity stands after this roadmap in
`merge-order/ORDER.txt` but is a roadmap on main, so its citation (§2.2, a remark only) is allowed.

## Verified sound

Counts: 45 declarations of `Suggested.lean` read (22 theorems, 18 definitions, 1 abbreviation,
4 instances) and compared with the elaborated types in the worker's signature file; 40 README
subsections read in full (all 2096 lines), each with a Checks block; about 80 line locators
verified against the cached texts (`brown2006` about 70, `schafhauser2020` 4,
`tikuisis-white-winter2017` 9), that is every line locator of the README except the interiors of
the proof ranges `brown2006` 1235–1261, 1000–1015 and 1041–1048, whose endpoints only were read;
145 Check items read, and every one that carries a number or a formula recomputed; 35 sibling
citations resolved on main (CStarAlgebras C2.1, C2.8, C4.1, C4.2, C5.1, C5.2, C5.4, C6.1, C6.2,
C6.5, C7.1, C8.1–C8.4, C9.1, C9.7; VonNeumannAlgebras V0–V6, V13a, V13b.SpatialNorm, V13b;
CStarClassification §2.1, §3.4, §3.5; OperatorAlgebraDynamics D2, D2.FreeGroups, D7;
FactorRigidity §2.2; BanachSpaceTheory B1), each with the statement this README attributes to it
(one exception, R02); about 55 pinned declarations grepped at the Mathlib and Tau Ceti pins, with
their files and, for the KMS, amenability and GNS ones, their hypotheses.

- **Policy.** The pull request changes only `packages/AmenableTracesOnCStarAlgebras/`. No
  `set_option`, `lemma`, `#eval`, `True` placeholder, sorry'd data, pull-request number, process
  narrative or machine path. Imports: `import Mathlib` and three `TauCeti.*` modules, each used.
  `plan.json` declares no gap and the README states none. Every Lean name occurs in the README.
- **Ownership.** `roadmaps grep` for amenable/quasidiagonal traces, hypertraces, Connes–Kirchberg,
  Schafhauser, Tikuisis and the Lean names of this file: no other owner on main or at an open
  head. `IsInjective`, `IsNormalState`, `IsNuclearMap`, `IsQuasidiagonalSet`, `IsQuasidiagonal`,
  `IsAF` have bodies identical to `IsInjective`, `IsNormalFunctional` (on `→P`),
  `IsNuclearContraction` (on bare maps), `IsQuasidiagonalSet`, `IsQuasidiagonal`, `IsAF` of the
  cited roadmaps, in a different namespace (no shared fully qualified name).
- **Dropped binders.** The four leads (`IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace`,
  `IsAF` lose `[StarOrderedRing A]`, the last also `[PartialOrder A]`) are harmless: no body or
  consumer needs the instance, and every theorem carries it.
- **Headlines.** Stated: unitization; Connes–Kirchberg (hypertrace, extension, tensor forms);
  Følner (both); tracial von Neumann form; UAT ⇔ injective; nuclear; exact; both faces; normalized
  restriction; ideal extension; commutative; AF; groups; QD ⇒ QD trace; faithful QD trace ⇒ QD;
  Rosenberg; AF-subalgebra necessity. The three headlines the docstring declares not statable
  (bimodule form, vector-trace clause, `⊗min`) lack carriers at the pins: no minimal C*-tensor
  product and no right GNS representation exist there, and `gnsVector` exists only for unital `A`.
  No declaration follows from one library lemma except the instances discussed under "Not
  verifiable".

Pass table (values computed on each side):

| Statement | Instance | Computed | Result |
|---|---|---|---|
| `IsTracialState` | `M_2`, `x ↦ x₁₁`; `Tr`; `A = 0` | `1 ≠ 0` on `e₁₂e₂₁, e₂₁e₁₂`; norm `2`; norm `0` | excluded, as stated |
| `matrixTrace`, `matrixTwoNorm` | `e₁₁ ∈ M_2`; `k = 0` | `1/2`, `2^{-1/2}`; `0⁻¹·0 = 0`, `√0 = 0` | junk harmless |
| `IsAmenableTrace` | `k = 0`, `F ∋ a` with `τ(a) ≠ 0` | `‖0 − τ(a)‖ < ε` fails for small `ε` | `M_0` never a witness |
| three classes, normalization | `φ_m = τ(·)1_m/m`, `M_2`, `e₁₂,e₂₁` | defect `1/(2m)`, `tr_m φ_m(1) = 1/m` | rejected |
| `isAmenableTrace_unitization_iff` | `A = ℂ`: `Ã ≅ ℂ²`; `c₀`, `δ_1` | `τ̃ = pr₁`; norm `δ` vs `2δ` at `(1/2, −1/2)` | true both ways, factor 2 |
| `isAmenableTrace_iff_exists_isHypertrace` | `ℂ² ⊆ M_2`, `τ = (t,1−t)` | `ψ = tT₁₁ + (1−t)T₂₂` central; vector state `1/2 ≠ 0` | true |
| `…_iff_exists_ucp_extension` | `ℂ²`, `τ = pr₁` | `Φ(T) = T₁₁`, `Φ(1) = 1`, `Φ(a,b) = a` | true |
| `…_iff_norm_sum_le` | `M_n`, `(e_{ij}, e_{ji})` | `n ≤ n`; wrong model `n ≤ 1` | true; R03 |
| `IsFoelnerTrace` sum | `P = e₁₁`, `T = e₁₂` on `ℂ²` | `0 + 1 = ‖e₁₂‖²_HS` | identity holds |
| `isAmenableTrace_of_isFoelnerTrace` | compression `PπP` | `‖φ(ab) − φ(a)φ(b)‖₂² ≤ ‖a‖²ε` | true; `hτ` unused (note) |
| `isAmenableTrace_iff_isFoelnerTrace` | `ℂ² ⊆ M_2`, `(1/3, 2/3)` | commutator² `4/9` at trace `1/3` | `hess` needed, present |
| `IsInjective` | `H = 0`; `M_n` | zero map, norm `0 ≤ 1`; identity | no norm-one claim |
| `IsNormalState` | `ℓ∞`, `lim_U` | `0, 0, … ↛ 1` | discriminates; R04 |
| `isAmenableTrace_iff_isInjective` | `M = ℂ1` on `ℓ²`; `L(F₂)` | both sides true; both false | true |
| `isUniformAmenableTrace_iff_isInjective` | `C*(F₂)`, regular trace | not UAT, `L(F₂)` not injective | true |
| `IsNuclearMap` | zero map, `n = 0`; `id_{B(ℓ²)}` | holds; fails | as intended |
| `isAmenableTrace_tfae_of_isNuclearMap` | `C*_r(F₂)`; `C*(F₂)` | all four false; hypothesis fails | true |
| face theorems | `ℂ²`, `(1/2,1/2) = ½pr₁ + ½pr₂`; `C*_r(F₂) ⊕ ℂ` | all amenable; `AT = {χ∘pr₂}` | true |
| `…_of_normalized_comp` | `M_3 → M_4`; `c₀ ⊆ c`, `(x₁ + lim)/2` | `c = 3/4`, `tr_3`; `c = 1/2`, `δ_1` | true; `c = 1/2` at `M_3` gives norm `3/2` |
| `…_of_comp_ideal` | `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`; `q : C*(F₂) → C*_r(F₂)` | `tr_2∘pr₁`; fails without `hι` | `hι` needed, present |
| `isQuasidiagonalTrace_of_commute` | `C[0,1]`, `f = x` | Riemann sum `(n+1)/(2n) → 1/2` | true |
| `IsAF`, `…_of_isAF` | `A = 0`; `K(ℓ²)`; CAR | AF, `T = ∅`; `T = ∅`; exact recovery | vacuous cases harmless |
| `amenable_tfae_…` | `Γ = 1`, `ℤ`, `S₃`, `F₂` | all true ×3; all false for `F₂` | true |
| `IsQuasidiagonal.{u}` | separable `A`, any `u` | `ULift ℓ²` available | conclusion provable |
| `exists_isQuasidiagonalTrace_…` | `π(1) = q ≠ 1`; `SO₂` | restrict to `qH`; no trace | unit needed, present |
| `subalgebra_isAF_simple` | `M_3 ⊆ CAR`; `B = ℂ²` | `c = 3/4`, `tr_3`; `pr₁` not faithful | simplicity needed, present |
| §2.1 norm unitalization | `φ(1) = diag(1, 1/100)` | `δ = 0.0099`, `t₋ < 2δ`, `Q = e₁₁` | true |
| §2.4 Ozawa | `h = diag(1/3, 2/3)` | `min`: `1/3 ≤ 1/3`; `max`: `2/3 > 1/3` | `min` correct |
| §5.2 defect bound | `y = x − a`, `‖a‖ ≤ ‖x‖` | `d₂(y) ≤ τ**(y*y) + 4‖x‖²‖tr∘φ − τ‖` | true |
| §6.5 route | `ω = tr∘ψ`, `e ∈ I` | `|ω(a − eae)| ≤ 2‖a‖ω((1−e)²)^{1/2}` | trace recovery on `A` holds |

## Not verifiable

- **Lean elaboration.** This pass runs no Lean; the binder comparison used the worker's elaborated
  signatures, not a fresh `#check`.
- **Whether two instances are redundant.** `starOrderedRing_vonNeumannAlgebra` and
  `starOrderedRing_generatedCStarAlgebra` have as body Mathlib's own instance
  `Subtype.starOrderedRing` (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Range.lean`,
  line 285) with `𝕜 := ℂ` supplied by hand. If instance search already finds it once the
  `IsClosed` instances are in scope, both are padding and should be deleted; if `𝕜` is not
  inferred they are needed to state the headlines. The repair worker can decide by deleting them
  and elaborating.
- **V13b's Powers–Størmer carrier.** VonNeumannAlgebras V13b states the inequality "for positive
  L¹ elements"; this README consumes it for positive trace-class operators on `B(H)` (§2.4). The
  two agree if V13b's statement covers `(B(H), Tr)`, which its Følner criterion on `B(L²M)` needs
  but its text does not say explicitly.
- **Waived or uncertified sources**, cited by locator only: `connes1976` Theorem 5.1,
  `brown-ozawa2008` Ch. 6, `paulsen2002` Ch. 3, `pedersen2018` Ch. 3, `kirchberg1993` Theorem 7.5
  and Proposition 7.1 (the last as recorded at `brown2006` lines 1910–1913, which was checked).
- **Ownership against open pull requests** was checked through `roadmaps grep` at the indexed
  heads; none of the cited suppliers is among the 168 listed new-roadmap checkouts, and the open
  revision of VonNeumannAlgebras drops no cited id (overlap report).

## Source issues

- **Misprint** in brown2006 at Proposition 3.5.3, proof, printed page 30 (lines 1285–1287): the source says the projections cutting `π_γ` down to `π_{τ_i}` lie in the double commutant of `π_γ(A)` and that the extension restricts to `π_τ` on `A`; it should be the commutant of `π_γ(A)`, as in Lemma 3.5.2, and the restriction should be `π_γ`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e93daa8118ca8efae8044fbb5443c1227f7a552", "job": "RT-AmenableTracesOnCStarAlgebras~1a", "model": "fable", "worker": "chris-x20"} -->
