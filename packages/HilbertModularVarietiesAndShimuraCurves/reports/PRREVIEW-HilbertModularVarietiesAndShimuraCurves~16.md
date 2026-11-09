# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 388e2e6)

**Verdict:** needs changes

This is an incremental re-review of the 72 lines changed since 7c9252d (the head the previous review read). The change is confined to `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`: four source lines re-pointed (BC91 page ranges, the MS19 and NT16 locators of §§R18.4.3–R18.4.4) and the notation repairs of the previous R04. Nothing changed outside the folder and `Suggested.lean` is untouched. Three of the four previous findings are repaired and the repairs introduced no new problem. One finding remains, carried from the previous two reviews; it concerns a second owner in another open pull request and nothing in this folder changes for it.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` at 388e2e6. Line numbers in other roadmaps refer to the README at the head named.

## R01 (P2) — ArithmeticFuchsianGroups §1.2 restates the e=1 case of §R18.5.16a item 1 without citing it

Carried over from R01 of the previous two reviews. No repair report marks it `not actionable in this package`, and the other pull request has not moved.

**Location.** README:2365, §R18.5.16a item 1: the two maximal orders containing `O₀(𝔭^e)` are the ends of the path of length e in the tree of homothety classes, over every discrete valuation ring.

**Claim.** This roadmap is at merge-order line 160 and owns the local form of Eichler orders. ArithmeticFuchsianGroups (merge-order line 284) states the e=1 case as its own target in §1.2, and its *Needs:* line does not name this roadmap, so one object has two owners.

**Witness.** ArithmeticFuchsianGroups at its open head 5fdb26da, unchanged since the previous review: README:575–577 states the order-to-tree adapter (adjacent vertices give maximal orders meeting in an Eichler order of level `v`); the *Needs:* line at README:620–623 lists §1.1, EndoscopicTransferAndUnitaryTraceComparison §6.2, AdelicAlgebraicGroups AA.2.4 and AA.4.2, ClassicalArithmeticCompletion §7.60, ReductiveGroupsPartII RG2.2.1–RG2.2.4, FuchsianOrbifolds L2.1, and not this roadmap. By contrast QuaternionArithmetic at 4a6edeb8 now consumes §R18.5.16a item 1 (its README:108, 291, 773), which is the shape the repair asks for.

**Repair.** Nothing in this folder changes. In ArithmeticFuchsianGroups: the §1.2 *Needs:* line adds HilbertModularVarietiesAndShimuraCurves §R18.5.16a, item 1 at e=1, and the adjacency clause of the adapter is marked as consumed; the vertex bijection and the normalizer statements stay its own. If that edit cannot be made from this pull request, the repair report records this finding as `not actionable in this package` with that reason, which settles it.

**Test of the repair.** Over `ℤ₂`, the adjacent lattices `ℤ₂²` and `ℤ₂⊕2ℤ₂` have endomorphism rings meeting in `O₀(2)`; `[GL₂(ℤ₂):K₀(2)]=#ℙ¹(𝔽₂)=3`, agreeing with ArithmeticFuchsianGroups' own Check that `Γ₀(2)` has index 3 (its README:616).

## Previous findings

- R01 — not repaired: ArithmeticFuchsianGroups is still at 5fdb26da; its §1.2 *Needs:* line (README:620–623) does not name this roadmap. Written again as R01 above. The QuaternionArithmetic half stays repaired at 4a6edeb8.
- R02 — repaired: README:1862 now reads “BC91 Part II §2, pp.73–77, with special modules at (2.1), p.73; (5.16), p.98; Definition 8.1, p.107”. In the cache (printed page = PDF page − 5): §2 opens at BC91 line 2558 on p.73, with (2.1) at lines 2559–2567; §3 opens at line 2704 on p.77, so §2 ends on p.77; (5.16) is at line 3428, p.98; Définition (8.1) at line 3773, p.107. The statement of §R18.5.4 is unchanged and supported.
- R03 — repaired: README:3430 now cites MS19 §§2.9–2.10, Propositions 2.3–2.4, pp.9–10, and NT16 Proposition 3.7(3). MS19 lines 426–480: §2.9 and Proposition 2.3 (`H⁰` and `H²` Eisenstein) on p.9, the duality `H²(X_K,A)≅H⁰(X_K,A∨)∨` and the adjoints `S_v*=S_v⁻¹`, `T_v*=S_v⁻¹T_v` at lines 469–471 on p.10, §2.10 and Proposition 2.4 (coefficients `L_M`) at lines 472–480 on p.10. README:3440 (§R18.4.4) now cites NT16 Proposition 3.7(1)–(3), pp.31–32: NT16 lines 1412–1424, the statement starts on p.31 and items 1–3 are on p.32; item 3 exchanges the transpose of `[Ug⁻¹U]` with `[UgU]` as the README says.
- R04 — repaired: the README has no occurrence of `B̌ times`, `π₂,*`, `O_B, p`, `O_B′, p`, `O_E, p`, `O_B, v` or `A_F, f` left; README:2534 now writes `B̌×\[M_n×B̌(A_f^v)×/U]`, matching README:2554, and README:2805 names Mathlib's `DoubleCoset.Quotient` of `D×` and `U·A_{F,f}×` in prose (the declaration exists at the pin, Mathlib/GroupTheory/DoubleCoset.lean line 79). The other 30 changed lines are the same subscript repairs in §§R18.1.9, R18.2.1, R18.2.3, R18.2.7, R18.3.1, R18.3.8–R18.3.10, R18.3.28, R18.4.2, R18.4.14–R18.4.15, R18.4.20, R18.5.7, R18.5.10, R18.5.13, R18.5.15 and R18.5.20, with no change of mathematics.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's gate at 388e2e6 has every rule 0 including `build=0`, `OK`. I reran the gate on this head: every rule 0, `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 237 roadmaps, 2317 edges, 0 problem(s)`, exit 0. No UPWARD, CYCLE or moved line; this roadmap is at merge-order line 160.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree root exits 0 with no output. The file is unchanged since 7c9252d: `module`, `public import Mathlib`, the module docstring naming the headline theorems and what each lacks, and an empty namespace. No `set_option`, no declaration, no sorry; the `#check @` comparison and the one-tactic padding probe are vacuous.
- **Outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the folder: none.

### The changed passages

Every changed line was mapped to its target (36 insertions in 20 targets). The four changed source lines were opened in the cache:

| README line | Target | New locator | Checked at |
| --- | --- | --- | --- |
| 1836 | §R18.5.3 Standard Drinfeld formal model | BC91 Part I §3, pp.53–55 (was 53–56) | §3 opens at BC91 line 1799 (PDF 58 = p.53): vertex charts (3.1), edge charts by blow-up with coordinates ζ and ζ/π (3.2), gluing along a finite subtree and the special fibre as a tree of `P¹_k` dual to the tree (3.3), lines 1800–1859; §4 opens at line 1860 (PDF 60 = p.55). Supports the API bullets at README:1824–1828. |
| 1862 | §R18.5.4 Special formal quaternionic moduli | BC91 Part II §2, pp.73–77; (2.1) p.73; (5.16) p.98; Def. 8.1 p.107 | lines 2558–2703 (PDF 78–82), 3428 (PDF 103), 3773–3778 (PDF 112): the rank-one Lie condition over `B⊗_O O′`, the height-4 special module and its framing, the functor of pairs with a height-zero quasi-isogeny. |
| 1906, 2023 | §§R18.5.7a, R18.5.7 | BC91 Part III §§5.1–5.3.2, pp.139–142 (was §§5.1–5.3) | 5.1 at line 5055 (PDF 144 = p.139): the double-coset set `Z_U` and the stabilisers; Théorème (5.2) at line 5091 (p.140); 5.3.1 at line 5131 (p.141): finitely many orbits, union of quotients `Γ\Ω̂⊗Ẑ_p^nr`; 5.3.2 at line 5161 (p.142): the normal small subgroup and passage to the finite quotient. 5.3.2 runs four lines onto p.143 (lines 5179–5183, the rigid-analytic reformulation), which the range does not need. |
| 1998 | §R18.5.11 Separated Drinfeld quotient charts | BC91 Part I §§2–3, pp.51–55 (was 51–56) | §2 opens at line 1733 (PDF 56 = p.51), §4 at line 1860 (p.55). |
| 3430 | §R18.4.3 | MS19 §§2.9–2.10, Props 2.3–2.4, pp.9–10 | lines 426–480; see R03 above. |
| 3440 | §R18.4.4 | NT16 Prop. 3.7(1)–(3), pp.31–32; MS19 §2.9 proof of Prop. 2.3, p.10 | NT16 lines 1412–1429; MS19 lines 469–471. |

The seeded sample (Definition, Theorem, Construction and Comparison paragraphs) was applied where it falls in the changed passages: the labelled paragraphs touched are §R18.1.9 Comparison, §R18.5.10 Theorem, §R18.5.7 Construction, §R18.2.1 Construction, §R18.2.3 Definition, §R18.2.7 Comparison, §R18.5.15 Theorem, §R18.5.20 Comparison, §R18.3.1 Definition, §R18.3.8 Theorem, §R18.3.10 Theorem, §R18.4.14 Definition, §R18.4.15 Theorem and §R18.4.20 Theorem; in each the change is notation only, and their locators are the ones the previous review verified (its sample rows 3, 7, 14 and 15 cover §§R18.5.4, R18.5.10, R18.5.16 and R18.4.3).

### Adversarial pass

Rows for the untouched statements carry forward from the previous report's table (its 60 rows at 7c9252d, each with computed values; the folder outside the 72 changed lines is byte-identical). New rows for every changed statement:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §R18.1.9 twisted diagonal `z↦(z,z⁻¹)` | `G″=B××_{F×}E×` with `a∘(b,e)=(ba⁻¹,ae)` | the identified pairs are `(b,e)~(bz⁻¹,ze)`, so the kernel of the product datum is `{(z,z⁻¹)}={(a⁻¹,a)}`; agrees with the §R18.1.5 Check `(a⁻¹,a)↦ν=(1,1)` and with §R18.2.7's `Δ(z)=(z,z⁻¹)` | Correct |
| §R18.2.3 `H_n[m]` fibre | `B_p/O_{B,p}`, m a two-sided ideal above p | `x∈B_p/O_{B,p}` killed by m iff `mx⊂O_{B,p}` iff `x∈m⁻¹O_{B,p}`, so the fibre is `m⁻¹O_{B,p}/O_{B,p}`; at `m=(p)`, `M₂(ℚ_p)`, order `p⁴` as in the Check | Correct |
| §R18.3.1 `Γ_t=(U·A_{F,f}×∩t⁻¹D×t)/F×` | D totally definite, U compact open | `D×/F×` is discrete in `D_f×/A_{F,f}×` and the image of `U` is compact, so the intersection is finite; two representatives `t, dtuz` give conjugate stabilisers `Γ_{dtuz}=(uz)⁻¹Γ_t(uz)` | Correct |
| §R18.3.10 norm target `T=((A_{F,f}×)²V∩F×)/(F×)²` | `F=ℚ(√10)`, `x=2` | `(2)=(2,√10)²`, even valuations everywhere, so `2∈T`; `2=a²u` is impossible since `N(a)=±2` needs `a²≡±2 (mod 5)`; so `T→Cl[2]=ℤ/2` hits the nontrivial class; kernel: `(x)=(a)²` gives `x∈a²O_F×`, and `O_F×∩(F×)²=(O_F×)²` | Exact sequence correct |
| §R18.4.3 `m*` | `(T_v,S_v)=(1,2)` over `𝔽₇` | `S⁻¹=4` (since `2·4=8≡1`), `ι(T)=4·1=4`, `ι(S)=4`; `(4,4)≠(1,2)`; the sequence `0→L_O→L_O→L_k→0` gives `H¹_m[λ]↞H⁰(L_k)_m=0` and `H²(L_O)_m/λ↪H²(L_k)_m=0` | Correct |
| §R18.4.14 `G_(q,T,S)` | `q=2,T=3,S=2`; `S=1` | `G(0,1)=(S⁻¹T,q+1)=(3/2,3)`; `Δ=9−9/2≠0`; for `S=1`, `Δ=9−9=0` and `G(1,−1)=(3−3,3−3)=(0,0)` | Correct |
| §R18.4.15 `δ†δ` | `δ=π₁*+π₂*`, `δ†=(π_{1,*},π_{2,*})` | entries `π_{1,*}π₁*=q+1`, `π_{2,*}π₂*=q+1`, `π_{2,*}π₁*=T_w`, `π_{1,*}π₂*=S_w⁻¹T_w` (the inverse double coset of `diag(π_w,1)` is `diag(1,π_w⁻¹)=π_w⁻¹·diag(π_w,1)`); matches `G` entrywise | Correct |
| §R18.4.20 dimensions | `r,g,j=4|Σ|−1` | `dim R_∞=(r+j−g+1)+g=r+j+1`; `dim S_∞=1+r+j`; equal | Correct |
| §R18.5.4 heights | `[K:ℚ_p]=2`; `[π]` | relative height 4, absolute `4·2=8`; `deg[π]=q⁴=p^{4f}`, absolute isogeny height `4f`, group height `4ef`; differ iff `e>1` | Correct |
| §R18.5.10 parity | `b` with `ord_v Nrd b=0` | vertex parity is `ord_v det` mod 2, so displacement is even; “greater than 2 and even” excludes exactly displacements 0 and 2 | Correct |
| §R18.5.11 dualizing degree | `q=2` | `−2+(q+1)=1>0` | Correct |
| §R18.5.3 edge chart | BC91 (3.2) coordinates `ζ`, `ζ/π` | product of the two component coordinates is `π`: local equation `xy=π`; for `e=2`, `xy=π′²` is not regular | Correct |

### Citations, overlaps, ownership

- **Overlaps.** No other open pull request changes this roadmap and no cited id is dropped. AlgebraicTopology Layer 6 (README:46, 3607, 3615) exists only at #1652; the pull request's merge-order paragraph names #1652, as the rule requires.
- **Resolve leads.** The six names in citations.md are the same six the previous review resolved (ArithmeticLocallySymmetricSpaces, ShimuraVarieties, ClassicalArithmeticCompletion, two pinned module names); none is in a changed line.
- **QuaternionArithmetic (#1722, 4a6edeb8).** Still consumes §§R18.5.16a–R18.5.16c and R18.5.17a (README:108–118, 209, 291–310, 773). The R01 half repaired at r15 stays repaired.
- **Mathlib at the pin.** `DoubleCoset.Quotient` is `def Quotient (H K : Set G) : Type _` at Mathlib/GroupTheory/DoubleCoset.lean line 79, so the prose carrier named at README:2805 exists.

### Remarks on untouched text (not findings)

- README:4296 `d_i,b` and README:3866, 3877 `σ_ps,k` have the same comma-subscript form the R04 repair removed elsewhere (`d_{i,b}`, `σ_{ps,k}`); the previous review passed these lines.
- README:1906 and 2023 cite BC91 Part III §§5.1–5.3.2 as pp.139–142; the last four lines of 5.3.2 are on p.143.

## Not verifiable

- **Tay02, PRR23 §1.4.2 and the Voi21 printed pages** remain as in the previous review (image-only scan; paywalled edition; paywalled host). None is cited in a changed line.

## Source issues

- none new in the changed locators. The three items of the previous report (MS19 p.35 misprint `g(xω)`; CDN20 §1.2 ball centres; KW09 Lemma 7.2 gap) stand and were not re-checked here.
