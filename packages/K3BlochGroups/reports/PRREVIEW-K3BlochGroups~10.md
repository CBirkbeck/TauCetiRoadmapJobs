# Review of K3BlochGroups (pull request #1430 at d0c9190)

**Verdict:** accepted

This is an incremental re-review of the 2 lines that changed since feadaba (1 insertion, 1 deletion, all in `TauCetiRoadmap/K3BlochGroups/README.md`). The diff applies the repair of the previous report's single finding. It deletes the sentence of §4.9 that credited ArithmeticKTheory §7.5 with a Moore-spectrum divisibility and an η⁴=0 proof, and keeps the sentence "Since 12ν=2·(6ν), the relation also places η³ in 2π₃S." `Suggested.lean` is byte-identical to feadaba, and nothing outside the folder changed.

This report has no findings.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/K3BlochGroups/README.md:1358` now reads only "Since 12ν=2·(6ν), the relation also places η³ in 2π₃S." The Moore-spectrum and η⁴=0 credit to ArithmeticKTheory §7.5 is gone, and no other line of the README mentions it.

## Verified sound

### Gate, dependency check and elaboration

My run of the gate at this head:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at d0c9190 also reports `build=0` (the targeted `lake build TauCetiRoadmap.K3BlochGroups.Suggested`), with every check passing.

Output of the dependency check (`gate --depcheck … --movable`):

```text
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. Merge positions in the merge order:

| Roadmap | Position |
| --- | --- |
| EllipticCohomology | 7 |
| StringOrientation | 12 |
| StableHomotopyKTheory | 17 |
| K3Surfaces | 132 |
| ArithmeticKTheory | 133 |
| MotivicEtaleKTheory | 134 |
| K3BlochGroups | 135 |

BordismFormalGroups and GeneralizedCohomology are on main.

- **Elaboration.** `lake env lean` on `TauCetiRoadmap/K3BlochGroups/Suggested.lean` prints exactly eight warnings, each `declaration uses sorry`, at lines 44, 99, 112, 124, 137, 149, 161 and 174. There are no errors and no other warnings. The file has eight theorems and five definitions.
- **Signatures.** I put `#check @name` for all 13 declarations in one scratch file that imports the built module, and elaborated it once. All 13 elaborate.
  - Each type is identical to the corresponding entry of the worker's `signatures.md` and to the comparison in the previous report.
  - The only `variable`-level item is `universe u`. Every declaration carries its own binders: `[Infinite F]`, `[Finite F]`, `[CharP F p]`, `[Fact (Nat.Prime p)]`, `[NeZero m]`, `[IsFormallyReal F]`, `4 ≤ Nat.card F`, `i ≤ n` and `2 * i ≤ n`. No binder is lost.
  - Nothing changed in the Lean file, so no README-against-Lean comparison changed.
- **Outside the folder.** `changes.md` lists no file, and the gate reports outside-folder=0.

### The changed passage and everything that cites it

The kept sentence is true. With ν a generator of π₃S≅ℤ/24:
- 2π₃S={0,2,…,22}ν has order 12 and contains 12ν=2·(6ν).
- For any other generator uν (u odd), 12uν=12ν, and 2·(6uν)=12ν again.
- The sentence is a consequence of `etaCube_eq_twelveNu` and asserts nothing new, so it needs no locator of its own.

The deleted sentence leaves no residue:
- A grep of the README for `Moore`, `η⁴`, `eta_pow_four` and `2π₃` finds only:
  - line 99, the unrelated Moore-product hypotheses of KTheoryFiniteLocalFields §1.8's Chern operations;
  - line 1358, the kept sentence;
  - line 1367, Check 4.
- Check 4 derives η⁴=12(ην)=0 from π₄S=0 itself, and the deleted remark was not needed for it.
- `roadmaps grep` over main and all 475 open heads:
  - finds no roadmap that cites K3BlochGroups §4.9;
  - finds the phrase "η³ in 2π₃" only at K3BlochGroups README line 1358;
  - finds "Moore-spectrum divisibility" nowhere.

ArithmeticKTheory §7.5 is re-resolved at its open head e6275108. Its §7.5, "Vandiver and the conditional integer table", starts at its README line 3905, and the sphere material sits in it at lines 3958–4030. The K3BlochGroups contract at line 111, the §4.9 proof at line 1356, Check 4 at line 1367, the §4.9 *Needs:* at line 1369 and Layer 4's dependencies at line 1765 cite these items, each of which is present:

| Item cited from ArithmeticKTheory §7.5 | Where at e6275108 | Status |
| --- | --- | --- |
| the target `sphereAdamsNovikovLowE2` on BordismFormalGroups F4's normalized cobar complex and F3's Hazewinkel generators | lines 3966–3969 | present |
| η_R(v₁)=v₁+pt₁ and Δ(t₁)=t₁⊗1+1⊗t₁ | lines 3971–3976 | present |
| sparseness: q∣t, and t≥qs for s≥1 | lines 3977–3980 | present |
| the zero line E₂^(0,t)=0 for 0<t<2(p²−1) | lines 3981–3983 | present |
| E₂^(1,2)=ℤ/2·α₁ at p=2 | lines 3984–3985 and 3987–3988 | present |
| π₄S=0 (from HomotopySpheres §9.2 by GeneralizedCohomology G2.5) | lines 3958–3961 | present, so "proves π₄S=0" stands |
| d₃ onto E₃^(4,8)=ℤ/2·α₁⁴ | lines 4001–4012 | present |

The cobar basis of C^(2,6) used in §4.9 is v₁[t₁|t₁], [t₁|t₁²], [t₁²|t₁]. It is the same basis that ArithmeticKTheory uses at lines 3990–3991 for its (2,6) computation, so the two roadmaps agree on the carrier.

The other consumers of §4.9 are unchanged and were re-read at this head:
- line 11 (ownership);
- line 85 (StableHomotopyKTheory §7.1 stems);
- lines 111 and 115 (contracts);
- line 1601 (π₃ˢ/(η³)≅ℤ/12);
- line 1608 (§4.16 uses η³=12ν≠0);
- line 1620 (the 𝔽₂ Check);
- line 1765 (Layer 4 order).

None of them used the deleted remark.

Hatcher's locator for the relation (§4.2, p.385; hatcher line 16749–16752) was re-read. It says that the 2-primary diagram shows η³=4ν in the 2-component, and that 2η=0 makes η³ the unique element of order two in ℤ/24, namely 12ν. This supports §4.9 as written.

### Seeded sample where it falls in the changed passages

None of this round's sampled targets lies in the changed passage (§4.9) or cites it. The sample is §§1.2, 2.5, 3.6, 3.13, 3.16, 4.3, 4.7, 4.17, 4.18, 4.19, 5.3, 5.8, 6.1, 6.4 and 6.6.
- Their headings are unchanged at this head, at README lines 190, 512, 763, 960, 1053, 1199, 1300, 1627, 1639, 1673, 1836, 2001, 2057, 2153 and 2264.
- Their text is byte-identical to feadaba.
- Their locator checks stand from earlier reviews of this folder:
  - the full review at 15e2117 checked §§1.2, 2.5, 3.13, 4.3, 4.17, 4.18 and 6.6 against weibel, cgz2021 and hutchinson2013;
  - the reviews at 12c408e, c9ca311 and feadaba checked §§3.6, 3.16, 4.7, 4.19, 5.3, 5.8, 6.1 and 6.4.
- The README flags no locator as unverified (a grep for "unverified" and "uncertified" finds nothing).

### Adversarial computations

The first rows cover the changed passage and the statements it touches, recomputed this round. The rows after them carry the previous report (at feadaba) for the untouched sampled targets and headline theorems, with values recomputed where shown.

| Statement / defining law | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| §4.9 kept sentence: η³∈2π₃S | π₃S=ℤ/24 with generators ν, 5ν, 7ν, 11ν; the 2-local image in ℤ/8; negative control 8π₃S | 12ν=2·6ν. With 5ν: 2·(6·5ν)=60ν=12ν. 2π₃S has order 12 and contains 12. In ℤ/8 the image 4=2·2 lies in 2ℤ/8. 8π₃S={0,8,16}ν does not contain 12ν, so the sentence is not trivially true of every subgroup nℤ/24. | Correct; needs no locator, since it follows from `etaCube_eq_twelveNu` |
| §4.9 deleted remark (credit to ArithmeticKTheory §7.5) | ArithmeticKTheory head e6275108, lines 3958–4030 | That text derives d₃ onto (4,8) from π₄S=0 alone. It mentions neither a Moore spectrum nor η⁴. With the remark gone, no claim about that section's content remains. | Repaired (R01) |
| §4.9 `etaCube_eq_twelveNu` (unchanged; recomputed because the sentence depends on it) | ℤ/24, odd units k | 2η³=(2η)η²=0, and η³≠0 because its class α₁³ in E_∞^(3,6) is nonzero. The elements of order 2 in ℤ/24 are {12}. 12k≡12 mod 24 for k∈{1,5,7,11,13,17,19,23}. ℤ/24/{0,12}≅ℤ/12. | Correct |
| §4.9 Check 4 against the re-resolved supplier | d₃ from (1,6); ArithmeticKTheory lines 4001–4012 | 1+3=4 and 6+3−1=8. (1,6) has t=6≡0 mod 2. E₃^(4,8)=E₂^(4,8)=ℤ/2·α₁⁴, with no d₂ in or out because the neighbouring bidegrees (2,7) and (6,9) have odd t. η⁴=η·12ν=12(ην)=0, since ην∈π₄S=0. | Consistent with the supplier |
| §4.9 `sphereAdamsNovikov_alphaOneCube` (carried from the previous report, re-derived) | C^(3,6), C^(4,6), C^(2,6) at p=2 | C^(3,6)=ℤ_(2)[t₁\|t₁\|t₁] and C^(4,6)=0. The coboundaries of v₁[t₁\|t₁], [t₁\|t₁²] and [t₁²\|t₁] are ±2[t₁\|t₁\|t₁], so E₂^(3,6)=ℤ/2. No d_r enters, since its source is (1,5) (odd t), (0,4) (zero line) or negative filtration. No d_r leaves, since its target (3+r,5+r) has t<2s. | Correct |
| §4.16 (consumer; carried) | ν↦5ν, ν↦−ν; F=𝔽₂ | 12·5ν=12ν and 12·(−ν)=12ν. For 𝔽₂, π₃(BM⁺)=ℤ/24, the quotient by {0,12ν} is ℤ/12, and setting η³=0 would give ℤ/24. | Carried; unchanged |
| §1.2 canonical comparison (sampled; carried from the reviews at c9ca311 and 2fe1218) | All carriers C₅; q is multiplication by 2; the other maps are the identity | c(1)=2⁻¹=3 in C₅ and c⁻¹(3)=1. Using q in the forward direction gives 2. | Carried; 2·3=6≡1 mod 5 recomputed |
| §2.5 rational information (sampled; carried) | ℚ; ℚ(i) | K₃(ℚ)=ℤ/48, so K₃⊗ℚ=0, matching r₂=0. K₃(ℚ(i))=ℤ⊕ℤ/24, so K₃⊗ℚ=K₃ⁱⁿᵈ⊗ℚ=ℚ, matching r₂=1. | Carried; recomputed |
| §3.6 universal torsion and inversion (sampled; previous report) | 𝔽₄, 𝔽₅, 𝔽₇, 𝔽₁₁; h(2) over 𝔽₅ | c has order 1, 3, 2, 6. h(2)=3[3] has order 2 and boundary 1∈C₂, so h does not land in B. | Carried |
| §3.13 older exterior convention (sampled; carried) | 𝔽₂; 𝔽₁₁ | The extended small-field quotient at 𝔽₂ is C₃. At 𝔽₁₁, B and B_old both have order 6, but the convention map has kernel C₂ and cokernel C₂. | Carried; \|B(𝔽₁₁)\|=(11+1)/2=6 recomputed |
| §3.16 exact convention maps (sampled; carried) | 𝔽₇ | B=C₄→B_new=C₂ is reduction. B_new→B_old=C₄ has image {0,2}. Both defects are killed by 2. | Carried; \|B(𝔽₇)\|=(7+1)/2=4 recomputed |
| §4.3 scalar acyclicity (sampled; carried) | trivial unipotent part; n=m=1 | The inclusion is the identity and all homology maps are identities. Positive homology of the scalar-acyclic term is 0, and H₀=ℤ, not 0. | Carried |
| §4.7 monomial subgroups (sampled; previous report) | 𝔽₂, 𝔽₃, rank 2 | Orders 2 and 8, against \|GL₂(𝔽₃)\|=48. | Carried; 2²·2!=8 and (3²−1)(3²−3)=48 recomputed |
| §4.17 cyclic Chern classes (sampled; carried) | C₇, weights u, −u | The composite through the Tor quotient sends 1 to 2. (1+u)(1−u)=1−u², so c₂=−u², not +u². | Carried; recomputed |
| §4.18 closure detector (sampled; carried) | μ₇ with automorphism exponent 2; modulus 2 through 8 | The weight-two action is 2²=4, while a root action alone gives 2. μ⊗μ=0 for divisible torsion μ, while Tor₁(μ,μ)⊇C₇. Reduction C₈→C₂ sends 1 to 1. | Carried; recomputed |
| §4.19 enhanced torsion (sampled; carried) | ℚ, 𝔽₅, 𝔽₄ | Enhanced orders are 4, 8, 3; ordinary Tor orders are 2, 4, 3. Cross-check with the finite Bloch order: \|T̃\|·\|B\| is 8·3=24=5²−1 and 3·5=15=4²−1. For ℚ it is 4·6=24=\|K₃ⁱⁿᵈ(ℚ)\|. | Carried; consistent |
| §5.3 finite stabilization (sampled; previous report) | 𝔽₂⊂𝔽₄; 𝔽₃⊂𝔽₉ | The compatible stable images have order 3 in C₁₅ and 8 in C₈₀. | Carried; 2²−1=3 and 3²−1=8 recomputed |
| §5.8 formally-real order six (sampled headline; previous report) | ρ([2]), ρ([−1]) modulo π² | π²/12 and −π²/4 give ρ(c)=−π²/6, so ρ(2c)=−π²/3≠0 and ρ(3c)=−π²/2≠0. The residues of c, 2c, 3c, 6c modulo π² are 5/6, 2/3, 1/2, 0. | Carried |
| §6.1 certificate transport (sampled; carried) | R(2,3); n=0, 2, 3 | The integral quotient class is 0, so its images mod 0, 2 and 3 are 0. Raw [0] is not a certificate for a nonzero generator. | Carried |
| §6.4 dividing root multiples (sampled; carried) | δ:ℤ→C₂ with kernel 2ℤ; coefficients C₅ and C₂ | In C₅, 2⁻¹=3 and 4⁻¹=4. Dividing 2 by 2 gives coordinate 3 on generator 2, and dividing 4 by 4 gives 2·4=8≡3. Both map to 3·2=6≡1 in ℤ⊗C₅. With C₂, (2ℤ)⊗C₂→ℤ⊗C₂ is zero. | Carried; recomputed |
| §6.6 quotient comparisons (sampled; carried) | 𝔽₄ with ω↦ω versus ω²; 0→C₄→C₂₄→C₆→0 with n=2 | Replacing ω by ω² changes the order-five coordinate by 4. B[2]=C₂→C₄/2=C₂ is nonzero: the lift 3 has double 6, the generator of the kernel. | Carried |
| §3.1 `antisymSquare_diagonal_exact` (headline; previous report) | A=0, ℤ, C₂, C₃ | The quotient Qₛ is 0, C₂, C₂, 0. Λ² is 0 in each case. The kernels A/2A are 0, C₂, C₂, 0. | Carried |
| §4.8 `generalLinear_homology_stable` (headline; previous report) | n=0, i=0; n=0, i=1 over ℚ | On H₀ the map is the identity of ℤ. H₁(GL₀)→H₁(GL₁(ℚ)) is 0→ℚˣ, which is excluded by i≤n. | Carried |
| §4.15 `cyclicHomology_power_map`, `symmetricGroup_homology_stable` (headlines; previous report) | C₇ with a=2, j=1, 2; Σ₁→Σ₂ and Σ₂→Σ₃ | Multipliers are 2¹=2 and 2²=4. H₁: 0→C₂ is outside 2i≤n; C₂→C₂ is the identity. | Carried |
| §5.2 `nonempty_finite_sl2_localized_homology_equiv` (headline; previous report) | q=2, 3, 4, 5, 7, 8, 9 | q²−1 is 3, 8, 15, 24, 48, 63, 80. A field has q≥2, so `Nat.card F ^ 2 - 1` never truncates. | Carried |
| §5.2 `nonempty_finite_sl2_integral_homology_equiv` (headline; previous report) | q∈{2,3,4,5,8,9,27}; q=7 | p(q²−1) is 6, 24, 30, 120, 126, 240, 2184; for q=7 it is 48. gcd(p,q²−1)=1 makes the group cyclic. | Carried |
| §5.5 `finiteBloch_order` (headline; previous report) | q=2, 3 (excluded); 4, 5, 7, 8, 9, 11 | The orders are 5, 3, 4, 9, 5, 6. At q=2 the formula gives 3 but B=0, and at q=3 the formula gives ℤ/2 but B=2ℤ. Both are excluded by `4 ≤ Nat.card F`. | Carried |

The previous report's remaining rows concern statements this diff does not touch, and they stand as recorded there.

### Headline theorems and padding

The headline theorems are:
- the integral antisymmetric diagonal;
- general-linear and symmetric-group stability;
- the cyclic power map;
- integral and localized H₃ of finite SL₂;
- the finite Bloch order;
- the formally-real order-six theorem.

All are stated on native carriers in `Suggested.lean`, and the file did not change. Its module docstring still names the headlines that are not statable at the pins:
- Quillen K₃;
- the Milnor and motivic carriers;
- the Suslin sequence;
- the finite Chern map;
- the Rogers detector.

The relation η³=12ν is §4.16's input. It is not a headline, and it is not statable at the pins, since there is no sphere spectrum and no composition product on homotopy groups of spheres. The previous report's one-tactic probes (`simp`, `infer_instance`, `rfl`, `decide`, `trivial`) all failed. They stand for the unchanged file, and nothing is padding.

### Pinned library declarations opened this round

The pins are Mathlib 1b1ccf4b088b and Tau Ceti 2fd255d997f4. I opened these declarations, which carry the headline types elaborated above:
- `Nat.card_eq_fintype_card`, `Mathlib/SetTheory/Cardinal/Finite.lean:47`;
- `Rep.trivial`, `Mathlib/RepresentationTheory/Rep/Basic.lean:288`;
- `groupHomology.map`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157`;
- `exteriorPower.ιMulti`, `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`.

### Cross-roadmap citations resolved this round

Seven citations were resolved: ArithmeticKTheory §7.5 at e6275108, with the seven items in the table above. Hatcher §4.2, p.385 (hatcher line 16749–16752) was also re-read. The `roadmaps resolve` lead list (`citations.md`) is empty for this README. `overlaps.md` lists:
- no open pull request that changes this roadmap;
- no dropped id that this roadmap cites;
- no id that only an open revision defines.

The closest roadmaps in vocabulary are Polylogarithms, K2SymbolsBrauer, ArithmeticKTheory, EllipticKTheory and HabiroNumberFields. The diff adds no object to this roadmap, so the ownership audit of the earlier rounds is unchanged.

## Not verifiable

- **`suslin-1984`, `suslin-1991` and `bloch`** are waived by a human. They are cited by locator only, and the diff does not touch them.
- **Ownership against open pull requests** was checked only for the changed passage. I ran `roadmaps grep` across main and the 475 open heads and re-resolved ArithmeticKTheory's head. The diff adds no object, so nothing else needed a fresh check.

## Source issues

- none
