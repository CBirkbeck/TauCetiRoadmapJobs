# Review of QuadraticFormInvariants (pull request #617 at 39e8628)

**Verdict:** needs changes

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, Lean `v4.36.0-rc2`. The folder is unchanged since the previous head, so this is a full review of the whole folder. All seven findings are P3. The adversarial pass found no false statement, missing hypothesis or wrong convention.

## R01 (P3) — The gate fails on files outside this folder, and this folder's local-field citations exist only in those files

**Location.** The pull request as a whole, and `TauCetiRoadmap/QuadraticFormInvariants/README.md` 323–335, 1312–1313, 1371–1376 and 1500–1502, which cite "LocalFieldsRamification … *Exact supplier contracts*, items *Valuations and `e`, `f`*, *Units*, *Power classes* and *Unramified extensions*" (and *Finite extensions*).

**Claim.** The gate fails on `outside-folder`. The pull request changes `Completed/LocalFieldsRamification/{COMPLETION.md,README.md,Suggested.lean}` and `Completed/LocalGaloisGroups/{README.md,Suggested.lean}`, and this review's brief does not name either folder as the pull request's own. These changes cannot simply be dropped: this README's Layer 6 cites sections that exist only in the pull request's version of LocalFieldsRamification.

**Witness.** My gate run gives `outside-folder=8 … FAIL`. It lists four of the five files above (not `Completed/LocalGaloisGroups/Suggested.lean`, which `git diff --stat origin/main...HEAD` shows changed) plus the ClassFieldTheory and IntegralLattices files, which the brief does name. All other counts are 0. On main, `Completed/LocalFieldsRamification/README.md` has the headings "Scope and exported contract" (30), "The build, in layers" (70) and so on, and no "Exact supplier contracts". At this head that heading is at line 136, with *Finite extensions* at 156.

**Repair.** Either the pull request carries `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as its own folders (they are the subject of its title), so that the gate passes, or they move to a pull request that merges first and is named in this one's merge-order paragraph. Leave this README's citations as they are: they are correct against that version.

## R02 (P3) — `hilbertSymbol_productFormula` restates a Tau Ceti theorem, and the consumer it is kept for does not use it

**Location.** `Suggested.lean` 126–137 (`theorem hilbertSymbol_productFormula … := TauCeti.hilbertSymbol_productFormula a b`) and its module docstring 36–38: "`hilbertSymbol_productFormula` is the name under which `IntegralLattices` imports Hilbert reciprocity in sign form". Also README 41–42 and 2712–2714.

**Claim.** The declaration closes with one library lemma, and the README says it is "not a local-global classification theorem", so it is not a headline. The justification given for keeping it is false at this head, and no Lean file uses it. It is padding.

**Witness.** `TauCetiRoadmap/IntegralLattices/README.md` 567 defines "**T**: a declaration that exists in Tau Ceti", and 1007 reads "*Needs:* 3E, 3F; T `hilbertSymbol`, `hilbertSymbol_productFormula`". Its `Suggested.lean` (lines 1–12) imports no module of this roadmap. A grep of every `.lean` file on main and at this head finds only a docstring mention, `IntegralLattices/Suggested.lean`:105, which attributes the name to Tau Ceti.

**Repair.** Delete the declaration from `Suggested.lean`. A scratch copy without it elaborates with exit 0 and no diagnostics. Add an eleventh old → new line, `hilbertSymbol_productFormula` → `TauCeti.hilbertSymbol_productFormula`, for the prose citations in GlobalQuadraticForms (README 128, 458, 523) and ClassicalArithmeticCompletion (README 227, 601). Rewrite the attributions in README 41–42 and 2712–2714 and in the module docstring to say that IntegralLattices consumes `TauCeti.hilbertSymbol_productFormula`. 6C item 14 keeps the statement.

## R03 (P3) — No merge order is stated against the four other open pull requests that rewrite this folder

**Location.** The pull request description. Its only merge-order line is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Four other open pull requests change `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`, and their heads conflict with this one. Without a stated order, whichever merges second silently rewrites the other.

**Witness.** `scratch/overlaps.md` reports conflicts with #617 for #1187 (Tau Ceti bump), #1215 and #1411 (ClassFieldTheory), and #1797. For #1215, `diff` of its copy of this README against this head gives 573 lines of difference (2764 against 2780 lines).

**Repair.** Add one sentence to the description naming the order, for example: "#617 merges first; #1215, #1411, #1797 and #1187 rebase their `QuadraticFormInvariants` changes onto it." Alternatively, drop this folder from whichever of them only touches it incidentally.

## R04 (P3) — The supplier contracts cite a Class Field Theory section that does not exist and omit three things the layers consume

**Location.** README 339–340: "That roadmap's `Suggested.lean` re-exports their objects under its own names (its *Consumers, and the names they import*)". README 367–368: "From TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras ([Layers 4 and 6] …)". README 323–325, the LocalFieldsRamification item list. README 341–345, the ClassFieldTheory declaration list.

**Claim.**
1. ClassFieldTheory has no section of that name, on main or at this head.
2. Layer 7B consumes Semisimple Algebras' Layer 5 (Skolem–Noether), but the contract stops at Layers 4 and 6.
3. 6B and 6C consume LocalFieldsRamification's *Finite extensions*, which the contract omits.
4. 6E consumes `TauCeti.ClassFieldTheory.brauerGroupEquivBr`, which the contract's ClassFieldTheory list omits.

**Witness.** At this head, ClassFieldTheory's README has "## 6. Downstream consumers" (1113) and its `Suggested.lean` docstring has "**Names imported by other roadmaps.**" (54). A grep for "Consumers, and the names" matches nothing on main or at the head. This README's 1996–1999 use Skolem–Noether, and 2067–2068 and 2223–2224 cite "Layers 4 to 6". Its 1500–1502 cite LocalFieldsRamification's "*Finite extensions*", and 1535–1541 use `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.finiteExtension_isNonarchimedeanLocalField`, both listed in that item (LocalFieldsRamification README 156). Its 1781–1783 consume `brauerGroupEquivBr`.

**Repair.**
1. Replace the parenthesis at 339–340 with "(its `Suggested.lean`, *Names imported by other roadmaps*, and its README §6 *Downstream consumers*)".
2. Change "[Layers 4 and 6]" to "[Layers 4 to 6]" and add "Skolem–Noether (its Layer 5; Tau Ceti's `TauCeti/Algebra/CentralSimple/SkolemNoether.lean`)" to that list.
3. Add *Finite extensions* to the item list at 324–325, with `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.finiteExtension_isNonarchimedeanLocalField`.
4. Add `TauCeti.ClassFieldTheory.brauerGroupEquivBr` to the declaration list at 341–345.

## R05 (P3) — A Mathlib name that does not exist at the pin

**Location.** README 491, Layer 0 *Contiguous orthogonal bases*: "*Needs:* chain equivalence above; Mathlib `LinearMap.BilinForm.IsOrthoᵢ`."

**Claim.** No declaration of that name exists in Mathlib `1b1ccf4b`.

**Witness.** A `getEnv.contains` check over all 702 dotted names of the README, importing Mathlib and the 234 relevant Tau Ceti modules, reports it missing. Mathlib has `LinearMap.IsOrthoᵢ` (`Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`:59) and `LinearMap.BilinForm.iIsOrtho` (`BilinearForm/Orthogonal.lean`:65). The Tau Ceti file cited at the same place uses `Q.associated.IsOrthoᵢ b` (`Diagonal/Contiguous/Basic.lean`:76).

**Repair.** Write Mathlib `LinearMap.IsOrthoᵢ`.

## R06 (P3) — An acceptance item outside any layer's Examples has no statement, and the owned examples state no values

**Location.** README 2652–2655, in Layer 9's milestone list: "**Finite dyadic specialization**, as the final acceptance example. `K` is a finite extension of `ℚ_2`, … They are the sharpest available test". Also Scope 24–28: "What it does own are the worked examples under each layer's Examples that cite no Tau Ceti declaration". Also the owned examples at 2314–2316 (the `w₁`, `w₂` table over `ℚ_2`) and 2677–2682 (the relative formula over `ℚ_2(√5)`).

**Claim.** Scope says the roadmap owns only worked examples under each layer's Examples. This bullet sits among the milestones and names no field, no `a` and no value, so it is neither a milestone nor a checkable example. The two owned examples ask for tables but give none of the values, so they pin nothing a contributor could get wrong.

**Witness.** The bullet quantifies over every finite `K/ℚ_2`, every `d` and every `a`, where the general Tau Ceti theorem `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` already applies. It states no instance. One instance shows what a stated value looks like: at `K = ℚ_2`, `L = ℚ_2(√5)`, `a = √5` (trace 0, norm −5), the left side is `w₂⟨1,−1⟩ = 0`, and the right side is `(2)∪(5) + (2)∪(5) + (5)∪(−5) = 0`.

**Repair.** Delete the bullet at 2652–2655; the `ℚ_2(√5)` example at 2677 already serves its purpose. In that example and in the Layer 8 table, state the computed values: at least one row whose `N^Ev` term is nonzero, and the `a = √5` row above.

## R07 (P3) — Three cited works are not recorded in the sources manifest

**Location.** README 2733–2738 (Lam, "PRIMARY"), 2759–2762 (Delzant 1962) and 2769–2772 (Gille–Szamuely, "The reference of record for Layers 5 and 7"). They are cited at about forty locators, including four of this review's seeded targets.

**Claim.** The roadmap's `sources.toml` has no entry for these three works, so their locators carry no status. Lam's locators are the most numerous in the README.

**Witness.** The manifest's keys are `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985` and `ekm2008`.

**Repair.** Record Lam (AMS GSM 67, 2005) and Gille–Szamuely (CUP, 2nd ed. 2017) as `uncertified`, with their DOIs and the README's locators. Fetch Delzant, C. R. Acad. Sci. Paris 255 (1962) 1366–1368, through the sources service from an open archive of the Comptes rendus, or record it as `uncertified`.

## Verified sound

**Gate and dependencies.** My gate run (`--base origin/main`) gives every count 0 except `outside-folder` (R01). The dependency check gives `depcheck: 237 roadmaps, 2293 edges, 0 problem(s)`, with no UPWARD and no CYCLE line. This roadmap is on main and absent from `ORDER.txt`. Its suppliers (ClassFieldTheory, ProfiniteCohomology, RepresentationTheory/SemisimpleAlgebras and Completed/LocalFieldsRamification) are all on main.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no diagnostics at all: no `sorry`, no `set_option`, no `lemma`, a single `import Mathlib` plus 12 `TauCeti.*` modules, all present at the pin.

**Signatures.** I elaborated `#check @` for the 8 declarations and the 5 Tau Ceti theorems the `example`s use, plus 20 more cited Tau Ceti theorems, and compared each with the README. No section binder is lost. Specifically:
- `hilbertSymbol_mul` carries local field and `Invertible 2`, matching 6C item 5.
- `discr` carries `Invertible 2` and lands in `Kˣ ⧸ Subgroup.square Kˣ`.
- The Evens example's `t : Kˣ` with `↑t = Tr a` encodes `Tr a ≠ 0`, matching Kahn.
- `galoisEvens2_kummerClass_one_add`'s hypothesis `1 − t²d ≠ 0` matches README 2471.
- `exists_unramified_class`'s `v(Δ−1) ≤ v(4)` is the README's `Δ ≡ 1 mod 4`.
- `exists_of_realization` requires `1 ≤ n`, as 6D says.
- The rank-3 and rank-4 isotropy criteria read `(−1, −d)` and `discr ≠ 0 ∨ s = (−1,−1)`, as written.

**Library names and paths.** 702 dotted names checked in the environment: 695 resolve. One is R05. The six `ProfiniteCohomology.*` prototypes are declared on main in `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` (`cochainClass` 431, `cup` 3868, `inhomogeneousCochain2` 5145, `f2Pairing` 5332, `homClass` 5537, `galoisF2Iso` 5846). This resolves the `citations.md` lead on `f2Pairing`. All 241 Tau Ceti and Mathlib file paths the README cites exist, including the brace-expanded supplier table.

**Pinned declarations opened**, file:line at Tau Ceti `2fd255d9`:
- `Algebra/Quaternion/CentralSimple.lean`:69, 81, 151, 198 (central-simple target).
- `Algebra/Quaternion/BrauerClass.lean`:83–380, 21 statements.
- `RegularFormClass/Hasse/Basic.lean`:118, 133, 144, 169, 241, 253.
- `Hasse/BaseChange.lean`:43; `Clifford.lean`:242, 570, 597, 657, 708; `LowRank.lean`:126, 158.
- `ClassFieldTheory/Brauer/LocalH2Bound.lean`:55–71 (`K L : Type`, both local, `ValuativeExtension`, `Module.Finite`, `IsGalois`, `IsCyclic`, as 6C says).
- `AlgebraicExtension/Basic.lean`:72, 86, 130, 147; `FiniteExtension/Basic.lean`:40, 54.
- `Quaternion/Invariant.lean`:60–96, where `K : Type` matches 6E's universe-0 sentence.
- `Quaternion/Subgroup.lean`:114 and `QuadraticForm/Brauer.lean`:43, both `Type*`, matching "universe-polymorphic".
- `MuTwo/LocalSymbol.lean`:157–224, `Type u`, any field with `Invertible 2`.
- `StiefelWhitney/Transfer.lean`:61–143.

**Cross-roadmap citations resolved.**
- ClassFieldTheory: Layers 5 and 14 at this head (420, 991) and on main (920, 1872). `index_normGroup_of_isCyclic` and `hilbertProductFormula` are listed in Layer 5's and Layer 14's tables (253, 262). Universe 0 is in its Conventions (123).
- ProfiniteCohomology on main: Layers 0–4 and 8–13 at 583–2163. Layer 10 includes corestriction and Layer 13 the `D₁₆` pullback.
- SemisimpleAlgebras on main: Layers 4, 5 and 6 (249, 274, 293).
- LocalFieldsRamification at this head: the four items at 136–200 contain every Tau Ceti declaration this README lists. "Names imported by other roadmaps" is at 591.
- Inbound anchors `#6c-the-hilbert-symbol-and-the-local-hasse-invariant` and `#layer-1-hyperbolic-planes-and-witt-theory` resolve at this head.
- GlobalQuadraticForms' `Suggested.lean` uses only `formClass`, `discr`, `hilbertSymbol`, `localHasse`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one`. All are declared, and the module built at this head. Its prose uses of `hilbertSymbol_comm`, `exists_of_realization` and `hilbertSymbol_eq_cohomological` are covered by the old → new lines.
- OrthogonalSpinGroups `#check`s `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse` (84–86), all declared.
- The consumer lists of QuadraticFormInvariantsPartII (Layers 1, 4, 7A, 7B, 9), GeometryOfNumbersAndQuadraticArithmeticPartII, SpinRepresentations and SchemeAndStackFoundations match what those roadmaps cite.

**Ownership and duplication.** Every milestone is a cited Tau Ceti declaration. The roadmap owns only the worked examples and declares no second carrier; `RegularFormClass` and `formClass` are `export`ed Tau Ceti constants. No `Suggested.lean` in another roadmap I could read declares a name in `TauCetiRoadmap.QuadraticFormInvariants`. The closest open roadmaps (Part II, GlobalQuadraticForms, ProfiniteCohomology) consume this one and own nothing it owns.

**Headlines and padding.**
- The README's three high points (2, 6D, 9) and the 7C cup-norm theorem are stated as `example`s, each closed by its Tau Ceti theorem. The docstring correctly says nothing is unstatable. Layer 7B's comparison is not one of the README's designated headlines.
- The one-term aliases `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` pass the padding probe, but GlobalQuadraticForms' Lean file uses them (63–66 and 498–499). Deleting them would break that build, so they are not findings. `hasseInvariant_eq_localHasse` has a real proof and a Lean consumer.
- `hilbertSymbol_productFormula` is R02.

**Seeded sample, 13 targets.**
- The 9 targets located by a Tau Ceti declaration were checked against that declaration: "Quaternion algebras are central simple"; "The quaternion symbol in `Br(K)`"; "The Hasse invariant"; "Classification in dimension at most three"; "The Clifford invariant"; "The `I²` homomorphism"; "Base change and the remaining API"; "The symbol"; "The classical construction".
- Their source locators in Lam and Gille–Szamuely are listed under Not verifiable.
- "Milestone 1", "Milestone 2" and "Compatibility with the cup product" were checked against `Quaternion/Subgroup.lean`:114, `QuadraticForm/Brauer.lean`:43, `Quaternion/Invariant.lean`:67–96 and `LocalSymbol.lean`:191, 213.
- "The value of the Evens norm on a Kummer class" was checked against `kahn1984` lines 763–765 (Lemme II.2.1, p. 241: both cases, `Tr a ≠ 0` and `Tr a = 0`, as written) and `serre1984cmh` lines 560–562 (Théorème 1′, p. 668, with the `(2)(d_E)` term).

**Other locators read.**
- `kahn1984` line 55 (Théorème 2, p. 224), lines 1044–1058 (Prop. II.3.5, p. 248, read in degrees ≤ 2), and lines 726–729 (II.1.3, Delzant's definition).
- `serre1984cmh` line 54 (§1.2, `w₂` called the Witt or Hasse invariant).
- `kozlowski1984` lines 34–41 (Thm 1.1, p. 309).
- `evens1963` §§4–5 (lines 75 and 168; pp. 54–65).
- `ekm2008` line 2393 (Def. 7.17), lines 2986–2989 (§10) and 3374–3381 (Example 13.5 (2)).

**Adversarial table**, 34 statements, with the values computed on each side. All results hold, so no change is needed for any row.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| H1 four-fold criterion (`Suggested` 59) | ℚ, `(−1,−1)`; any `K`, `a=1`; ℚ₂, `(2,5)` and `(5,5)` | `(−1,−1)`: no `x²+y²=−1`; `⟨1,1,1⟩` and `⟨1⁴⟩` definite, so all five fail. `a=1`: `b=((b+1)/2)²−((b−1)/2)²`, all hold. `(5,5)`: `25−20=5`, all hold. `(2,5)`: symbol −1, all fail | holds |
| H2 local classification (`Suggested` 144) | ℚ₂, `⟨1,1⟩` vs `⟨5,5⟩` and vs `⟨−1,−1⟩`; ℝ control | `d=[1],[1]`, `s=+1,+1`, and `5=1²+2²` gives an isometry. `s=+1` vs `(−1,−1)₂=−1`: not isometric. ℝ: `⟨1⁴⟩`, `⟨−1⁴⟩` have the same `(4,[1],(−1)⁶=+1)` but are not isometric; the local-field instance excludes ℝ | holds |
| H3 cup-norm (`Suggested` 191) | ℝ `(−1,−1)`; ℚ₂ `(2,5)`; `a` a square | cup ≠ 0 ⟺ `−1 ≠ x²+y²`; cup ≠ 0 ⟺ `5 ≠ x²−2y²`; both sides true for a square `a` | holds |
| H4 Evens value (`Suggested` 202; Kahn II.2.1) | ℚ₂, `d=−1`, `a=1+2i`; `a=1`; `a=c∈K` | `Tr=2`, `N=5`: `(2)∪(5)+(2)∪(−1)=(2)∪(5)≠0`. `a=1`: `(2)∪(−d)+(2)∪(d)=(2)∪(−1)=0=N(0)`. `a=c`: `(2c)∪(−dc²)+(2)∪(d)=(c)∪(c)+(c)∪(d)=N(res(c))` | holds |
| H5 relative SW formula (`Suggested` 221; Kahn Th. 2, II.3.5) | `Tr a=0`; ℚ₂(√5) with `a=√5`; degree 1 | LHS `w₂⟨1,−1⟩=0`, RHS `2·(2)∪(d)+(d)∪(Na)=0` since `Na=u²−dv²`. ℚ₂(√5): `0` vs `(2)∪(5)+(2)∪(5)+(5)∪(−5)=0`. Degree 1: `(d·Na)` vs `(d)+(Na)` | holds |
| `discr` (`Suggested` 80; Layer 3 Checks) | rank 0; `⟨1,−1⟩`; `⟨1,1⟩`; `⟨1⟩`, `⟨4⟩` | `[1]`; `[−1]` (`d±=[1]`); `[1]` (`d±=[−1]`); both `[1]` | holds |
| `localHasse` (`Suggested` 102; 6C Checks) | `![−1]` and `![−1,2]` over ℚ₂; `![−1,−1]` over ℚ₂, ℝ, ℚ₃ | `+1`. `(−1,2)₂=+1` while O'Meara's product is `(−1)(+1)(+1)=−1=s·(−2,−1)₂` (`x²+2y²≡1,3 mod 8`). Values `−1,−1,+1` | holds |
| `hasseInvariant_eq_localHasse` | `n=0,1`; ℚ₂ `![−1,−1]` | `ε(1)=1=` empty product; `s_Br=[ℍ(−1,−1)]`, `ε=−1=(−1,−1)₂` | holds |
| `hilbertSymbol_productFormula` | ℚ: `(−1,−1)` and `(2,5)` | `(−1)₂·(−1)_∞=+1`; `(2,5)₂=−1`, `(2,5)₅=(2/5)=−1`, product `+1` | holds (R02 concerns padding only) |
| S1 central simple (1129) | `ℍ[K,a,0,b]`; control `a=0` | `c₃(c₂²+4c₁)=4ab≠0`; `a=0` gives `i²=0`, not simple, excluded by `a:Kˣ` | holds |
| S2 symbol in `Br(K)` (1142) | `⟨2,−1⟩≅⟨1,−2⟩`; ℚ₂ bilinearity at `(−1,3)`, `(−1,7)`, `(−1,21)` | `2·1−1=1` is represented and both discriminants are −2, which forces `β([2],[−1])=1`. Symbols `−1, −1, +1` (`21≡5=1+4`), product consistent | holds |
| S3 Hasse invariant (1168) | `⟨a⟩⊥⟨b⟩`; scaling expansion | `[(a,b)]=1·1·[(a,b)]`; `∏_{i<j}(λaᵢ,λaⱼ)=(λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds |
| S4 classification in dim ≤ 3 (1189) | ℝ `⟨1,1⟩` vs `⟨−1,−1⟩`; control in dim 4 | `d` equal, `s=1` vs `[ℍ]`: not isometric. ℝ `⟨1⁴⟩` vs `⟨−1⁴⟩`: same `d`, `s`, not isometric, so `≤3` is needed | holds |
| S5 Clifford invariant (1199) | `⟨1ⁿ⟩`/ℝ, `n=1..8`; `⟨−1,−1,−1⟩`; general ternary | `C(n+1,4)=0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1`, matching `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ`. `C₀≅ℍ`, formula `[ℍ]³=[ℍ]`. `C₀⟨a,b,c⟩=(−ab,−bc)=s·(−1,abc)·(−1,−1)` | holds |
| S5′ `I²` reduction (1217) | `m=1..5` | `C(2m+1,4)=0,5,35,126,330` parity `0,1,1,0,0` equals `m(m−1)/2` parity | holds |
| S6 `I²` homomorphism (1222) | ℝ: `⟨1⁴⟩⊥⟨1³⟩`; `⟨1,1⟩⊥⟨1⟩` | `⟨1⁴⟩∈I²` (`d±=(−1)⁶=1`): `c(⟨1⁷⟩)=1=[ℍ][ℍ]`. Neither summand in `I²`: `[ℍ]` vs `1·1` | holds |
| S7 base change and rank ≤ 1 (1259) | hyperbolic plane; rank 0 and 1 | `s⟨1,−1⟩=[(1,−1)]=1`, `c=s` at `n=2`; empty products | holds |
| S8 the symbol (1506) | `(1,b)`; `𝔽₂(t)`; `(−1,3)` over ℚ₂, ℚ₅, ℚ; `(−1,21)` over ℚ | `((b±1)/2)` witness; `(t,1)=+1`, `(1,t)=−1` since `x²−y²=(x+y)²`; `−1,+1,−1`; `−1` vs `(−1)(−1)=+1` | holds |
| S9 classical construction (1530) | split `a`; Tau Ceti signature | `K×K` norm surjective; `LocalH2Bound.lean`:55–71 hypotheses as stated | holds |
| S10 Milestone 1 (1735) | ℚ₂ | `Q=\{1,[ℍ(−1,−1)]\}`, `ε[D]=−1=localHasse ![−1,−1]` | holds |
| S11 Milestone 2 (1750) | ℚ₂ `(2,5)`; universe | `inv=1/2 ⟺ (2,5)=−1`, true; `Invariant.lean`:60 has `K : Type` | holds |
| S12 cup compatibility (1772) | ℚ₂ `(2)∪(5)`, `(5)∪(5)` | `≠0 ⟺ −1`; `=0 ⟺ 5=5²−5·2²` | holds |
| S13 Evens corollaries (2470) | `1+t√d` at `t=2`, `d=−1`; `√d` | `(2)∪(1+4)=(2)∪(5)` from the general formula with `(2)∪(−1)=0`; `Tr=0` gives `(2)∪(d)` | holds |
| Layer 0 rank one (474) | ℚ `⟨1⟩`, `⟨4⟩` | isometry `x↦2x`; a binary step needs two slots, so no chain | holds |
| Layer 4 Checks (991–1000) | `W(ℂ)`, `W(ℝ)`, `W(𝔽₃)`, `W(𝔽₅)`; `⟨2⟩` in `W(ℚ)` | `ℤ/2`; `ℤ`; `⟨1,1⟩` anisotropic and `⟨1⁴⟩≅2ℍ`, so `ℤ/4`; `(ℤ/2)²`; `⟨2⟩≠k⟨1⟩` (definiteness and `2∉ℚ²`) | holds |
| 6A counts (1342) | ℚ₂; ℚ₂(√5); ℚ₂(√2) | `4·2=8`; `4·4=16`; `4·2²=16` | holds |
| 6B defects (1386, 1411, 1493) | ℚ₂: `1, 5, −1, −5, 5/4` | `δ=∞, 2, 1, 1, 0` (`5/4−1/4=1`); `𝔡(−5)=2ℤ₂≠8ℤ₂` | holds |
| 6B discriminant `𝓂^{2e−d+1}` (1419) | ℚ₂(i), ℚ₂(√3) | `d=1, e=1`, so `4ℤ₂`, matching `disc −4` and `disc 12` | holds |
| 6B case 3 (1489) | ℚ₂, `a=−1` | `U₂=1+4ℤ₂⊆N` (`5=1+4`); `3` is not a norm (sums ≡ `1,2,5 mod 8`) | holds |
| 6B ramified control (1803) | `K=ℚ₂(π)`, `π²=2`, `a=5` | `(π+½)²−5/4=1+π`; the families are `≡1 mod 2` (`u²≡1`, `t²≡t₀²`), while `1+π` is not | holds |
| 6C table (1643) | basis `{−1,2,5}` | Gram rows `(1,0,0),(0,0,1),(0,1,0)`, det `=1` over `𝔽₂`; Serre's formula gives `(2,5)=(−1,−1)=−1` and `(5,5),(2,−1),(−1,5),(2,2),(−1,2)=+1` | holds |
| 6D realization and isotropy (1688–1704) | ℚ₂: `(2,[1],−1)`; `⟨1,1,1⟩` | `⟨−1,−1⟩` has `d=[1]`, `s=−1`. `s=+1≠(−1,−1)=−1`, so anisotropic | holds |
| Layer 8 Clifford comparison at `n=3` (2317) | `A₃`, `B₃` | `C(2,2)=1`, `C(4,4)=1` | holds |
| Layer 9 `Pin⁺` and SD₁₆ control (2483, 2662) | matrices; ℚ₂, `d=−1`, `t=2` | `e₁e₂=[[0,1],[−1,0]]=−e₂e₁`; `(e₁t)⁴=−1`; `e₁` acts as `diag(−1,1)`; `(2)∪(5)+(−1)∪(−1)=0≠(2)∪(5)` | holds |

## Not verifiable

- **Lam, *Introduction to Quadratic Forms over Fields*, GSM 67 (2005).** Every Lam locator: I.2.3, I.3.4–3.5, I.4.1–4.9, I.5.1–5.2, I.7, II.1, II.3, III.2.2, III.2.7, III.2.11, III.4.2, V.3.4, V.3.12, V.3.16–3.21, p. 119, the p. 120 Wall caution, VII §1, Ch. X. It is not in the manifest (R07) and is paywalled by AMS; I know of no legal open copy. This affects seeded targets 2–6. The mathematics of each of those targets was recomputed above.
- **Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*, 2nd ed., 2017.** Locators 1.1.9, 1.5.2, 4.4 and 4.7. Not in the manifest; paywalled by CUP.
- **Serre, *A Course in Arithmetic*; O'Meara §63; Serre, *Local Fields*; Scharlau; Milnor 1970.** All settled as `uncertified` (paywalled). Their locators are recorded, not read. The Serre III Thm 1 formulas and the IV Thm 6 and 7 and Prop. 6 statements were recomputed in the table instead.
- **Delzant 1962.** Not in the manifest, and this job edits no manifest, so it was not fetched. `kahn1984` lines 727–729 confirm that Kahn takes the definition from Delzant.

## Source issues

- none
