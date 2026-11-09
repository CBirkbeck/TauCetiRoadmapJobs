# Review of CategoricalOperatorAlgebras (pull request #888 at 136b93a)

**Verdict:** needs changes

This is an incremental re-review of the 106 changed lines since `c3fc64a`. The head repairs R02 in full, and the changed text has no new defect. R01 is unchanged on both sides: the CA1a/CA2a objects still have two open owners, this folder and the QuantumGroups revision #1705. The new `ε=ν₂(x)` target widens that overlap. The gate passes, the dependency check reports 0 problems, and the one seeded locator that falls in the changed text is exact.

## R01 (P2) — CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705

Carried from the previous review's R01. No repair report marks it settled, and neither this head nor #1705 changed the passages involved.

**Location.**
- `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a".
- The Downstream consumers bullet at lines 2303–2309 repeats this.
- The new CA2a target at lines 471–477 proves `ε=ν₂(x)` on a simple self-dual object.

**Claim.** CA1a and CA2a are the single owner of these objects, and QuantumGroups consumes them.

**Witness.** QuantumGroups #1705 is still at `7c3e850`.
- Its lines 33–41 say "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.2–0.3".
- Its lines 1795–1798 repeat this.
- Its lines 305–307 define `bar(r) r=ε φ_X` and ask: "Prove invariance of the sign on a simple self-dual object". This head's lines 471–477 now prove that same invariance as `ε=ν₂(x)`.

**Status.** This README agrees with main and with the other open heads:
- main (`1bea835`) QuantumGroups lists CA1a/CA2a as a supplier at line 42 and uses "CA2a's balanced unitary dual functor" at line 253;
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7` consumes CA1a/CA2a (lines 107, 320–323, 1336);
- QuantumGroups #1649, now at `9b3ff6c`, leaves the general theory to this roadmap (lines 32–36).

Only #1705 claims the objects. This pull request's merge-order paragraph lists AlgebraicKTheory → OperatorKTheory → this pull request and says nothing about #1705.

**Repair.** Choose the order and state it in this pull request's description. The README names no pull request either way.
- **This roadmap first** (the order main assumes). Change nothing in the README. The description names the QuantumGroups revision as later. That revision then:
  - deletes its §§0.2–0.3 single-home claim (lines 33–41 and 1795–1798) and the sign-invariance target (line 307);
  - cites CA1a/CA2a, with `ε=ν₂(x)` from CA2a, and TemperleyLiebOperatorAlgebras Layer 3.
- **The QuantumGroups revision first.** Once it has merged:
  - at lines 40–46, replace "have their single home here" for the overlapping objects by a citation of QuantumGroups §0.2;
  - delete the QuantumGroups bullet at lines 2303–2309;
  - keep here what §0.2 does not build: W*-categories and W*-Cauchy completion, the grading groupoid for a nonsimple unit, Penneys's Theorem A, the braided sign law and the comparison `ε=ν₂(x)` with the pinned indicator.

**Tested.** Under the first option, the sign ε has one definition (line 466) and one invariance theorem (lines 471–477). Every reader already cites CA2a for them: main's QuantumGroups (lines 42 and 253) and #867 (lines 320–323). The two sign conventions agree. #1705 line 309 gives the SU(2) fundamental object ε=−1. Its ν₂ is `(1/|G|)Σχ(g²)` for the quaternionic 2-dimensional representation, which is −1 for Q₈: `(2·2+6·(−2))/8=−1`. The dependency check prints 0 problems at this head.

## Previous findings

- R01 — not repaired: lines 40–46 still read "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". #1705 at `7c3e850` keeps its §0.2 claim (lines 33–41) and its own sign-invariance target (line 307). Carried as R01.
- R02 — repaired. Lines 120–121 read "PivotalSpherical Layers 0–2, 5, 6 and 9 and of the Frobenius–Schur indicators of Layer 8". Lines 471–473 read "prove `ε=ν₂(x)`, where `ν₂(x)` is `TauCeti.frobeniusSchurIndicator ℂ x 2`". Lines 503 and 513 cite `TauCeti.SplitK0.eq_frobeniusPerronChar` and name `U`.

## Verified sound

### What the repair of R02 does, item by item

1. **From Tau Ceti bullet** (lines 151–177). It now lists `FrobeniusSchur`, `Character`, `FrobeniusPerron` and the two pseudo-unitary lemmas. The layer list reads "0–2, 5, 6 and 9" plus the Layer 8 indicators. The PivotalSpherical contract (lines 181–184) reads "Layers 0–6 and 9 … Layer 8 supplies the Frobenius–Schur indicators". It agrees with CA2a's *Needs* (lines 619–620) and Dependencies (lines 712–713).
2. **The sign comparison** (lines 471–477). It is stated as `ε=ν₂(x)` for the induced pivotal structure, with a proof route. That route is checked below.
3. **The new Check** (lines 572–579). It computes both negative controls and one positive instance. The values are recomputed below.
4. **The Frobenius–Perron citation.** Line 503 cites `TauCeti.SplitK0.eq_frobeniusPerronChar`. That is the pinned name: the lemma lives in `namespace SplitK0`. The previous review's repair list had written `TauCeti.eq_frobeniusPerronChar`, without the namespace; the README uses the correct form.
5. **The groupoid** (line 513). `U` is named, with Penneys's locator.

The repair also adds three things the previous review did not ask for, all correct:
- `TauCeti.SplitK0.leftDimChar` as the route to the real character;
- `TauCeti.IsPseudoUnitary.of_leftDim_eq_frobeniusPerronDim` and `TauCeti.PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` as the two closing steps;
- the Ng–Schauenburg reference entry (lines 2343–2348).

### Gate, build and form

- **Gate.** My run of `gate … --base origin/main` at `136b93a` prints `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's run adds `build=0`.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The change since `c3fc64a` touches only `README.md`; `Suggested.lean` (57 lines) is byte-identical.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 4.8 s with no diagnostic. The file declares nothing, so there is no `#check` comparison and no one-tactic probe, and there is no padding.
- **Docstring.** It is unchanged, and the new text adds no headline. `ε=ν₂(x)` needs a unitary dual functor, and the docstring already says there is no C*-category at the pins.
- **Policy grep of the added lines.** No process words, pull-request numbers, LaTeX delimiters, `lemma`, "optional" or "deferred".
- **Citation resolver.** `roadmaps resolve` on the README prints "None" for both cross-roadmap citations and Lean names.

### Dependency check

`gate --depcheck … --movable --content …` prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The two extra edges since the previous review go to PivotalSpherical, which is on main. No gaps are declared. `overlaps.md` and my own `roadmaps overlaps` run list no dropped ids and no other pull request changing this roadmap.

### Tau Ceti declarations read at the pin (`2fd255d9`)

All 40 backticked `TauCeti.*` names and modules (24 declarations, 16 modules) in the README exist at the pin. The modules of the seven new names have no `.olean` here, so I read them from source:

| Declaration | File and line | What it says at the pin |
|---|---|---|
| `TauCeti.frobeniusSchurIndicator k V n` | `Pivotal/FrobeniusSchur.lean:287` | `n : ℕ+`; the trace of `frobeniusSchurEnd k V n.natPred` on `𝟙_ C ⟶ tensorPow V n`; 0 when that module is not finite free; `[CommRing k] [Linear k C] [MonoidalLinear k C]` |
| `TauCeti.pivotalRotate` | `FrobeniusSchur.lean:76` | `η` of `pivotalExactPairing X` (`Basic.lean:187`, `exactPairingCongrRight (pivotalIsoApp X)`), then `ε_ X Xᘁ`: Ng–Schauenburg's `E_(X,Y)` in the form of their Lemma 3.4 |
| `TauCeti.tensorPow` | `Monoidal/TensorPow.lean:54–63` | `V^0=𝟙`, `V^(n+1)=V⊗V^n`, the bracketing Ng–Schauenburg use (`NgSchauenburg2007Pivotal` lines 351–352) |
| `TauCeti.SplitK0.leftDimChar k C` | `Pivotal/Character.lean:97` | `SplitK0 C →+* k`; `[IsAlgClosed k]`, `[Simple (𝟙_ C)]`, `[FiniteDimensional k (𝟙_ C ⟶ 𝟙_ C)]`; no finiteness of simples |
| `TauCeti.SplitK0.frobeniusPerronChar` / `eq_frobeniusPerronChar` | `Semisimple/FrobeniusPerron.lean:128, 133` | a fusion category (`IsFiniteSemisimpleCategory`, `Finite (SimpleClasses C)`, simple unit, `IsAlgClosed k`); a ring hom to ℝ that is `≥0` on `simpleBasis` equals it |
| `TauCeti.frobeniusPerronDim` | `FrobeniusPerron.lean:198` | `frobeniusPerronChar k C (of X)` |
| `TauCeti.IsPseudoUnitary.of_leftDim_eq_frobeniusPerronDim` | `PseudoUnitary/Basic.lean:131` | from `leftDim X = FPdim X • 𝟙` for simple X |
| `TauCeti.PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` | `PseudoUnitary/Basic.lean:167` | `P = Q` when both have left dimensions FPdim on simples |
| `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory` | `PseudoUnitary/Existence.lean:161` | `∃!` P with `leftDim = FPdim` for all X, and it is spherical |

The README's argument orders are right: `TauCeti.frobeniusSchurIndicator ℂ x 2` and `TauCeti.SplitK0.leftDimChar ℂ C` take `k`, then the object or category, as explicit arguments.

### Cross-roadmap citations resolved

- **PivotalSpherical on main (`1bea835`).**
  - Layer 5 (line 434) is the unique nonnegative character of a transitive based ring.
  - Layer 6 (line 453) has FPdim, `dim C` and pseudo-unitarity with ENO's Proposition 8.23.
  - Layer 8 (line 506; the indicator item at line 527) defines the Ng–Schauenburg `ν_n` for `n : ℕ+` and owns only the categorical `ν_n`.
- **Ownership of the new comparison.** `roadmaps grep` for `frobeniusSchurIndicator` and for "Frobenius–Schur … self-dual", on main and at every open head, finds only group-representation indicators: CharacterTheory on main; CompactGroups #1047; LieHighestWeight #1220; FiniteGroupInvariants #1708; ArtinRepresentations #1711. It also finds PivotalSpherical's `Vec^ω_G` indicator. No roadmap other than #1705 (R01) plans the unitary sign comparison.
- **The R01 heads.** #1705 at `7c3e850`, #1649 at `9b3ff6c` and #867 at `ba43cc7` were read as cited in R01.

### The mathematics of the changed passages

- **`ε=ν₂(x)` (lines 471–477).**
  - `Ng–Schauenburg` Definition 3.1 (`NgSchauenburg2007Pivotal` lines 360–378, printed p. 8) sets `T_(V,W)(f)=j_V⁻¹∘f∨` on `C(V∨,W)`, `E_(V,W)=A⁻¹ T A` and `ν_n=Tr E_V^(n)`. Their duality has `ev: V∨⊗V→I` (line 314), the README's `ev_x` convention (line 459).
  - For `V=W=x` and the unitary `r`, `(r⁻¹)∨=(r†)∨=r̄`. So `T(r⁻¹)=φ_x⁻¹ r̄=φ_x⁻¹(εφ_x r⁻¹)=ε r⁻¹`, and on the line `Hom(x∨,x)` the trace is ε.
  - `E^(2)` squares to the identity, so its trace does not depend on the direction of rotation.
- **The Frobenius–Perron route (lines 498–510).** Pseudounitarity makes `leftDimChar ℂ C` positive real on `simpleBasis`, which is a ℤ-basis. So its image lies in ℝ and it corestricts to a ring hom to ℝ that is `≥0` on the basis. `eq_frobeniusPerronChar` identifies it, `frobeniusPerronChar_of` (`FrobeniusPerron.lean:204`) turns it into `frobeniusPerronDim`, and the two `Basic.lean` lemmas close the argument.
- **The groupoid locator (line 513).** `Penneys2018` lines 636–638, printed p. 14: the paragraph after Definition 3.16 defines the universal grading groupoid `U` through the common refinement of faithful gradings. §3.3 starts on p. 13 (line 616), which matches line 525's "§3.3, p. 13".

### Seeded sample

The draw follows the previous review's method: `shuf -n 15`, seeded with the head SHA followed by `-15`, over the 116 page-locator lines of CA1–CA10. It gives lines 476, 531, 774, 1386, 1394, 1406, 1427, 1505, 1513, 1545, 1728, 1921, 1957, 2002 and 2007.
- Only line 476 falls in a changed passage: Ng–Schauenburg Definition 3.1, p. 8. It is exact at `NgSchauenburg2007Pivotal` line 360, on printed p. 8 (line 359), and the source supports the statement as written.
- The other 14 lines lie in text the diff leaves untouched, and I did not re-read them.
- I also checked the other changed locator, Penneys §3.3 after Definition 3.16, p. 14 (above). It is exact.

### Adversarial table

Rows for statements the diff changes or adds, with values computed this round:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA2a `ε=ν₂(x)` (new, ll. 471–477) | unit; ℂ in `Hilb_fd`; g in `Hilb(ℤ/2)`, ω=1; g in `Hilb^ω(ℤ/2)`, ω(g,g,g)=−1, dim g=+1; 2-dim irreps of Q₈ and S₃; generator of ℤ/3 | `ν₂(1)=1=ε`; flip on ℂ⊗ℂ has trace 1, ε=+1 only (l. 566); `+1=+1`; `−1=−1`; Q₈: `(2·2+6·(−2))/8=−1`, J²=−1; S₃: `(4·2+2·(−1))/6=1`; ℤ/3: `Hom(1,g⊗g)=0`, ν₂=0 and no r, outside the hypothesis | sound; the proof route gives `T(r⁻¹)=ε r⁻¹` | none |
| New Check ℂ² / `Hilb(ℤ/2)` (ll. 572–579) | ℂ² in `Hilb_fd`; g, standard and twisted by χ(g)=−1 | trace of flip on `ℂ²⊗ℂ²`: `e₁⊗e₁, e₂⊗e₂` fixed, so 2, while ε(J)=−1 and ε(J′)=+1; `T(f)=φ_g⁻¹f`: +1 standard, −1 twisted; twisted dims −1<0 | sound; it excludes `ν₂:=dim Hom(1,x⊗x)` (4≠2), `ν₂:=−ε` (+1) and φ-independence (−1) | none |
| CA2a pseudounitary ⇔ `IsPseudoUnitary` (route rewritten, ll. 498–510) | `Hilb(ℤ/2)` standard and twisted; Fibonacci; Yang–Lee | `leftDimChar` = (1,1) ≥0, equal to FP; (1,−1), excluded; `d=(1+√5)/2≈1.618`, with `d²=2.618=1+d`, equal to FPdim; `d=(1−√5)/2≈−0.618`, also with `d²=1+d`, negative, excluded | sound | none |
| Tau Ceti contract, 7 new names (ll. 151–177) | each read at the pin | file and line in the table above; hypotheses as described (`ℕ+`, simple unit, `Finite (SimpleClasses C)`) | sound | none |
| U named, Penneys §3.3 (l. 513) | `Penneys2018` | ll. 636–638 on p. 14; Definition 3.16 at l. 625 | exact | none |
| CA2a/CA1a owner (R01) | this README; #1705; main QuantumGroups; #867; #1649 | here ll. 40–46, 466, 471–477; #1705 ll. 33–41, 305–307; main ll. 42, 253; #867 ll. 320–323; #1649 ll. 32–36 | two single-home claims | R01 |

Rows carried from the previous review (`c3fc64a`) for statements this diff leaves untouched, with that review's values:

| Statement | Values computed (previous review) | Result |
|---|---|---|
| CA2a Penneys Thm A (headline) | `χ(g)²=1, χ>0 ⇒ χ=1`; `χ³=1 ⇒ χ=1`; `End†(Hilb_fd⊕Hilb_fd)`, t=4: `dim_L=2`, `dim_R=½` | sound |
| CA2a Hilb(ℤ/2) twist Check (ll. 580–589) | `dim_L=dim_R=−1`: spherical, not pseudounitary, ratio 1 | sound |
| CA2a single point for unitary fusion (ll. 535–538) | `Hilb(ℤ/3)`: U=ℤ/3; `Hilb(S₃)`: U=S₃; `Hom(U,ℝ>0)={1}` | sound |
| CA2a left duals as adjoints (ll. 449–452) | `(coev†, ev†)` typed `x⊗x∨→1`, `1→x∨⊗x` | sound |
| CA2b Penneys Thm C (headline) | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; TL Gram `det=δ²(δ²−1)=2` at δ=√2 | sound |
| CA3 normalizations | `Q=M₂`: `mm†=4`, `m′m′†=1`, `i′†i′=4` | sound |
| CA3 completion (headline) | `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ; `M_n` of dim n² | sound |
| CA4 JP *Q-systems* Thm A (headline) | `d_Q=1`; flip eigenvalue −1; minimal `K=M₂` | sound |
| CA5 JP *Realizations* Thm A (headline) | `N⋊ℤ/2`: `d_Q=2`; `N⋊ℤ` infinite index | sound |
| CA6 HPT *Anchored* Thm A (headline) | `dim P[n]=k^n`; `‖(1,0)‖²=½` | sound |
| CA7 Katsura Thm 8.6 (headline) | ℂⁿ: `(ℤ,ℤ),(0,0),(ℤ/2,0)` for n=1,2,3 | sound |
| CA7 HP I Thms 5.23, 5.25 (headline) | one loop: `C([−2,2])`, `(ℤ,0)`; countable star `a_μ(c)=∞` | sound |
| CA8 HP II Thms A–C, Watatani (headline) | TL(√2): `K₀=ℤ³`, traces `√2−1`, `√2`, 0; `δ²=2,3,4`: N=3,4,5 | sound |
| CA9 HNP Thm A, existence/uniqueness, Tomatsu Thm D (headline) | `F^t=−⊗(ℂ^k)‾`; `M_n⊗̄R_II₁≅R_II₁`; `σ_(nt)` outer for n≠0 | sound |
| CA9 `T(R_III₁)={0}`, Kosaki basic extension | `Γ⊆(2π/T)ℤ`; `Ind=4`, `E₁(e)=¼`; `Ind=25/4` | sound |
| CA10 HPT *Classification* (headline) | tube dims 4, 9, 36; `ū r u⁻¹=−r` | sound |

### Remarks on untouched text

None.

## Not verifiable

- **Ng–Schauenburg, published version** (Contemp. Math. 441 (2007), 63–90, DOI 10.1090/conm/441/08500): paywalled. I read the arXiv text `NgSchauenburg2007Pivotal` (math/0503167v2). The README cites "Definition 3.1 (p. 8, in the numbering of the arXiv version)" at lines 2345–2346, so its locator is into the text I read.
- These items from the previous review concern untouched text and were not revisited: Kosaki 1986, Izumi 1993 and Popa 1995 (`uncertified`), and the published pages of Izumi 2003.

## Source issues

- **Misprint** in `Penneys2018` at Definition 3.16, printed p. 14 (line 625): the source calls a grading one by a "groupid"; it should read "groupoid", as everywhere else in §3.3; affects nothing.
- **Misprint** in `Penneys2018` in §3.3, printed p. 14 (line 650): the source repeats a word, "the group of of monoidal natural automorphisms"; it should have a single "of"; affects nothing.
