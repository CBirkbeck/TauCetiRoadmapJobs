# Review of CategoricalOperatorAlgebras (pull request #888 at 136b93a)

**Verdict:** needs changes

This is a full review of the folder at `136b93a`. The previous review read the same head. Two findings remain:

- **R01 (P2), carried.** CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705. Both heads are unchanged.
- **R02 (P3), new.** Three reference entries name the journal version but give arXiv page numbers without saying so.

Everything else checks out:

- The gate passes and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with no diagnostic.
- All 15 seeded locators and the 9 further sources I spot-checked are exact.
- Every adversarial instance below recomputes to the value the README states.

## R01 (P2) — CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705

Carried from the previous review's R01. No repair report marks it settled, and neither side's text has changed.

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46 read: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a".

The Downstream consumers bullet at lines 2303–2309 repeats this. CA2a lines 466–477 define the sign ε and prove `ε=ν₂(x)` on a simple self-dual object.

**Claim.** CA1a and CA2a are the single owner of these objects, and QuantumGroups consumes them.

**Witness.** QuantumGroups #1705 is still open at `7c3e850`.
- Its lines 33–41 say "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.2–0.3".
- Its lines 1795–1798 repeat this.
- Its lines 305–307 define `bar(r) r=ε φ_X` and ask: "Prove invariance of the sign on a simple self-dual object". That is the target this head proves at lines 471–477.

**Status elsewhere.** This README agrees with main and with the other open heads:
- main (`3090489`) QuantumGroups line 42 lists "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier;
- Subfactors on main (lines 72–73) assigns Q-systems and module C*-categories to this roadmap;
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7` consumes CA1a/CA2a (lines 106–107, 320–323);
- the other QuantumGroups revision, #1649 at `9b3ff6c`, leaves the general theory to this roadmap (its lines 32–36).

Only #1705 claims the objects. This pull request's merge-order paragraph lists AlgebraicKTheory → OperatorKTheory → this pull request and says nothing about #1705.

**Repair.** Choose the order and state it in this pull request's description. The README names no pull request either way.

- **This roadmap first.** This is the order main, #867 and #1649 assume.
  - Change nothing in the README.
  - The description names the QuantumGroups revision as later.
  - That revision then deletes its §§0.2–0.3 single-home claim (its lines 33–41 and 1795–1798) and its sign-invariance target (line 307), and cites CA1a/CA2a, with `ε=ν₂(x)` from CA2a.
- **The QuantumGroups revision first.** Once it has merged:
  - at lines 40–46, replace "have their single home here" for the overlapping objects by a citation of QuantumGroups §0.2;
  - delete the QuantumGroups bullet at lines 2303–2309;
  - keep here what §0.2 does not build: W*-categories and W*-Cauchy completion, the grading groupoid for a nonsimple unit, Penneys's Theorem A, the braided sign law and the comparison `ε=ν₂(x)` with the pinned indicator.

**Tested.** Under the first option, ε has one definition (line 466) and one invariance theorem (lines 471–477), and the two roadmaps' sign conventions agree.
- #1705 line 309 gives the SU(2) fundamental object ε=−1.
- Restricted to Q₈, its indicator is `(1/8)Σχ(g²)=(2+2+6·(−2))/8=−1`, matching the ε=−1 structure J of CA2a's Check at line 564.
- The dependency check prints 0 problems at this head.

## R02 (P3) — Katsura and Masuda–Tomatsu locators give arXiv pages under journal citations

**Location.** README lines 2387–2390: "Masuda–Tomatsu 2007, […](https://arxiv.org/abs/math/0604348), Comm. Math. Phys. 274 (2007), Definition 8.1 and Lemma 8.2 (Appendix, p. 64) and Lemma 8.3 (p. 65)".

The same pattern appears in:
- the Masuda–Tomatsu 2009 entry (lines 2393–2406: "Adv. Math. 220 (2009), §2.4 (p. 5), … Corollary 4.19 with its proof (p. 38)");
- the Katsura entry (lines 2357–2361, "J. Funct. Anal. 217 (2004)"), whose body locators are at lines 1129–1157 ("Definition 3.2, p. 5", … "Proposition B.5, p. 24").

**Claim.** The page numbers refer to the cited journal articles.

**Witness.** Every one of these pages is a page of the linked arXiv text:
- `MasudaTomatsu2007` line 3037 (Lemma 8.2) lies on printed p. 64;
- `MasudaTomatsu2008` line 1320 (Corollary 3.16) lies on p. 29;
- `Katsura2004` line 206 (Definition 3.2) lies on p. 5.

The Izumi 2003 and Chen–Hernández Palomares–Jones–Penneys entries (lines 2413 and 2329) say "printed page numbers of the arXiv version"; these three entries do not. I could not check the published numbering (see Not verifiable).

**Repair.** Append "(printed page numbers of the arXiv version)" to the Katsura, Masuda–Tomatsu 2007 and Masuda–Tomatsu 2009 reference entries, as the Izumi 2003 entry does.

**Tested.** With that note, every locator in these entries resolves in the linked text:
- Katsura Definition 3.2 → `Katsura2004` line 206, p. 5;
- Theorem 8.6 → line 764, p. 18;
- Masuda–Tomatsu 2007 Lemma 8.3 → `MasudaTomatsu2007` line 3071, p. 65;
- Masuda–Tomatsu 2009 Corollary 4.19 → `MasudaTomatsu2008` line 1664, p. 38.

## Previous findings

- **R01: not repaired.** Lines 40–46 still read "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". #1705 at `7c3e850` keeps lines 33–41 and the target at line 307. Carried as R01.
- **R02 of the review before last:** repaired at `136b93a`, as the previous review recorded. The pinned `ν₂` is cited at lines 471–473, and `TauCeti.SplitK0.eq_frobeniusPerronChar` and the groupoid `U` at lines 503 and 513. Unchanged since.

## Verified sound

### Gate, build and form

- **Gate.** My run of `gate … --base origin/main` at `136b93a` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md` (2452 lines), `Suggested.lean` (57 lines) and `metadata.toml` (`topic = "math.OA"`). There are no stray files.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 11 s with no diagnostic.
  - The file declares nothing, so the `#check @name` comparison and the one-tactic probe have nothing to run on, and there is no padding.
  - It has a single `import Mathlib`, one module docstring, `namespace TauCetiRoadmap.CategoricalOperatorAlgebras`, and no `set_option`, `lemma`, `#eval` or `sorry`.
- **Policy grep of the README.** No process words, pull-request numbers, LaTeX delimiters or the words "optional", "deferred" or "removed". The only "Lemma B" hits are source labels (lines 780, 1152, 2326). Every layer CA1–CA10 ends with `### Examples` and `### Dependencies`.

### Headline theorems and statability

The headlines, read from the Summary and the layers:
- CA2a: Penneys Theorem A.
- CA2b: Penneys Theorem C and the Coles–Huston–Penneys–Srinivas module equivalence.
- CA3: Q-system completeness iff splitting, `QSys(QSys(C))≃QSys(C)` and the C*Alg realization.
- CA4: Jones–Penneys *Q-systems* Theorem A.
- CA5: Jones–Penneys *Realizations* Theorem A.
- CA6: Henriques–Penneys–Tener *Anchored* Theorem A.
- CA7: Katsura Theorem 8.6 and Hartglass–Penneys I Theorem 5.25.
- CA8: Hartglass–Penneys II Theorems A–C and Watatani index `δ²`.
- CA9: Henriques–Nivedita–Penneys Theorem A, representation existence and uniqueness, and the factor case of Tomatsu's Theorem D.
- CA10: the Henriques–Penneys–Tener classification.

The docstring names each one as not statable, with the carrier it lacks. I checked those claims at the pins:
- **Mathlib (`1b1ccf4b`):**
  - `Analysis/VonNeumannAlgebra` has only `Basic.lean`: no factor, hyperfinite factor or conditional expectation;
  - `Analysis/CStarAlgebra/Module` (`Defs`, `Constructions`, `Synonym`) has no interior tensor product;
  - no dagger-category or C*-category class exists anywhere in Mathlib.
- **Tau Ceti (`2fd255d9`):**
  - its only "Dagger" files are `RingTheory/Dagger`, which are overconvergent algebras;
  - `Analysis/VonNeumannAlgebra` has only `Adjoin` and `Density`;
  - neither library has C*-algebra K-theory, Cuntz–Pimsner or Toeplitz algebras, or planar algebras.

So stating nothing is correct, and no statable headline is missing.

### Dependency check

`gate --depcheck … --movable --content …` printed `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This roadmap is line 229 of the merge order.
- Its suppliers come first: VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8), OperatorKTheory (9) and Subfactors (208).
- FreeProbability, PivotalSpherical and OperatorAlgebraDynamics are on main.
- TemperleyLiebOperatorAlgebras (245) and QuantumGroups are named only as consumers.
- CStarClassification (230) is named only as the owner of general classification, which is not consumed.
- No gaps are declared.

### Pinned Tau Ceti declarations

All 40 backticked `TauCeti.*` names (16 modules, 24 declarations) exist at `2fd255d9`. I reopened these:

| Declaration | File:line | What the pin says |
|---|---|---|
| `TauCeti.frobeniusSchurIndicator` | `CategoryTheory/Monoidal/Pivotal/FrobeniusSchur.lean:287` | `(n : ℕ+) : k`, the trace of `frobeniusSchurEnd k V n.natPred`; `[CommRing k] [Linear k C] [MonoidalLinear k C]`. The compact-group indicator at `RepresentationTheory/Compact/FrobeniusSchur/Basic.lean:135` is `ContRepresentation.frobeniusSchurIndicator`, so there is no clash. |
| `TauCeti.PivotalCategory.characterEquiv` | `Pivotal/Grading.lean:49` | `PivotalCategory C ≃ (universalGradingGroup C →* kˣ)`; `[Field k] [IsAlgClosed k] [Abelian C] [IsFiniteSemisimpleCategory C] [Simple (𝟙_ C)]`, as the README's supplier contract states (lines 146–150) |
| `TauCeti.IsPseudoUnitary` | `Pivotal/PseudoUnitary/Basic.lean:73` | `globalDim C = FPdim-global • 𝟙`; independent of the pivotal structure (`isPseudoUnitary_pivotalCategory_iff`) |
| `TauCeti.IsPseudoUnitary.of_leftDim_eq_frobeniusPerronDim` | `Basic.lean:131` | from `leftDim X = FPdim X • 𝟙` for simple X |
| `TauCeti.PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` | `Basic.lean:167` | two such structures are equal |
| `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory` | `Existence.lean:161` | `∃!` P with `leftDim = FPdim` on all X, and it is spherical |
| `TauCeti.SplitK0.eq_frobeniusPerronChar` | `Semisimple/FrobeniusPerron.lean:133` | a ring hom to ℝ that is ≥0 on the simple basis equals the FP character |
| `TauCeti.universalGradingGroup.liftEquiv` | `Monoidal/Grading/Universal.lean:106` | the universal property |

The CA2a route at lines 495–510 is consistent with these signatures:
1. pseudounitarity makes `leftDimChar ℂ C` positive real on the ℤ-basis;
2. it corestricts to ℝ;
3. `eq_frobeniusPerronChar` identifies it with the FP character;
4. the two `Basic.lean` lemmas close the argument.

### Cross-roadmap citations resolved (main `3090489`, open heads as given)

- **VonNeumannAlgebras (main):**
  - V4.Normality and Sakai at line 987;
  - V5 countable absorption at lines 1354–1358;
  - V11 `T(M)`, `S(M)` and Powers factors with `T(R_λ)=(2π/log λ)ℤ` at lines 3071–3082;
  - V11 core convention `θ_s(u_t)=exp(ist)u_t`, `Tr∘θ_s=exp(s)Tr` at lines 3267–3268, the same as CA9 lines 1817–1818;
  - V12 `Ct(M)` by predual-centralizing sequences at lines 3406–3415;
  - V13a/V13b at lines 3690 and 3740, with `Ct(R_(0,1))=Int(R_(0,1))` at line 4036.
- **Subfactors (main):**
  - 1.1–1.2, 2.1–2.5, 3.2–3.3, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2 and 9.1–9.2 all exist (headings at lines 308–1529);
  - 2.5 supplies `E⁻¹` and `Ind(E)=E⁻¹(1)` for factors of any type (lines 546–554);
  - its consumer list (lines 1722–1726) matches what this README consumes.
- **OperatorKTheory #866 at `1377338`:** K2.3 continuity and Morita invariance at line 599, K3.2 six-term sequence at line 761, K5–K7 at lines 1127, 1301 and 1496.
- **OperatorAlgebraDynamics (main):** D6 owns `O_n` (line 590).
- **CStarAlgebras (main):** C4.2 Stinespring at line 1021.
- **HilbertModules (main):** Morita invariance of simplicity at line 319.
- **FreeProbability (main):** F2–F4 at lines 184–353.
- **PivotalSpherical (main):** Layers 0–9 and 11 at lines 257–626.
- **TemperleyLiebOperatorAlgebras #867:** Layer 3.1–3.4 at lines 1269–1372.
- **Citations of this roadmap:** `roadmaps grep CategoricalOperatorAlgebras` finds them on main (QuantumGroups, Subfactors) and at #867, #1649, #1705 and #1137. Each one cites CA1a, CA2a, CA3 or CA10, or the roadmap by name, and all of these exist here. `overlaps.md` and the citation resolver list nothing dropped or missing.

### Duplication audit by object (main and all open heads)

`roadmaps grep` finds no second owner for:
- Q-systems (Subfactors on main lines 72–73 defers them here);
- the general Ocneanu ultrapower (VonNeumannAlgebras has only the tracial one; CA9 line 1765 relates the two);
- Cuntz–Pimsner algebras, the Watatani index and the tube algebra;
- Izumi's canonical extension (the only other hits are the automorphic "canonical extension" of AutomorphicBundles and its relatives);
- the Connes–Takesaki module of endomorphisms;
- centrally free category actions (VonNeumannAlgebras main line 4043 is Connes's group-action Rokhlin theorem);
- Kosaki's basic extension for σ-finite factors;
- W*-categories, bicommutant categories and anchored planar algebras;
- the unshaded Temperley–Lieb factor planar algebra.

The one two-owner case is R01.

### Seeded sample (15 targets)

The draw uses `shuf -n 15` seeded from the head SHA over the 116 page-locator lines of CA1–CA10. This is the previous review's draw, which read only line 476, so all 15 were read this round. Printed pages were checked against each extraction's printed page numbers.

| README line | Locator | Source line, printed page | Result |
|---|---|---|---|
| 476 | Ng–Schauenburg Def. 3.1, p. 8 | `NgSchauenburg2007Pivotal` 360, p. 8 | exact; supports `ν_n=Tr E^(n)` |
| 531 | Penneys Rem. 2.5 p. 6, Rem. 2.11 p. 8, Lem. 3.19 and following paragraph p. 14 | `Penneys2018` 281 (p. 6), 345 (p. 8), 653–664 (p. 14) | exact; Lemma 3.19 sends Aut⁺ onto `Hom(U→ℝ>0)` |
| 774 | CHJP Thm 3.36 p. 26, Cor. 3.37 p. 27 | `CHJP2021` 1131 (printed 26), 1164 (printed 27) | exact; Assumption 2.7 (line 280) is the CA3 standing hypothesis |
| 1386 | Hartglass–Penneys II Thm A p. 2, Cor. 4.16 p. 15 | `HartglassPenneys2014II` 81, 642 | exact |
| 1394 | HP II Thm B p. 3, Cor. 4.17 p. 15 | 89, 646 | exact |
| 1406 | HP II Thm C p. 3, Cor. 5.18 p. 25 | 98–100, 1135 | exact (misprint in the source, see Source issues) |
| 1427 | HP II Def. 6.11, Thm 6.13 p. 27, proof p. 28 | 1224, 1229, 1238–1262 | exact; the integer case uses depth ≥2, as the README says |
| 1505 | HNP Def. 4.14 p. 26 | `HNP2024` 1054 (page 26 ends at 1087) | exact |
| 1513 | HNP Thm A p. 2, Thm 7.4 p. 38 | 37, 1540 | exact; left modules, as the README notes |
| 1545 | Henriques–Penneys 2015 Lem. 3.4 p. 16 | `HenriquesPenneys2015` 886 | exact; proof route (II by uniqueness, III by flow of weights) agrees |
| 1728 | Burns Prop. 2.1.21 pp. 12–13; JP *Realizations* Def. 3.3(1) p. 15 | `Burns2011` 481–491 (printed 12–13); `JonesPenneys2017Realizations` 668–670 | exact; `E_M=J₀E′(J₀·J₀)J₀`, `Ind(E_M)=Ind(E)`, `E_M(e₁)=τ` |
| 1921 | Masuda–Tomatsu 2009 Cor. 4.19 p. 38 | `MasudaTomatsu2008` 1664–1674 | exact; Lemma 4.15 applied to `σ̄`, n=1 |
| 1957 | Tomatsu Thm D p. 2, Thm 5.7 p. 47 | `Tomatsu2018` 76, 2172 | exact; Irr countable (line 61), invariant state automatic on a factor |
| 2002 | HP 2015 Thm A p. 2, Thms 5.10–5.13 pp. 24–25, §6 p. 30 | 58, 1386–1457, 1768 (restated Theorem A and its proof, p. 30) | exact |
| 2007 | HP 2020 Thm B p. 3, Thm 6.8 p. 37 | `HenriquesPenneys2020` 112, 1866 | exact; both type II or both III₁ |

Further locators I spot-checked, all exact:
- Jones–Penneys *Operator algebras* Theorems 3.8, 3.20, 3.24, 4.18, 4.28 and 5.15 (pp. 22, 27, 29, 35, 39, 51);
- *Q-systems* Theorem A (p. 1) and Proposition 4.11 (p. 14);
- CHPS Theorem A (p. 3) and §2.3 (p. 10);
- HPT *Anchored* Theorem A (p. 3);
- HPT *Classification* Conjecture 1.1 (p. 2), Lemma 3.7 and Theorem 3.8 (p. 10), Corollary 3.9 (p. 11) and Lemma 4.1 (p. 16);
- Katsura Definitions 3.2 and 3.4 (pp. 5, 6), Theorem 6.4 (p. 14), Propositions 8.1–8.2 and Definition 8.3 (p. 17), Theorem 8.6 (p. 18), Lemma B.2 and Proposition B.3 (p. 23), Proposition B.5 (p. 24);
- Izumi 2003 Theorem 2.4 (p. 5), Definition 3.1 (p. 7), Theorem 3.3 (p. 9) and Remark 3.8 (p. 17);
- Masuda–Tomatsu 2007 Definition 8.1 and Lemma 8.2 (p. 64) and Lemma 8.3 (p. 65);
- Masuda–Tomatsu 2009 Corollary 3.16, Theorem 4.6, Lemmas 4.7 and 4.10–4.11, Propositions 4.8–4.9, Theorem 4.12, Lemma 4.15 and Theorems 4.16 and 4.18, all on the pages the README states;
- Hartglass–Penneys I Notation 2.11 (p. 8), Definitions 5.17–5.18 (p. 35) with `a=(μ(s(ε′))/μ(t(ε′)))^(1/4)` (lines 1531–1535), Theorems 5.19–5.20, Lemma 5.21 and Theorem 5.23 (p. 39), Theorem 5.25 (p. 40);
- Penneys Definition 2.10 (p. 8), Propositions 3.24 (p. 16) and 3.26 (p. 18), Example 4.7 (p. 25) and the §4 dictionary (p. 23).

### Adversarial table

Every value below was computed this round.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| CA2a Penneys Thm A (headline) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)` | `Hom(ℤ/2,ℂˣ)={±1}`, `Hom(ℤ/2,ℝ>0)={1}`; twisted: `dim_L=dim_R=−1`, ratio 1; pair groupoid: t>0. At t=4: `dim_L=2`, `dim_R=½`, product 1; equal weights give 1 vs ¼, weights (1/5, 4/5) give 2/5 = 2/5 | sound |
| CA2a `ε=ν₂(x)` (sample 476) | ℂ in `Hilb_fd`; ℂ²; g in `Hilb(ℤ/2)`, standard and twisted; Q₈, S₃ 2-dim irreps | ν₂(ℂ)=1=ε; ν₂(ℂ²) = trace of the flip = 3−1 = 2 (not simple); +1, −1; Q₈ `(4−12)/8=−1`; S₃ `(2+6−2)/6=1` | sound |
| CA2a antiunitary Checks | J, J′ on ℂ²; `J(a)=cā` on ℂ | `J²(a,b)=(−a,−b)`; `J′²=1`; `J²(a)=|c|²a=a`; `(J⊗J)²=+1` | sound |
| CA2a/Penneys torsor (sample 531) | `Hilb(ℤ/2)` | Aut⊗(id) ≅ `Hom(ℤ/2,ℂˣ)`, 2 elements; Aut⁺ ≅ {1} | sound |
| CA2b Penneys Thm C (headline) | graph `u₁—w—u₂`; TL Gram | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det[[δ²,δ],[δ,δ²]]=δ²(δ²−1)`: 2 at δ=√2, 0 at δ=1 (excluded) | sound |
| CA1a Checks | `diag(2,1)`; `e(x,y)=(x+y,0)`; ℓ² column | `‖f†f‖=4=‖f‖²`, HS: 5 vs √17; `ee†=diag(2,0)`, `‖e‖=√2`, range projection `diag(1,0)`; `Σ1/n²=π²/6`, `Σ1/n=∞` | sound |
| CA1b Checks | ℂ² acting on ℂ; zero action; `ℂⁿ` reversal | unitor unitary; inner products `⟨x,φ(a*a′)x′⟩=0`; dimensions n² and 1 | sound |
| CA3 normalizations and completeness (sample 774) | `Q=M_n`, normalized trace; ℂ² in `Hilb_fd` | `mm†=n²`, `i†i=1`; `m′m′†=1`, `i′†i′=n²`, `i′†m′=i†m`; wrong `d_Q⁻¹`: `n⁻²`; `f′=nf`; ℂ² does not split in `Hilb_fd` (`(dim X)²=2` has no solution), so `Hilb_fd` is not Q-system complete while `QSys(Hilb_fd)` is | sound |
| CA4 JP *Q-systems* Thm A (headline) | trivial object; transpose; trace on `M₂` | `d_Q=1`; Choi matrix = flip, eigenvalue −1; Stinespring `K=M₂`, dimension 4; density `½·1` has rank 2, not a vector state | sound |
| CA5 JP *Realizations* Thm A (headline) | `N⊆N⋊ℤ/2`; `N⊆N⋊ℤ` | `L²(M)=L²(N)⊕L²(N)_α`, `d_Q=2`; infinitely many invertible summands, not compact | sound |
| CA6 HPT *Anchored* Thm A (headline) | `Hilb(ℤ)`, `Hilb(ℤ/2)` on `Hilb_fd`; `P[0]=ℂ²`; `x=ℂ^k` | infinite and finite support; `‖(1,0)‖²=ψ((1,0))=½`; `dim P[n]=k^n`, not `k^(2n)` | sound |
| CA7 Katsura 8.6 (headline) | `ℂⁿ` over ℂ; zero action; `ℓ²(I)`, I uncountable | coker/ker of `1−n` on ℤ: `ℤ/(n−1)`, 0; n=1: ℤ, ℤ; `J_X=0`, `O_X=T_X`; `K₀=ℤ`, `K₁=0` | sound |
| CA7 free graph trace (HP I Defs 5.17–5.20) | one edge, μ=(16,1); loop μ=1; c=3 | `x=aL(ε′)+a⁻¹L(ε″)†`; `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; a=2: 4=4, a=½: ¼ vs 64; loop: semicircular on [−2,2]; `τ_(3μ)(p_v)=48` | sound |
| CA7 HP I Thms 5.23, 5.25 (headline) | countable and uncountable star | centre `a_μ=∞`, leaves `a_μ=2>1`, A empty; `K₀` free on vertices, `K₁=0` | sound |
| CA8 HP II Thms A–C (samples 1386–1406) | TL(√2), principal graph `A₃` | `√2·1=√2`, `√2·√2=1+1`; `K₀=ℤ³`; traces `√2−1∈(0,1)`, `√2>1`, 0 | sound |
| CA8 Watatani / Thm 6.13 (sample 1427) | `E(a,b)=(a+2b)/3`; N(δ²) | `Ind=(3,3/2)` and `2·1`; N: 3, 3, 4, 5 at δ²=2, 2.618, 3, 4; TL(√2): `[1₂]=[p_f₀]+[p_f₂]≠2[p_f₀]` | sound |
| CA9 HNP Thm A / transpose (samples 1505, 1513) | `F=−⊗ℂ^k`; pairs functor | `F^t=−⊗(ℂ^k)‾`, dimension mnk; `HS(ℂ²,ℂ³)` dimension 6 vs `HS(ℂ,ℂ)` dimension 1 | sound |
| CA9 existence and uniqueness (samples 1545, 2007) | `R_λ`, 0<λ<1, `Hilb(ℤ/2)`; `M_n` | `σ_(t₀)=⊗Ad(diag(1,−1))`, `t₀=π/|log λ|∉(2π/log λ)ℤ`; two non-isomorphic fully faithful representations; `M_n⊗̄R_II₁≅R_II₁≠M_n` | sound |
| CA9 `T(R_III₁)={0}` route | `σ_T=Ad u` | `u=h^(iT)`; `σ_T^(φ(h⁻¹·))=Ad(h^(−iT))∘Ad(u)=id`; Γ ⊆ `(2π/T)ℤ` ≠ ℝ | sound |
| CA9 Tomatsu Thm D, centrally free ⇔ fully faithful (sample 1957) | `Hilb(ℤ)` on `R_III₁` via `σ_(nt)`; `L(F₂)⊗̄B(ℓ²)` | modular, so centrally trivial and not free; φ swapping a,b is outer since `b⁻ⁿhaⁿ` are distinct; `M_ω=ℂ`, a=1 | sound |
| CA9 amplification and canonical extension | n=2 | `φ_ρρ=id`, `τ∘φ_ρ=τ/2`, cocycle `2^(−it)`, `ρ̃(u_t)=2^(it)2^(−it)u_t=u_t`; `θ_s(h)=e^s h` gives `Tr∘θ_s=e^s Tr` | sound |
| CA9 basic extension (sample 1728) | `id⊕id`; λ=1/5 | Ind 4, `E₁(e)=¼`; `Ind=1/μ₁+1/μ₂=5+5/4=25/4`, `E₁(e_E)=4/25` | sound |
| CA9 MT 4.15/4.19 (sample 1921) | `σ_(t₀)` on `R_λ`; `Ad u` | not centrally non-trivial; `id⊕Ad u ≅ id⊕id`, `N∨(N′∩M)=M`, `q₁=1` | sound |
| CA9 HP 2015 Thm A (sample 2002) | `C=Hilb_fd` | `C⊗_Vec Hilb=Hilb_sep`, `C′=Bim(R)`, `C″=Hilb_sep` | sound |
| CA9 End_rev, corner model | `Ad u`, `Ad v` on `M₂`; `T=1⊗e_(1,pt)` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]` not proportional; `T*T=1`, `TT*=1⊗e₁₁`; `M=ℂ` block dimension 2 | sound |
| CA10 HPT classification (headline) | `Hilb_fd`, `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)`; unit with r=±id | tube dimensions 1, 4, 9, 36; S₃: `1+1+4+9+9+4+4+4=36=6²`; `ū r u⁻¹=(−i)r(−i)=−r` | sound |
| CA1a/CA2a owner (R01) | this README; #1705; main QuantumGroups; #867; #1649 | here ll. 40–46; #1705 ll. 33–41, 305–307, 1795–1798; main l. 42; #867 ll. 106–107; #1649 ll. 32–36 | two single-home claims (R01) |
| Katsura and MT locators (R02) | the three reference entries | Katsura p. 5 = `Katsura2004` l. 206; MT2007 p. 64 = l. 3037; MT2009 p. 29 = l. 1320 | arXiv pages, unmarked (R02) |

## Not verifiable

- **Kosaki 1986, Izumi 1993 and Popa 1995.** These are `uncertified` (paywalled) and cited by locator. I checked their content through the texts the README routes them through:
  - Burns Proposition 2.1.21 and the paragraph after it (`Burns2011` lines 481–491);
  - Masuda–Tomatsu 2009 Theorem 4.16 for Izumi 1993 (line 1639);
  - Masuda–Tomatsu 2009 Theorem 4.18 for Popa (lines 1652–1663).
- **Published theorem numbering.** I could not check it for Katsura (J. Funct. Anal. 217), Masuda–Tomatsu (Comm. Math. Phys. 274; Adv. Math. 220), Izumi 2003 (Amer. J. Math. 125) or Ng–Schauenburg (Contemp. Math. 441): the publisher pages are paywalled. I read the arXiv texts the README links (R02).
- **Ownership against open pull requests.** I checked it against every sibling head this brief lists, through `roadmaps grep`. Of the board packages, only those in `board-packages-index.txt` (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not opened; none is near this subject.

## Source issues

- **Misprint** in HartglassPenneys2014II at Theorem C, printed p. 3 (line 99): the positive cone of `K₀(A₀)` is written as a set of classes in `K₀(A_k)`; it should take classes in `K₀(A₀)`, as in Theorem 5.1 (line 694); affects nothing.
- **Misprint** in HartglassPenneys2014II at Remark 6.12, printed p. 27 (line 1226): "Pimsenr-Popa"; it should read "Pimsner–Popa"; affects nothing.
- **Misprint** in Penneys2018 at Definition 3.16, printed p. 14 (line 625): a grading "by a groupid"; it should read "groupoid"; affects nothing.
- **Misprint** in Penneys2018 in §3.3, printed p. 14 (line 650): "the group of of monoidal natural automorphisms"; it should have a single "of"; affects nothing.
- **Misprint** in Penneys2018 at Remark 2.11, printed p. 8 (line 349): "strictly positve"; it should read "positive"; affects nothing.
- **Misprint** in HenriquesPenneys2020 in the proof of Corollary 3.8, printed p. 13 (line 623): the modular automorphisms are said to have infinite order in `Out(M)`; the factor there is R, so it should read `Out(R)`; affects nothing.
