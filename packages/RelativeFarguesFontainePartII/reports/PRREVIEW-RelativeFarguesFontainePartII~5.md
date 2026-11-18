# Review of RelativeFarguesFontainePartII (pull request #1825 at 509eca1)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 92 lines changed since f4f1d10 finds all seven earlier points repaired and no new finding. The descent of §§9.3–9.4 now avoids radius 0 with a correct witness, §8.4 imports the Fréchet–Stein theory from its owner on main, the A[1/p] non-Bézout headline is stated and is not closed by one tactic, and the Lubin–Tate contract asks only for what the supplier lacks. One format note, not blocking; three bullets are left for the human reviewers.

## N01 — "Their specializations" has lost its antecedent in the ownership paragraph

In "Scope and ownership" (README line 2184) the sentence "Their specializations supply integral period geometry and Berkovich arithmetic." now follows the sentence on the imported Fréchet–Stein theory, so "Their" reads as that theory and D(H,L). It would read correctly directly after "…and the analytic-field differential criterion to §11.2 here."

## Previous findings

- R01 — repaired: §9.3 reads "For I compact in (0,1) with endpoints in |F×|"; §9.4 "For every I ⊆ (0,1) … continuous for its Banach norm"; §9.2 keeps 0 for invariants only; the new Check gives the witness at I={0}.
- R02 — repaired: §8.4 reads "are LocallyAnalyticDistributionsPartII §1.4 (ST02, §3, pp. 7–11), and are not restated"; the general API and Checks are gone; the supplier subsection and the Needs lines of §§8.4, 8.6, 8.7 are added.
- R03 — repaired: `not_isBezout_wittVector_preTilt_padicComplexInt_invert_p` is stated (`Suggested.lean` line 66), named in §11.1; the docstring entry reads "lacks B⁺; the A[1/p] assertion is stated"; "four native-carrier headlines".
- R04 — repaired: the contract asks, "for E of characteristic p", only for convergence of the §3.2 logarithm on the open unit disc, its O_E-linearity and the limit formula; LT.1, LT.2 and §3.2 are used as the supplier states them.
- R05 — repaired: `IsBezout.tfae` (line 55), `PreTilt` 623, `IsAlgClosure` 280 with its torsion-free instance, 504, 166/183/196, 112, 229/279, 43/105/358, 112: each opened at the pins and agreeing.
- R06 — repaired: the FF17 entry ends "Locators written "Préface" refer to the preface of this volume, *La courbe de Fargues et Fontaine*, by Pierre Colmez."
- R07 — repaired: the description reads "Layers are ordered by what the final theorems need; statements carry locators into Fargues–Fontaine, Berger, Kedlaya–Temkin or Poonen."

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §9.3 descent, I⊆(0,1) | I={ρ}, c∈C×, u=σ(c)/c with norm of u−1 at most δ | [u]−1 has coordinates of norm ≤δ^(1/p^n); ρ-norm ≤max(δ^(1/p^N),ρ^(N+1))→0: the unit-twist object is continuous | true away from 0 | none |
| §9.3 new Check, I={0} | F not algebraically closed, c∈C∖Fbar, σ∈G_L with σ(c)≠c | zeroth coordinate σ(c)−c≠0, v_π=0, norm q⁰=1 for every such σ; F algebraically closed: G_F trivial, no witness | Check true; hypothesis needed | none |
| §9.4, I⊆(0,1) | I=(0,1), consumer §10.6; J={q^(−√2)} | B=B_(0,1) is covered; no value-group subinterval of J, enclosing K⊆(0,1) exists | consistent with §9.3 | none |
| §8.4 B_I is Fréchet–Stein | I={ρ}; I=(0,ρ]; quotient B_J→B_J/(ξ); radius 1 | constant sequence; injective map of domains over a PID, torsion-free hence flat; the quotient has torsion, not flat; raw norm of π at 1 is 1, excluded | true; supplier §1.4 states the imported theory over any complete field | none |
| §11.1, `not_isBezout_wittVector_preTilt_padicComplexInt_invert_p` | β_j↓√2; β_j↓1; zero ring | v(h mod p)=√2∉ℚ; rational limit: no contradiction; A is p-torsion-free so A[1/p]≠0 and the negation is not false by collapse | true by Berger08 Remark 1.1.3 for W(Ẽ⁺)[1/p] | none |
| Lubin–Tate contract, §6.9 | Q=πX+X^q, q=2, norm of x equal to 2^(−1/2) | c_i=c_(i−1)/(π−π^(q^i)), norm q^i; terms 1, 1, 1/2, 1/16→0; π⁻²[π²] has x^q-coefficient π⁻¹+π^(q−2), matching c₁ to second order | supplier lacks only convergence in characteristic p | none |
| §6.9 limit formula (seeded sample) | derivative at 0 | π^(−n)[π^n] has derivative 1; FF17 Prop. 6.3.1 states the limit, p. 253 gives Π(u_ε)=log([ε]_Q) | true ("up to E×" is weaker) | none |

The rows for the untouched statements stand as in the previous review, of `f4f1d10`.

- Source locators read at the text: 6 (FF17 §11.2.1, printed p. 369, FF17 lines 14599–14615; Proposition 11.2.18, p. 376, lines 14907–14913; Proposition 6.3.1, p. 251, line 10183; Remark 6.3.2, p. 252, line 10234; the comparison on p. 253, lines 10252–10258; Berger08 Remark 1.1.3, p. 96, lines 428–441, with the definition of ~B⁺ at line 370). All support the statements as written.
- Library declarations opened at the pins: 15 (the thirteen corrected lines of R05, `IsBezout` at `Mathlib/RingTheory/PrincipalIdealDomain.lean` line 65, the deprecated alias at `Mathlib/RingTheory/Bezout.lean` line 82). No declaration of either pinned library states that a Witt-vector localization is not Bézout.
- Cross-roadmap citations resolved: LocallyAnalyticDistributionsPartII §1.4 on main (README lines 196–214: the definition, independence, Theorems A and B, A_n⊗_AΓ(M)≅M_n, the abelian category, over any complete nonarchimedean field); LubinTateFormalModulesAndQuasiCanonicalLifts at its open head: §0.3 (line 331, K/ℚ_p finite), §1.3 (line 494, Check at line 527 for 𝔽_q[[t]]), §2.2 (line 665, Layer 2 in either characteristic, line 574), §3.2 (line 969, the unique strict logarithm in either characteristic). All as cited.
- Dependency check: `depcheck: 217 roadmaps, 2357 edges, 0 problem(s)`; no UPWARD or CYCLE line. LocallyAnalyticDistributionsPartII and LubinTateFormalModulesAndQuasiCanonicalLifts both precede this roadmap in the merge order.
- Automatic checks on this head: every check passed. Files changed outside the folder: none.
- Elaboration: `lake env lean` gives four `sorry` warnings (lines 66, 74, 96, 111) and nothing else. `#check @not_isBezout_wittVector_preTilt_padicComplexInt_invert_p` gives `∀ (p : ℕ) [Fact (Nat.Prime p)], ¬IsBezout (Localization.Away ↑p)`, the generality of §11.1 (E=ℚ_p, F=ℂ_p^♭); no binder lost. The probe with `simp`, `rfl`, `infer_instance`, `exact?` and `exact IsBezout.of_isPrincipalIdealRing _` does not close it: no padding. No other roadmap, open or on main, declares the name or states the result.
- Pull request text against the head: "four headline theorems", "seventeen headlines" (17 docstring entries counted), the three files, descent avoiding radius 0, the Fréchet–Stein import, the Lubin–Tate contract and the five other contracts all agree with the head; nothing contradicted or left unstated.
- Internal consumers of the changed statements: §9.4 (Needs §9.3) and §10.6 (Needs §9.4, for B=B_(0,1)); neither uses an interval containing 0.

Overlap check: read RelativeFarguesFontaine, VectorBundlesAndIsocrystals, CstConjectureForDaggerVarieties, VectorBundlesAndIsocrystalsPartII, ProetaleCohomologyOfPAdicCurvesAndTowers, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology as in the previous review; the changed passages share nothing with them. The general Fréchet–Stein and coadmissible-module theory, shared with LocallyAnalyticDistributionsPartII, now has one owner: that roadmap's §1.4 on main, cited from §§8.4, 8.6, 8.7.

Source independence: changed passages only; 4 passages compared with 2 sources (FF17, Berger08), none shared; largest share FF17, as in the previous review (108 of 113 locator lines there; the change removes one ST02 locator line and no FF17 line); the diff adds, removes or reorders no layer, so the contents were not compared again: independent, as found at f4f1d10.

Research link: Layers 0–10 are the function theory of the curve of Fargues–Fontaine (2017 author copy; Astérisque 406, 2018), on which the classification of vector bundles and p-adic Hodge theory on the curve rest; Layer 11 states Kedlaya–Temkin 2016, Theorems 1.2–1.3, and Poonen 1993, Theorem 2. Rests on the README's References and the sources read.

## Not verifiable

- none

## Source issues

- **Gap** in FF17 at Proposition 11.2.18, printed p. 376: the source says the semilinear action is continuous, with 0 allowed in I and no topology named; it should name a topology in which G_F acts continuously at radius 0, such as the weak one; affects a stated result.

## For the human reviewers

- Licence: FF17 is cited from the authors' public copy of 16 April 2017, a precursor of Astérisque 406 (2018); the README's FF17 reference says its numbering is not identified with the published one. It carries most of the locator lines.
- Shape: "Scope and ownership" and "Exact supplier contracts" stand after "Worked examples" (README lines 2176 and 2188); roadmaps on main written earlier place them before the layers.
- Declared gap: the Lubin–Tate contract in the README (line 2242) is now narrower than the sentence declared for it in the package plan (formal module, Tate module and logarithm over every local field); the plan's sentence was not changed in this folder.
