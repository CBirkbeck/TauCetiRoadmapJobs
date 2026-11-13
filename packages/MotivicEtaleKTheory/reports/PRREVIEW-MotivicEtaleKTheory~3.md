# Review of MotivicEtaleKTheory (pull request #1470 at d1c5de6)

**Verdict:** needs changes

Incremental re-review of the 9 lines changed since 8d34493. Both previous findings are repaired and the roadmap folder has no finding; the one finding below is in the pull request's description.

## R01 (P3) — the description still lists ResolutionOfSingularitiesCharacteristicZero as an open supplier

**Location:** pull request description, Dependencies paragraph: "In open pull requests of ours, direct suppliers: #1212 (GeneralAlgebraicKTheory), #1199 (ResolutionOfSingularitiesCharacteristicZero), #1229 (SchemeKTheoryOperations), …".

**Claim:** ResolutionOfSingularitiesCharacteristicZero is a supplier still in an open pull request.

**Witness:** This head merges main, which contains `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/` (commit 257ba838 on main; absent from the tree at 8d34493). The generated depends-on block already ticks #1199.

**Repair:** "In open pull requests of ours, direct suppliers: #1212 (GeneralAlgebraicKTheory), #1229 (SchemeKTheoryOperations), #848 (ComplexComparisonPartII), #1281 (KTheoryFiniteLocalFields), #1313 (MotivesAndAlgebraicCycles); the other open pull requests in the merge-order block below are their transitive prerequisites. Roadmaps on main, ResolutionOfSingularitiesCharacteristicZero among them, are cited by name; …"

## Previous findings

- R01 — repaired: line 654 now proves the condition on a simplicial divisor `D_•⊂Y_•`: supported class `cl(D_•)∈H²_(D_•)(Y_•,Γ(1))`, deformation to the normal cone `M_•`, term-wise purity and the simplicial spectral sequence; the `B·𝔾_m` Check is added.
- R02 — repaired: "the purity map H_Dᵏ(D,ℝ(i))→H_D,Dᵏ⁺²(Y,ℝ(i+1)), which sends 1 to §5.2’s supported class of D, is an isomorphism"; `ι_*` and "inverse" no longer occur in the README.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.1 local model of `M_p` | `D={t=0}⊂Y`, `M={su=t}⊂Y×𝔸²` | differential `u ds+s du−dt`: nonzero on `t=0` (dt≠0 on smooth D) and on `t≠0` (u≠0); smooth | as stated | none |
| §7.1 fibres of `M_•` | s=1, s=0 | s=1: `u=t`, so `(Y,D)`; s=0: `t=0`, u free, so `N_D` with zero section `u=0`; `{u=0}=D×𝔸¹_s` | as stated | none |
| §7.1 agreement with SchemeAndStackFoundations §5.5 | supplier: fibre Y over 0, cone over ∞ of ℙ¹ | removing the fibre over 0 and setting s=1/coordinate puts the cone at s=0 and Y at s=1; chart `t=su` of the blow-up | same object | none |
| §7.1 `M_•` simplicial | structure map `Y_p→Y_q` with `D_p` the inverse image of `D_q` | `t_q↦t_p` is a local equation, so `{su=t_q}` pulls back to `{su=t_p}`; no flatness needed | as stated | none |
| §7.1 class `e=p*a∪cl(D_•×𝔸¹)` | restriction to s=1 and s=0 | s=1: p is the identity, value `a∪cl(D_•)`; s=0: p factors `N→D→Y`, `p*a=π*ι*a=0` | as stated | none |
| §7.1 term-wise restriction | `(M_p,D_p×𝔸¹)→(N_p,D_p)`, all k,i | purity: `H^(k−2)_D(D_p×𝔸¹,ℝ(i−1))→H^(k−2)_D(D_p,ℝ(i−1))`, restriction to the zero section, iso by 𝔸¹-invariance; square cartesian, both divisors of codimension 1 | iso | none |
| §7.1 spectral sequence | `E₁^(p,q)=H^q_(D_p×𝔸¹)(M_p,Γ(i))` | `D_log(·,i)` is zero in degrees <0 for every i (degree n<2i uses forms of degree n−1≥0), so `E₁^(p,q)=0` for q<0: first quadrant, convergent | iso on `M_•`; only injectivity is used | none |
| §7.1 purity direction (previous R02) | {0}⊂𝔸¹, k=i=0 | map `H⁰_D(pt,ℝ(0))=ℝ→H²_(D,{0})(𝔸¹,ℝ(1))=ℝ`, 1↦class of 0; forgetting support lands in `H²_D(𝔸¹,ℝ(1))=0=c₁(O(0))` | as stated | none |
| §7.1 Check on `B·𝔾_m` | total degree 2 | `E₁^(2,0)`: `H⁰_D(·,ℝ(1))=ker(iℝ→ℂ)=0`; `E₁^(0,2)=H²_D(pt,ℝ(1))=0`; `E₁^(1,1)=ℝ·1⊕ℝ·log|z|`; d(c)=c, d(log|z|)=log|z₁|−log|z₁z₂|+log|z₂|=0; `E₂^(1,1)=ℝ`; `E₂^(3,0)=0` so it survives | `H²=ℝ`, as stated | none |
| §7.1 Check, term-wise restriction | terms `𝔾_m^k` | universal bundle is trivial on each term, `c₁=0`; class of transition function z is `log|z|≠0` | as stated | none |
| Contract sentence for SchemeKTheoryOperations §7.3a | supplier text at its open head | divisor condition there: `ι:D_•→Y_•` simplicial, `D_p` the inverse image of `D_q`, `ι*a=0 ⇒ a∪c₁(O(D_•))=0` | "stated for simplicial divisors" is accurate | none |
| Library pins and line numbers | all 19 cited declarations | manifest: Mathlib 1b1ccf4, Tau Ceti 2fd255d; each declaration is at its cited line (ModuleCat :59, gradedCochainComplex :69, tate/tate_F/tate_piece :93/:102/:113, the rest unchanged) | as cited | none |

Rows for untouched statements stand as in the previous review, of 8d34493.

- Source locators read at the text: 3 (BKK line 1379–1383, BKK line 4334–4338, WeibelKBook line 27688–27808); each supports what it is cited for. The simplicial argument is the roadmap's own proof route; its inputs are §§3.2, 3.4, 5.1–5.2 here and SchemeAndStackFoundations §5.5, all in the section's Needs line.
- Library declarations opened at the pins: 19, all at the cited file and line (listed in the last table row).
- Cross-roadmap citations resolved: SchemeKTheoryOperations §7.3a at its open head (divisor condition, Gysin criterion still present, Check on `B_•(ℤ/2)`); SchemeAndStackFoundations §5.5 on main (`deformationToNormalCone`, README line 8180).
- Gate at d1c5de6: every check 0, `OK`. Dependency check: `depcheck: 235 roadmaps, 2115 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: SchemeKTheoryOperations 37, KTheoryFiniteLocalFields 90, MotivesAndAlgebraicCycles 91, this roadmap 138.
- `lake env lean` on `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean`: exit 0, no output. The file is unchanged and declares nothing, so no `#check @name` comparison and no one-tactic probe applies.
- Outside-folder diff against `origin/main`: empty (the files listed as changed since 8d34493 come from the merge of main).
- Overlap check: read SchemeKTheoryOperations, KTheoryFiniteLocalFields, MotivesAndAlgebraicCycles (the cited sections); Polylogarithms and BorelRegulators as in the previous review. Chern classes of a theory: owner SchemeKTheoryOperations §7.3a. Deformation to the normal cone: owner SchemeAndStackFoundations §5.5, cited. The two conditions for real Deligne cohomology: this roadmap §7.1; no other roadmap states them.
- Source independence: changed passages only; 3 passages compared with 2 sources (WeibelKBook, BKK), none shared; largest share BF, 74 of 223 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Bloch86 §7 and Beilinson85 §§1–2: uncertified in the manifest, cited by locator only.
- Levine98: waived; certifies nothing here.
- The sources SchemeKTheoryOperations §7.3a cites for the simplicial divisor condition (Schneider, Jannsen) are that roadmap's; they were not read here.

## Source issues

- none

## For the human reviewers

- none
