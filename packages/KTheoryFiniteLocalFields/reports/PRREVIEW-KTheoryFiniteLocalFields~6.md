# Review of KTheoryFiniteLocalFields (pull request #1281 at 0bca594)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` lines 686, 775, 787, 803–805, 826, 958, 1136, 1184 and 1770 now give the HM03 version’s page ranges; Proposition 4.4.3 p.73 is the correct general differential citation.
- R02 — repaired: `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` line 1767 adds Milne v4.03, Remark III.4.5 p.114, identifies the transposed inputs, and explains exponent change by raising a chosen root to the appropriate power.

## Verified sound

| Statement | Instances | Left-side values | Right-side values | Result; change |
|---|---|---|---|---|
| §3.1 exponent change; new Milne reference | ℚ₅, (5,2), m=4, d=2; d=1 | Quadratic symbol −1; degree-one symbol 1 | ω(2)²=−1; ω(2)⁴=1; transposed ω(3)²=−1 | Agree; reference added |
| §4.1 classical model | Zero linear Waldhausen category; every finite cyclic subgroup | T(0) fixed-point homotopy groups: 0 in every degree | Cyclotomic comparison: 0→0, an isomorphism | Agree; §§1.1–1.2 pages corrected |
| §4.5 Tate differential | C₃, T=THH(𝔽₃)/3; ε, σ | d²(ε)=tσ; d²(σ)=0 | t·d(ε)=tσ; t·d(σ)=0 | Agree; Proposition 4.4.3 p.73 |
| §4.6 natural-isomorphism homotopy | Identity transformation of identity functor on finite-dimensional 𝔽₃-vector spaces | Initial endpoint on rank-one K₀ class: 1 | Final endpoint on rank-one K₀ class: 1 | Agree; Lemma 1.3.3 p.16 |
| §4.8 logarithmic DVR spectrum | A=ℤ₃, K=ℚ₃ | π₀logTHH=ℤ₃; π₋₁logTHH=0 | Localization: coker(𝔽₃→ℤ₃)=ℤ₃; negative groups 0 | Agree; pp.27–28,39 |
| §5.1 perfect-field TC | k=𝔽₃ and algebraic closure of 𝔽₃ | (TC₀,TC₋₁)=(ℤ₃,ℤ₃), (ℤ₃,0) | (ker(1−F),coker(1−F))=(ℤ₃,ℤ₃), (ℤ₃,0) | Agree; pp.72–73 |
| §5.5 homotopy-orbit Witt sequence | R=𝔽₃, trivial log structure, n=2, i=0 | im(N)=im(V)={0,3,6} in ℤ/9 | ker(R:ℤ/9→ℤ/3)={0,3,6}; coker(R)=0 | Exact; pp.49–51 |
| §5.14 TR dimension | p=3, n=1, q=0; K=ℚ₃ and ℚ₃(ζ₃) | Basis pairs (d,r): {(0,0)} and {(0,0),(1,1)}; dimensions 1,2 | ne=1·1=1 and 1·2=2 | Agree; Lemma 5.6.1 pp.95–96 |
| §5.15 perfect-residue arithmetic | k=𝔽₃, K=ℚ₃; k algebraically closed, K=Frac W(k) | Br(K)[3]=ℤ/3 and 0 | H¹(k,ℤ/3)=k/(x³−x)=𝔽₃ and 0 | Agree; proof pp.101–102 |

The adversarial rows for untouched statements stand as in the previous review of `6fe116e`.

- Sources: 11 changed passages checked against 2 cached texts, including seeded §§4.1 and 5.14; HM03 lines 241, 386, 489, 560, 944, 969, 1413, 1778–1825, 2613–2666, 3490–3559, 3705–3736, 3859–4090; MILNE lines 7, 29, 5140–5158.
- Pinned declarations reopened: 4, in `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean` lines 207, 320, 354 and `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean` line 89; the coefficient pairing, local invariant and Steinberg descent agree with the retained signature.
- Affected supplier citations resolved: ClassicalArithmeticCompletion §1.14, BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2; the added source changes no supplier or ownership contract.
- Signatures: all 8 declarations checked with `#check @name` on a scratch copy and compared with the README; no binder lost. No Lean statement changed; the previous padding probes stand.
- Gate: all checks passed; targeted build passed; direct `lake env lean` passed with exactly 5 `sorry` warnings. Dependency output: `depcheck: 245 roadmaps, 2225 edges, 0 problem(s)`.
- Pull-request title, `roadmap-summary` block and prose checked against the base and head: 1 new folder, 1909 inserted lines, 96 added headings, 3 definitions and 5 theorems; no removed or renumbered target, omitted supplier change or contradictory claim. Changes outside this folder: 0.
- Overlap check: read ArithmeticKTheory, SchemeKTheoryOperations, RefinedTraceMethods, K2SymbolsBrauerPartII, K2SymbolsBrauer, StableHomotopyKTheory, BordismFormalGroups and EllipticCohomology; owners: local groups, Bloch complexes and logarithmic trace theory — KTheoryFiniteLocalFields; Milnor rings/residues/norms — K2SymbolsBrauer; general higher Chern classes — SchemeKTheoryOperations; Waldhausen/coefficient foundations — StableHomotopyKTheory; Borel Tate/Bousfield localization — BordismFormalGroups; completed KU — EllipticCohomology. No new duplicate ownership; overlap leads: 0.
- Source independence: changed passages only; 11 passages compared with 2 sources, no copied added wording or reused material; largest source share remains KBOOK (79 of about 320 locators in the previous audit). No layer added, removed or reordered; the previous independent-arrangement comparison stands.

## Not verifiable

- None in the changed passages; the previous review’s limitations for untouched source texts remain.

## Source issues

- none

## For the human reviewers

- Licence: `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` lines 1759–1760 link DFM and DM to ResearchGate uploads; lines 1748 and 1750 link Levine and K-book errata to web.archive.org copies. Whether these copies are author-authorised was not checked.
- Licence: the previous review read HANDBOOK from a web.archive.org copy of the K-theory Handbook file on faculty.math.illinois.edu.
