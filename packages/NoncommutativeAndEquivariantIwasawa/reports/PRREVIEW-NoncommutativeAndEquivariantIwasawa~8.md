# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 77cb9a8)

**Verdict:** needs changes

This is an incremental re-review of the 20 lines changed since `a638121` (README only; `Suggested.lean` unchanged), together with the pull request's title and description. It has two findings. R01 is a supplier citation in the rewritten §7.15 step 3 that does not cover the coefficients the step uses. R02 is two of the four extended *Needs:* lines, which still omit inputs their sections use.

## R01 (P2) — §7.15 step 3 cites complex constants for a `Q̄_p`-valued ε, with no transfer

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:4109`: "Use the Weil local constants of ClassicalArithmeticCompletion §7.12b, with the raw parameter of §F.6." The same applies to README:4134: "ClassicalArithmeticCompletion §7.12b (Weil local constants)".

**Claim:** §7.12b constructs `ε_F(V,ψ,dx)` only for complex Weil representations and `ℂ`-valued `ψ`. §7.15 needs `ε_L(D_pst(V),ψ_p,dx) ∈ (Q̄_p⊗L)^×` with `ψ_p : ℚ_p → Q̄_p^×` (README:4099). No layer or supplier transfers the constants to these coefficients, and ArithmeticGaloisRepresentations §2.7 is complex as well.

**Witness:** At `p=3`, take `η₀` quadratic of conductor 3. LVZ Prop. 2.3.3 (`lvz line 197`, p. 4) gives `ξ₁−ξ₁² ∈ ℚ₃(μ₃)`, and `lvz line 141` sets the constants over a characteristic-0 field `E ⊇ μ_{p^∞}`. CAC (main README:14111) works with "smooth complex Weil representations", and §7.12a's Check gives `−i√3 ∈ ℂ`.

**Repair:** In README:4109, replace that sentence by: "Apply the Weil local constants of ClassicalArithmeticCompletion §7.12b to the Weil-group part of §F.6's raw parameter, transported to `Q̄_p` coefficients: for a field isomorphism `ι : Q̄_p ≅ ℂ`, put `ε_L(D,ψ_p,dx) = ι⁻¹ ε(ι_*D, ι∘ψ_p, dx)` componentwise over the embeddings `L → Q̄_p`. This does not depend on `ι`: when `vol_dx(ℤ_p)=1`, `σ(ε(D,ψ,dx)) = ε(σ_*D, σ∘ψ, dx)` for every automorphism `σ` of `ℂ`, in rank one by §7.12a's finite-sum formula and in general by §7.12b's uniqueness (LVZ §2.3, p. 3)." Add a Check: for `p=3` and `η₀` quadratic of conductor 3 the value is `ξ₁−ξ₁²`, and both `ι(ξ₁)=e^{∓2πi/3}` return it (`∓i√3` under `ψ(±x)`).

## R02 (P3) — Two of the extended *Needs:* lines still omit inputs their sections use

**Location:** README:2433 (§5.5): "… artinLValue of the Layer 5 introduction (the values `L_Σ(ρ, 1 − r)`)". README:2679 (§6.4): "… artinLValue_induction of the Layer 5 introduction …; TauCetiRoadmap ClassicalArithmeticCompletion §7.63."

**Claim:** §5.5's API bullet at README:2422 ("MC for `F_∞/F` gives MC for `F_∞/F′` … (norms; induction of characters)") needs the transfer evaluation of §3.14 and inductivity of `L_Σ`, and the line lists neither. §6.4's step 3 (README:2673) uses Brauer's induction theorem, and README:113 also assigns Brauer induction to §6.4, but the line omits it.

**Witness:** Take `F=ℚ`, `F′=ℚ(√5)`, `Σ={5}`, `ρ′=1` at `s=−1`. Then `L_Σ(1⊕χ₅,−1) = (1/3)(−2/5) = −2/15` and `L_{Σ_{F′}}(1,−1) = (1/30)(−4) = −2/15`; they are equal only by artinLValue_induction. Brauer induction is Tau Ceti `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (`Brauer/Induction.lean:127`).

**Repair:** README:2433: replace "artinLValue of the Layer 5 introduction (the values `L_Σ(ρ, 1 − r)`)" by "artinLValue and artinLValue_induction of the Layer 5 introduction (the values `L_Σ(ρ, 1 − r)` and their inductivity, for the passage to `F′`); [3.14](#314-functoriality-and-induction-of-artin-evaluation) (Functoriality and induction of Artin evaluation)". README:2679: insert "RepresentationTheory/InductionRestriction Layer 6 (Brauer's induction theorem, step 3); " before "TauCetiRoadmap ClassicalArithmeticCompletion §7.63".

## Previous findings

- R01 — repaired: README:127 now reads "These results are used, directly or through the finite-Hecke/Artin and Dedekind comparisons below, by the Layer 5 introduction (artinLValue and artinLValue_induction, which §§5.5–5.8 and Layer 6 use) and by §§5.7, 6.1, 6.17–6.18, 7.11–7.12 and 7.15." The description matches it.
- R02 — repaired: "local-constant contract" has 0 hits. README:24 cites "§7.12b and §§7.13, 7.30", README:4109 and 4134 cite §7.12b, README:4390 cites "§§7.12b–7.12c", and README:4553 cites "Layer 7, including §§7.12a–7.12c". The §7.12b citation is complex-only (R01).
- R03 — repaired: README:2728 now lists "[6.1](#61-the-main-conjecture-for-abelian--prime-to-p-galois-groups) (the orbit set `I_{ℚ_p}(C_n)` and the idempotents `e_[χ]`)".

## Verified sound

| Statement | Instances tried | Values on the compared sides | Result / change |
|---|---|---|---|
| Use-sentence README:127 and the description's list | Sections whose own *Needs:* names CAC §7.12x or a comparison | 5.7 (2486), 6.1 (2619), 6.17 (3055), 6.18 (3079), 7.11 (3940), 7.12 (3962), 7.15 (4134), plus Layer 5 intro (2307). Equals the sentence's list | Match. §7.13 consumes `L^*_S(1,ρ)` through §7.11; the list does not claim to be exhaustive. |
| §5.5 *Needs:* and API bullet README:2422 | `F=ℚ`, `F′=ℚ(√5)`, `Σ={5}`, `ρ′=1`, `s=−1` | `ζ(−1)(1−5)=1/3` and `L(χ₅,−1)=−2/5`, product `−2/15`; `ζ_{F′}(−1)(1−5)=(1/30)(−4)=−2/15` | Equal by inductivity only: R02. |
| §6.4 step 3 and *Needs:* | `S₃` at `(e,(12),(123))` | `Ind_{C₂}1 = (3,1,0)` and `Ind_{C₃}χ = (2,0,−1)`; the difference `(1,1,1) = 1_{S₃}` needs induced characters (Brauer) | Brauer input missing from the line: R02. |
| §6.6 *Needs:* (R03 repair) | `p=5`, `C₃`, trivial action | `5≡2 mod 3`, so the orbits are `{1}` and `{χ,χ²}`; `ℤ₅[C₃]≅ℤ₅×ℤ₅[ζ₃]`, ranks `1+2=3`; `e_[χ]` from §6.1, which is now listed | Match. |
| §6.11 *Needs:* (adds §3.11) | `G=ℤ_p×C_p`, `g` of order `p` | `log g = p⁻¹ log(g^p) = 0` although `g ≠ 1` in `K′₁` (§3.11's quotient); step 4 uses §3.11's Whitehead inputs | Addition justified. CPT II Lemma 2.2(b), `κ_I(1+I)=K₁(S,I)` (`cpt2 line 246`, p. 7). |
| §7.15 ε, README:4109 | `V=ℚ_p(1)`; `p=3` with `η₀` quadratic of conductor 3 | Unramified with `ν=0` and `vol=1`, so `ε=1` on both sides. Ramified: `ξ₁−ξ₁² ∈ ℚ₃(μ₃)` against `−i√3 ∈ ℂ`; `ι(ξ₁)=e^{−2πi/3}` maps one to the other | The values agree, but the transfer is not stated: R01. |
| §7.15 weight, LVZ §2.4 | `ℚ_p(1)` | `n(r)=dim gr^{−r}D_dR`, so `w=Σ r n(r) = −Σ j h(j) = −t_H`; for `ℚ_p(1)`, `t_H=−1` and the comparison is multiplied by `t¹` (`lvz line 252`, 273) | Match with README:4109 and the Check at 4123. |
| README:24, 4134, 4390: reciprocity convention | CAC §7.12b (main 14111) against §7.15 step 3 | Both send a uniformizer to geometric Frobenius (`Art_F` inverse, `rec_geo(p)=Frob_geom`) | Match. |

The rows for untouched statements stand as in the previous review, of `a638121`.

- Source locators checked against the text: 3. They are LVZ (arXiv v1) §2.3, Props. 2.3.2–2.3.3, p. 4 (`lvz line 186`, 197); LVZ §2.4, pp. 5–6 (`lvz line 249`–276); and CPT II (arXiv:1303.5337v3) Lemmas 2.1–2.2, pp. 6–7 (`cpt2 line 221`, 246).
- Seeded sample: none of the fifteen sampled targets lies in a changed passage, so they were not re-certified this round.
- Library declarations opened: 1. Tau Ceti `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (`TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:127`) requires an algebraically closed field of characteristic 0.
- Cross-roadmap citations resolved: 6, all at main `3cf7342`: ClassicalArithmeticCompletion §§7.12a, 7.12b, 7.12c, 7.13 and 7.30 (its README:14065, 14109, 14137, 14159, 14582), and SR.5.2, which has no ε-factors. ArithmeticGaloisRepresentations §2.7 (open; not citable) uses `ψ : K → ℂ^×`. No roadmap on main or at an open head owns `Q̄_p`-valued local constants.
- Gate rerun at this head: every counter 0, `OK`, and nothing outside the folder differs from `origin/main`. Dependency check: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/Suggested.lean` gives seven `sorry` warnings (lines 80, 87, 109, 152, 162, 182, 197) and nothing else. The file is unchanged since `a638121`, so the signature and padding results stand.
- Pull request text checked against this head:
  - The title matches the H1.
  - The summary block holds: `completedGroupAlgebra` and `OreLocalization.OreSet` are used in `Suggested.lean`.
  - The prose holds: three files, seven sorried theorems, and the §7.12a–7.12c use-list identical to README:127.
  - The AI-assistance sentence matches the commit trailers (Claude Fable 5.1, Claude Opus 5.5, Codex).
- Remarks on untouched text (no change asked): §6.4 step 3 (README:2673) calls Brauer induction "Tau Ceti InductionRestriction Layer 6", whereas README:38 places it in TauCetiRoadmap RepresentationTheory/InductionRestriction. §6.6 step 1 says "No induction theorem is used", while README:113 lists §6.6 among the users of Artin/Brauer induction.

Overlap check: read SelmerIwasawaCohomology, IntegralIwasawaTheory, IntegralIwasawaTheoryPartII, EulerSystemsAndKolyvaginSystems, PadicFamilies, PadicMeasuresIwasawaAlgebras and ClassicalArithmeticCompletion for the objects of the changed passages (local constants, finite-image Artin functions, inductivity of Artin values, Brauer induction). Only ClassicalArithmeticCompletion §§7.12a–7.12c (on main) shares them; it owns the complex constants and Artin functions, which are imported here. Brauer induction is Tau Ceti's and InductionRestriction Layer 6's. Nothing else is shared.

Source independence: changed passages only. 4 passages were compared with 2 sources: the §7.15 step-3 sentence and Source line against `lvz line 141`–276, the §6.11 CPT II gloss against `cpt2 line 246`–252, and the README:125–127 summary, which paraphrases a roadmap on main. No more than three consecutive words are shared ("the Weil group", which is forced). Contents were not compared again: the change adds, removes or reorders no layer.

## Not verifiable

- Deligne (1973), §3.12(A)–(D), Theorem 4.1 and §8.12, cited at README:131: the locators are unchanged and the text (Springer LNM 349) was not read.

## Source issues

- none

## For the human reviewers

- none
