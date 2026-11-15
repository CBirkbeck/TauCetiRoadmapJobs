# Review of AInfCohomology (pull request #1044 at 52bf0f6)

**Verdict:** needs changes

## R01 (P3) — Backticked own names that `Suggested.lean` does not declare (previous R01, not repaired)

**Location:** `TauCetiRoadmap/AInfCohomology/README.md` line 523 "**Cyclotomic period elements** (`AInf.cyclotomic`)"; line 540 "- `AInf.cyclotomic_test_unit`: `ε=1` makes `μ=0`…"; the repaired paragraph, lines 890–891 "the names `Decalage.etaTerm`, … are aliases of that core".

**Claim:** these are this roadmap's Lean declarations. 680 distinct backticked names under `AInf.`, `Decalage.`, `BKF.`, `AOmega.`, `AInfSheaf.`, `Semistable.` and `CohomologicalBK.` head 246 targets and 444 API and Check bullets (135 of them labelled Checks), and appear in 13 inline mentions.

**Witness:** `Suggested.lean` declares 11 names and none of the 680. None of them exists at the pins either. `readme-ids-missing` passes only because it flags names prefixed by the Lean file's own namespace, `TauCetiRoadmap.AInfCohomology`.

**Repair:** make one mechanical pass. Delete `` (`<Name>`)`` after each target title. Turn `` - `<Name>`: <fact> `` into `- <fact>` in the API and Check bullets. Replace the inline alias sentences (lines 407, 438, 443, 890–891, 3539, 3873, 3893) and the docstring names at `Suggested.lean` lines 93, 116 and 124 by the target titles. Reword the Check at line 2057 so that it does not name the Lean carriers `PadicInt p → Padic p`. Line 540 becomes "- `ε=1` makes `μ=0` and does not give an admissible primitive root system."

## R02 (P3) — The description says the roadmap constructs `θ_r`

**Location:** pull request description, the paragraph after the summary block: "the finite Witt coefficient maps `θ_r` and `θ̃_r` and their kernels".

**Claim:** this roadmap constructs `θ_r`.

**Witness:** README lines 10–11 say "the shifted finite Witt coefficient maps `θ̃_r` from the supplied `θ_r`", and line 57 says "`θ_r` supplied by PerfectoidQuotients §0.2". PerfectoidQuotients README line 642, at its open head, defines `finiteFontaineTheta p R r`.

**Repair:** write "the shifted finite Witt coefficient maps `θ̃_r` from the `θ_r` supplied by PerfectoidQuotients §0.2, and their kernels". The paragraph then agrees word for word with the README Summary; this is its only difference from it.

## R03 (P3) — The description's validation sentence is contradicted by the README

**Location:** description: "Validation: … README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero".

**Claim:** the README has no identifiers absent from the Lean file and no Check labels.

**Witness:** the README has 680 backticked own names that are absent from `Suggested.lean`, and 135 labelled Check bullets, for example line 540 "- `AInf.cyclotomic_test_unit`: …" (R01).

**Repair:** R01's repair makes the sentence true as written. Without it, write "the gate's scanners report zero; the README still labels targets, API bullets and Checks with backticked names that `Suggested.lean` does not declare."

## R04 (P3) — The AI-assistance sentence describes the first commit only

**Location:** description: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** the red-team passes are still to come, and Codex is the only assistant.

**Witness:** the branch has ten "red-team repairs" commits (29598413 … 839809fc). Claude Fable 5.1 co-authored fadb6425 and 91b07196, Claude Opus 5.5 co-authored 52bf0f63, and Codex co-authored b47987ba.

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the restatement of `Suggested.lean`; ten red-team repair passes; Claude (Fable 5.1, Opus 5.5) for the supplier citations, the review's repairs and two rewordings."

## Previous findings

- R01 — not repaired: line 523 "**Cyclotomic period elements** (`AInf.cyclotomic`)" and line 540 "- `AInf.cyclotomic_test_unit`: …" are unchanged, and the repaired lines 890–891 keep `Decalage.etaTerm` and its siblings. Carried as R01.
- R02 — repaired: lines 892–894 read "inherited from its targets *Principal p-décalage on torsion-free complexes*, *Bockstein reduction of principal p-décalage* and *Derived p-décalage and completion*". All three are CrystallineCohomology CR.4.1 targets.
- R03 — repaired: lines 3003, 3040, 3131 and 3196 cite "DerivedDeRhamCohomology §PD.7", "§§PD.6–PD.7" or "§PD.6"; no "CR.0" remains.
- R04 — repaired: line 457 reads "Section 4.7 supplies, as the algebraization step of its Bloch–Kato–Hyodo construction, local algebraization of semistable formal charts", and the `*Needs:*` line at 2692 cites the same step.
- R05 — repaired: lines 274, 1790 and 1889 read `WittVector.FractionRing.frobeniusRingHom` (`Isocrystal.lean:84`). The old name `FractionRing.frobenius` (line 79, the automorphism) also exists, so R05's witness was wrong; both names are valid.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| *Log Hodge–Tate reduction*, reworded sketch (line 2933; CK Theorem 4.2) | p=2, p=3; `𝔛=Spf O_C` | `ξ̃=2+μ` (p=2), `3+3μ+μ²` (p=3), so `ξ̃≡p mod μ`; `θ̃(μ)=ζ_p−1`; `Spf O_C`: both sides `O_C` in degree 0 | holds; with θ for θ̃, `θ(μ)=0` and the décalage element degenerates | none |
| Projection formula input (Stacks 0944) | `K=O_C` over `A_inf` via θ̃ | Lemma 21.50.1 needs K perfect; `O_C=[A_inf →ξ̃ A_inf]` with ξ̃ a nonzerodivisor | hypothesis met | none |
| *Derived completeness and sheaf property of AΩ* (sample; uses the sketch) | `Spf O_C`; torus, `X^n`-summand | global sections `A_inf` in degree 0; H¹ summand `A_inf/(1+[ε]+…+[ε]^{n−1})`; n=0 gives `A_inf` | matches CK Remark 4.5 and Corollary 4.6, p.26 | none |
| Chain rule for (6.5.5)–(6.5.6), reworded (line 3541) | node chart `X₀X₁=p^q`; repeated value | `f(X₀)=[p^♭]^q/X_t`: `D′_t f(X₀)=−f(X₀)=f(D₁X₀)`; two occurrences of value a give `2f`, one-occurrence model gives `f` | sum over occurrences is required, as stated | none |
| Envelope step (Stacks 07GM) | generator p at p=2; nilpotent z | `v₂(4/2)=1`, `v₂(16/24)=1`, generally `v_p(pⁿ/n!)≥1`; `z^m/m!` nilpotent, hence power-bounded; `(D)°` torsion-free gives uniqueness | holds | none |
| `A_cris⁰` as envelope of `A_inf→O_C/p` (lines 3003, 3131, 3196) | DerivedDeRhamCohomology §PD.7(b),(c) | kernel `(ξ,p)`; envelope `A_inf[ξⁿ/n!]`; `ξ^p/p!` in it, so `ξ^p∈p·envelope`; `O_C` p-torsion-free, so the trivial-base envelope agrees | owner and statement match | none |
| Principal p-décalage aliases; sampled *Cycles of principal décalage*, *Boundaries after division* | `C=[ℤ →4 ℤ]`, f=2 | `E⁰=ℤ`, δ=2; `Z¹(E)=ℤ=Z¹(C)`; `B¹(E)=2ℤ={z: 2z∈4ℤ}`; `H¹(E)=ℤ/2=(ℤ/4)/(ℤ/4)[2]` | matches BMS1 Lemma 6.4, proof, p.50 | none |
| *Algebraization and descent of semistable charts* (line 2692) | chart `xy=p^{1/2}` | descends to `O_K`, `K=W(k̄)[1/p](√p)`, e=2; ClassicalAdicEtaleCohomology's §4.7 step works over such finite `O_K` | the citation of the step is accurate | none |
| *Isocrystal origin of analytic annulus Frobenius modules* (line 1790) | `k=𝔽̄_p`; rank one | φ fixes `ℚ_p⊂K(p,k)`; `StandardOneDimIsocrystal m` has `Φ=p^m·φ`, slope m; Mathlib classifies rank one only | name and scope correct | none |
| Check labelled `AInf.cyclotomic_test_unit` (R01) | ε=1 | `μ=[1]−1=0`; `untilt(1^{1/p})=1`, not primitive for p≥2 | the Check is true; only its label is a defect | R01 |
| Owner of `θ_r` (R02) | r=1, r=2 | `W_1(O_C)=O_C`, so `θ_1=θ`; restriction of `θ_2` is `θ_1`; `θ̃_r=θ_r∘φ^{−r}` is built here | supplier is PerfectoidQuotients §0.2 | R02 |

The previous review's rows for untouched statements stand as in the review of `b47987b`. They cover the conventions witness, the six `Suggested.lean` theorems, and the décalage, BKF, AΩ, semistable and trace rows. `Suggested.lean` is unchanged since then.

- Gate: my run of the gate against `origin/main` passes every scanner and the dependency check, and the worker's gate with the targeted build passes. `lake env lean` on `Suggested.lean` gives six `declaration uses sorry` warnings (lines 79, 87, 96, 113, 118, 127) and nothing else. Nothing is changed outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2218 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The change adds and drops no supplier: DerivedDeRhamCohomology, already a supplier, replaces a CrystallineCohomology layer that does not exist.
- Source locators checked against the text (7): ck lines 984–996 (Theorem 4.2 and proof, p.25), 1024–1045 (Remark 4.5, Corollary 4.6, p.26) and 2807–2903 (§6.5, pp.64–65); Stacks 0944 (Lemma 21.50.1) and 07GM (Lemma 23.2.2); bms1 lines 2366–2377 (Lemma 6.4, proof, p.50); Gabber–Ramero arXiv v3, Claim 7.3.14 (line 9849, p.203).
- Library declarations opened: `WittVector.FractionRing.frobenius` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:79`), `FractionRing.frobeniusRingHom` (84), `StandardOneDimIsocrystal` (157) and `isocrystal_classification` (180; algebraically closed `k`, rank one).
- Cross-roadmap citations resolved (7): CrystallineCohomology CR.4.1, three titles (lines 3651, 4026, 4056 at its open head); DerivedDeRhamCohomology §PD.6 (2225) and §PD.7 (2857); ClassicalAdicEtaleCohomology §4.7 (2618, algebraization step at 2681); PerfectoidQuotients §0.2 (618, `finiteFontaineTheta` at 642).
- Overlap check: read PrismaticCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, CohomologyComparisons, CrystallineCohomology, PerfectoidSpaces and EnhancedDerivedSheaves. Principal p-décalage is owned by CrystallineCohomology CR.4.1 and cited. The `A_cris⁰` envelope is owned by DerivedDeRhamCohomology §PD.7 and cited. Semistable chart algebraization over `O_C` is owned here; ClassicalAdicEtaleCohomology has it only over a finite discretely valued base. No dropped ids, and no other pull request changes this roadmap.
- Source independence: changed passages only. 5 passages compared with 3 sources (ck, Stacks, bms1): lines 2933, 3541, 890–894, 455–458 and 2692. The longest shared run is 7 words, at line 3541 against ck line 2846 ("independent of λ₀ and compatible as n varies"), which the mathematics forces. Largest share: ČK, 332 of 666 parenthesised locators. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Huber 3.5.1 (line 3541) and Tsuji A2.8 (line 3131): their locators are unchanged by the rewording, and I did not open them. The previous review's list for untouched targets stands.
- Ownership against open pull requests that the brief does not list with their files was not checked.

## Source issues

- none

## For the human reviewers

- none
