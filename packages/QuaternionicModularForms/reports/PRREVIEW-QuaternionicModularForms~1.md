# Review of QuaternionicModularForms (pull request #934 at 76032ac)

**Verdict:** needs changes

## R01 (P1) — Break the reciprocal supplier dependencies

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:38`, also lines 36, 44–56, 58–69 and 641–677. The supplier table explicitly says “the dependency is at the theorem level in both directions”.

**Claim:** Separating early and late theorems within two roadmaps makes reciprocal supply admissible. It does not satisfy the required single direction of supply between roadmaps.

**Witness:** `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:294` consumes this roadmap's reduced norm; line 295 consumes its class sets and stabilisers. This roadmap consumes that supplier's adelic groups, Hecke machinery and class-number theorem.

The same reciprocal consumption occurs with AutomorphicFormsOnReductiveGroups §§7.4–7.6, GL2AutomorphicRepresentationsAndTransfer R17.3.9, and HilbertModularVarietiesAndShimuraCurves R18.3.1–R18.3.3. The four suppliers occupy positions 33,69,89,141; this roadmap is at 187. The contract table below resolves the reverse edges.

**Repair:** Move shared norm/class-set/stabiliser and generic coefficient/form/evaluation/Hecke interfaces into their earlier owners; consume them here. Alternatively separate later applications into Part II consumers. Recheck reverse citations too. On the exhibited two-node example this replaces two opposite edges by one earlier-to-later edge. Moving this entire folder in the order cannot remove the cycle.

The mechanical dependency check reported no problems; it missed these explicit reciprocal contracts. Its exact output is recorded below.

## R02 (P2) — The definite comparison tensors along a map that was not supplied

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:637` and `:653`: “with an embedding `E ↪ K` … and with `ι : E ↪ ℂ`”, followed by `M(U, L_{n,v}) ⊗_{K,ι} ℂ`.

**Claim:** The stated data define scalar extension from K to ℂ. They supply a map from E, not K.

**Witness:** Take Hamilton quaternions over ℚ, E=ℚ(i), p=5 and K=ℚ₅. The supplied maps have domain E; neither supplies a ℚ₅-algebra structure on ℂ. The displayed tensor product has no specified scalar map.

This is not repaired in the stated generality by silently choosing an embedding K→ℂ: the conventions allow complete ultrametric extensions of cardinality greater than that of ℂ. A completed Gauss-valued rational function field over ℚ₅ with sufficiently many independent variables supplies such an example. Loeffler's Proposition 3.8.1 explicitly chooses an embedding of its coefficient field into ℂ (`loeffler` line 1047), so that source does not remove the missing datum.

**Repair:** Form the E-rational Gross covariance model M_E, prove the comparison `M_E ⊗_E K ≃ M(U,L_{n,v})`, and state the complex realisation for `M_E ⊗_{E,ι} ℂ`. Carry the Hecke actions through both comparisons. In rank one the repaired constructions give K and ℂ respectively from E; neither needs a map K→ℂ. This also works for the large-field instance and preserves the intended generality.

## R03 (P2) — Specify the Bianchi norm twist and its direction

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:738`–749: “after the twist by the power of `|det|_𝔸`, determined by `k` and his absolute-value convention”.

**Claim:** This specifies a Hecke-equivariant comparison with Williams. The exponent, direction of the comparison and resulting Hecke factor are left unspecified, although they are essential parts of this target.

**Witness:** At k=1 and the central scalar z=2, the roadmap's character is 1/4. Interpreting Williams's displayed absolute value as Euclidean gives 1/2; interpreting it as the normalized complex absolute value gives 1/4.

**Repair:** State the complex absolute-value convention explicitly and give the actual map and exponent. For example, if Williams's symbol is Euclidean and the map goes from his functions to this roadmap's functions, multiply by `|det g|_𝔸^(−k/4)` using the normalized adelic norm; at z=2 this multiplies 1/2 by `16^(−1/4)=1/2`, giving 1/4. In the normalized-complex convention the exponent is zero. State the corresponding finite-place factor `|det η|_𝔸^s` for right translation (and its inverse-coset version). Resolve which convention the cited version uses rather than leaving both alternatives implicit. Add this two-term check and the finite-place factor to the README. The source's displayed formula is at `williams` line 185; its definition continues at lines 199–217.

## R04 (P2) — Replace representative interfaces with headline acceptance statements

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:18`–29 and `:321`–328. The docstring calls these “representative interfaces”; the last theorem quantifies over arbitrary normed spaces and three operators.

**Claim:** The file tests the roadmap's end theorems. It instead replaces small-slope classicality with a general operator argument, and neither states nor identifies as unavailable most of the advertised end theorems.

**Witness:** `theta_kills_generalized_eigenvector` mentions no level, weight, form space, Hecke operator or classical subspace. With both modules zero its conclusion is `0=0`; it cannot test the construction or identification of classical forms.

The missing-headline list below includes the automorphic/Bianchi comparisons, compact Hecke action, intrinsic determinant and finite slopes, annular action/comparison, and theta/classicality. In particular, preservation of `Forms` by the existing finite `heckeSum` under an actual double-coset partition is statable using the group's subsets, the existing native module, and the definitions already present; only its coordinate evaluation formula is stated.

**Repair:** State each statable headline on its actual carriers, including Hecke preservation and its action law. Delete the generic small-slope substitute from the acceptance file. Name each genuinely unavailable headline and its missing carrier/action in the module docstring; do not encode it with arbitrary operators or a new free predicate. Remove definitions that no retained headline needs, such as the unused `Rigidification`. Test the form theorem on the S₃ example below: the two singleton operators give values 2 and 1 in opposite orders. A correctly stated opposite-Hecke action distinguishes them, whereas the arbitrary-operator theorem says nothing about them.

## R05 (P3) — Delete padding from Suggested.lean

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:44`, `:79`, `:113`, `:135`, `:145`, `:267`, `:273`, `:280`, and `:305`.

**Claim:** These belong in the headline acceptance file. They are definitional identities, small arithmetic bounds, or explicitly advertised README Checks.

**Witness:** On a copy, `detCharacter_comparison` closes with `simp [normalizedDetCharacter, map_mul, map_zpow]`; `normalizedDetCharacter_uniformizer` closes with `simp [normalizedDetCharacter, hπ]`. The file itself proves six other listed declarations by elementary rewriting/arithmetic.

`hamilton_negative_norm` is explicitly the Check at README lines 293–295. The six already-proved declarations are `hamilton_normForm_eq_normSq`, `stab_top`, `mahlerWeight_le`, `mahler_column_exponent`, `mahler_row_exponent`, and `theta_eval`. Their mathematical uses belong in the README; proving them in this file does not make them headlines.

**Repair:** Delete it from `Suggested.lean` for each of these nine declarations. Retain the mathematical targets/Checks in the README and delete any definition left unused by the retained headlines. The two successful one-tactic probes, and the numerical Mahler rows below, test the exact instances and identities at issue. Sixteen admitted declarations were probed; the other fourteen did not close with the selected single tactic, which is not a claim that all fourteen are appropriate headlines.

## R06 (P3) — Use the required import header

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:1`–15, including `import Mathlib.Algebra.Quaternion` and `import Lean.Elab.Tactic.Omega`.

**Claim:** The acceptance file has the permitted import form.

**Witness:** The worker gate reports `imports=1`, `mathlib-subimports=13`, and `no-import-mathlib=1`. There are thirteen Mathlib submodule imports and no `import Mathlib` line.

**Repair:** Replace the header by `import Mathlib` followed by `import TauCeti.Algebra.Quaternion.NormForm`; remove the explicit Lean tactic import. This addresses all three failing checks. The import-only scratch repair elaborated successfully with sixteen sorry warnings, as did the original.

## R07 (P3) — Resolve roadmap suppliers by name and section, not old commits

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:51` and `:1268`–1276; for example “#792 at `0f2c303`”.

**Claim:** These links identify the standing supplier contracts.

**Witness:** The gate reports `blob=6`, identifying line 51 and lines 1272–1276. Four additional supplier links at lines 1268–1271 point to commit-pinned copies in the author's fork.

**Repair:** Cite each supplier by roadmap name and exact section, using its repository path or main link. Remove the historical-commit narration. Keep version pins for external implementation sources such as FLT, which serve a different purpose. Re-resolve the named contracts against main or the eligible open head, as done below; for example CompactOperators §1.4 now identifies the required diagonal-intertwining target directly.

## R08 (P3) — Remove process history from the mathematical specification

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:29`–71, especially “These replace the former `OverconvergentForms` supplier name.”

**Claim:** The scope section is a timeless ownership specification.

**Witness:** The gate reports `prnum=13`. The text additionally describes a former supplier name, a previous reciprocal row and what that row now names.

**Repair:** Replace the thirteen pull-request references with roadmap names and sections, and replace the history at lines 44–56 with the final one-way contracts after R01. Re-reading the repaired paragraph should identify the mathematical owner and consumed theorem without requiring any previous revision or pull request.

## R09 (P3) — Supply the required API, Checks and dependency structure

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:1`, `:25`, `:190`, `:414` and the ends of Layers 0–5.

**Claim:** The prose supplies the roadmap's definition APIs, discriminating Checks and layer dependencies in the required form.

**Witness:** There are zero `*Needs:*` lines and zero layer-ending `### Examples` or `### Dependencies` sections. Section 1.2 has no Checks block; §0.1 has only two prose Check examples for several constructions.

**Repair:** Use the required title/Summary, Scope and ownership, Conventions, Exact supplier contracts, and How to read the build sections. Give every definition its prose API bullets and at least three discriminating Check bullets; add claim-specific Needs and layer-ending Examples/Dependencies. Preserve the existing mathematical detail. For §1.2, the values `2z+2` versus `2z+1`, denominator `1+3z` versus `1+z` at z=−1, and the row values `1/3,1/9,1/27` below provide three distinct checks rather than repetitions of the definition.

## R10 (P3) — Attach exact locators to the sampled claims

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:414`–437, `:811`–824, `:851`–958, `:1089`–1176 and References at `:1206`.

**Claim:** The references let an implementer verify the stated results at their locators.

**Witness:** Sections 1.2, 3.2 and 5.1–5.3 have no claim-level source theorem/page locator. A reference to Buzzard §§8–13 does not identify the particular level, radius or compactness theorem.

**Repair:** Attach exact locators to each claim or derivation, retaining each source's hypotheses. For example: Jacobs Lemma 1.31, p.19, for evaluation; his §1.6, pp.20–21, for the Hecke calculation; Buzzard, Eigenvarieties, Proposition 11.1, p.75, Lemma 12.2, pp.78–79, and Lemma 13.1, pp.79–80; Buzzard, Families, §7, p.19, Proposition 4, for theta/classicality; LWX Proposition 3.14, p.21, for the two Mahler estimates. Identify new deductions as such, with the precise supplier inputs; the half-weighted model is not literally LWX's model. The source audit below verifies these distinctions. Mark the unavailable primary Bianchi proof as uncertified rather than treating the survey as its proof.

## R11 (P3) — Reconcile retained Lean declarations with the README

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:53`–83, `:185`–196 and `:288`–292; module docstring at `:18`.

**Claim:** Each declared name and its mathematical role are documented by the README, and the file has the prescribed declaration documentation and layer structure.

**Witness:** Names such as `eval_mem_range_iff` and `annularMahlerMatrix_det` occur nowhere in the README. Several definitions, including `globalUnits`, lack declaration docstrings; none of the section comments uses the README layer headings.

**Repair:** After removing R04/R05's declarations, list every retained declaration name at its corresponding README target, give it a mathematical docstring, and arrange target sections in README layer order. Use the required “target signatures” module docstring with the unavailable-headline list. The 43 mechanically printed declaration signatures were compared with the prose; no dropped standing hypothesis was found. This is documentation/shape repair, not a demand to add unnecessary hypotheses.

## Verified sound

Both files were reviewed at the specified head; there is no previous review. The outside-folder diff is empty and the worktree unchanged. No set_option, admitted data/example, stray file, copied passage, algorithm or suspicious instruction was found. Section 3.2 certificates are mathematical factorisations. This is not a wholesale re-plan of an existing roadmap.

The worker gate **fails** on five rule categories: `blob=6`, `prnum=13`, `imports=1`, `mathlib-subimports=13`, `no-import-mathlib=1`; all other counters, including build, were zero. R06–R08 cover every failing category. The requested dependency command was run with `--movable` and produced exactly:

```text
depcheck: 164 roadmaps, 1166 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R01 records the manual counterevidence; this zero is not evidence that reciprocal textual contracts are permitted. No supplier gaps are declared.

After the targeted norm-form dependency build, direct elaboration succeeded with sixteen sorry warnings. All 43 `#check @name` probes elaborated: topology, total reality, definiteness, compactness, dimension, opposite action and target completeness remained in the signatures. All sixteen admissions received a one-tactic probe: two closed (R05), fourteen did not. Elaboration does not establish truth.

### Headline coverage

| README headline | Acceptance-file coverage at these pins |
| --- | --- |
| §0.3 finite class sets and compact stabilisers modulo the centre | `finite_classSet` and `DefiniteQuaternion.finite_stab` are substantive statements on native carriers. The division-algebra theorem is intentionally more general than quaternions, as the README says. |
| §§1.1–1.3 bounded analytic weight action and classical comparison | A formal `weightColumn` and its algebraic identity do not state the analytic action. The missing weight/action carrier must be named; simple determinant identities are not substitutes. |
| §2.1 evaluation equivalence | Injectivity plus the exact image/invariants iff state its substantive set-theoretic content. Both directions were tested below, including nontrivial stabilisers. |
| §§2.4–2.6 automorphic specialisation, definite realisation and both Bianchi comparisons | Absent. Native arithmetic automorphic and local-system/cohomology realisations used by these signatures are not supplied by the imports. The module docstring does not name these missing headlines. R02/R03 also affect the prose targets. |
| §§3.1–3.3 opposite Hecke action, certified matrices and compact control | The finite coordinate identity is present. Preservation of `Forms` and the opposite action are statable with native finite partitions but missing. Compactness requires the actual analytic coefficient/action construction. |
| §§4.1–4.3 intrinsic Fredholm, finite slopes, bounds and base change | Absent. The required nonarchimedean property-(Pr) determinant and slope interfaces are roadmap suppliers, not the imported native matrix determinant. |
| §4.4 weighted annular action, integral Fredholm series and analytic comparison | Only weighting and finite principal-determinant invariance are stated. The annular coefficient ring, its normed universal action and the intrinsic Fredholm construction are missing from the acceptance signatures. |
| §§5.1–5.3 Bol, theta/Hecke, determinant factorisation and small-slope classicality | Formal Bol is present. Raw differentiation of arbitrary functions and an arbitrary-operator estimate do not state theta on forms or classicality. Name the missing analytic form/action carriers instead. |

### Seeded source audit

All fifteen sampled sections were inspected; none is explicitly labelled unverified. Nine texts were legally read via the source service; Gross and Harder (1987) are uncertified, Harder (1975) unavailable. Pages below are printed pages of the versions read.

| Sample | Text and exact locator examined | What the text supports / limitation |
| --- | --- | --- |
| 0.3 | `flt` lines 78–79, 132, 1067–1094, `units_cocompact` and `finiteDoubleCoset`; `voight` lines 19299–19303, Main Theorem 27.6.14(b), p.458; `loeffler` lines 691–705, Assumption 3.1.3 and Proposition 3.1.4, p.15 | Finiteness for central finite-dimensional division algebras at open levels; stabilisers finite modulo the centre under compactness modulo centre at infinity. Loeffler states compact-open level; the compact-only version here includes the additional enlargement/injection argument, rather than attributing that generality to him. |
| 0.5 | `loeffler` lines 691–705, same locator; direct unipotent computation below | The definite hypothesis cannot be dropped. The split imaginary-quadratic counterexample is computed directly; it is not an application of definite finiteness. |
| 1.2 | `jacobs` lines 719–746, Definition 1.27 and (1.5.13), p.19; `buzzard-eigen` lines 2583–2610, §10 | Right slash action and character conventions. The roadmap correctly adds analytic admissibility and a geometric coefficient bound; Jacobs's unrestricted-depth formulation does not justify action on a common Tate disc. Generating-function and quantitative row bounds are deductions needing explicit locators/inputs. |
| 2.1 | `jacobs` lines 757–765, Lemma 1.31, p.19; `loeffler` lines 787–847, Definition 3.3.2 and Proposition 3.3.3, pp.17–18 | Evaluation identifies forms with invariant coordinates. Loeffler uses a left coefficient action with inverse covariance; the roadmap's opposite-action convention is necessary. General abstract groups are a direct algebraic extension, not a claim that the source assumes arbitrary groups. |
| 2.3 | `loeffler` lines 848–873, Definition 3.3.4 and Corollary 3.3.5, p.18 | Arithmetic coefficient action and finite averaging. Arbitrary Banach–Tate coefficients, common family quotients and projection norm losses use the explicitly cited functional-analysis supplier; they are not consequences of finite class sets alone. |
| 2.5 | `loeffler` lines 1047–1102, Proposition 3.8.1, pp.22–23 | Locally algebraic coefficients, chosen complex embedding and automorphic realisation. Does not license the missing K→ℂ map (R02). Gross's primary text remains uncertified. |
| 2.6 | `williams` lines 175–249, Definitions 1.1–1.2 and Theorem 1.3, pp.4–5, arXiv v2; `sengun` lines 555–562, §5, p.14 | The SU₂ type, Casimir condition, cusp condition and survey's H¹ comparison were read. Williams's level requires both diagonal entries congruent to 1, unlike this roadmap's U₁; Ω₁ is kept separate. The source's class-number decomposition has the error recorded below. Exact norm twist unresolved (R03); Harder's primary cohomology proof unavailable. |
| 3.2 | `jacobs` lines 776–850, Definition 1.32 and ensuing calculation, pp.20–21; `loeffler` lines 800–847, Proposition 3.3.3, pp.17–18 | Finite coset sums and evaluation matrices. Equality is on invariant coordinates, as the README correctly states; ambient extensions need the projection. |
| 4.1 | `buzzard-eigen` lines 2880–2932, Lemmas 12.2 and 13.1, pp.78–80; CompactOperators §§1.2–1.7 and later slope theory | Compact control and radius links in Buzzard's reduced affinoid setting. Intrinsic property-(Pr) determinants, nonreduced rings and projective slope pieces must use the stronger named supplier contracts. |
| 4.2 | `lwx` lines 692–736, Proposition 2.17, p.15; CompactOperators §4.1 and NewtonPolygons §§2.5, 3.3, 4.2 | Convergent principal-minor characteristic series and comparisons. The specific h-repeated row bound is a deduction, tested below; it is not a termwise eigenvalue bound. |
| 4.3 | `buzzard-eigen` lines 2715–2727, Proposition 11.1, p.75, and 2920–2932, Lemma 13.1, pp.79–80; PFA §§5.4–5.6; CompactOperators §1.7 | Actual admissibility and intertwining maps, with weight-dependent depth. Nonreduced families and completed base change are separate supplier contracts, not inferred from Buzzard's reduced coefficient spaces. |
| 4.4 | `lwx` lines 826–849, Proposition 3.4, p.17; 1141–1218, Proposition 3.14, p.21 and ensuing change of ideal; 1837 onward, §5.4; 692–736, Proposition 2.17, p.15 | Both Mahler divisibility bounds, q=p for odd p and q=4 for p=2, and the integral weighted-model method. The floor(n/2) model is a new, explicitly distinguished variant; the numerical inequalities below support its null columns and rows. No bounded inverse of the infinite diagonal is asserted. |
| 5.1 | `buzzard-families` lines 869–884, §7, p.19 | The derivative/weight identity with the degree shift. The README restricts the common extra factor to a constant and records non-surjectivity, avoiding an invalid general-character version. |
| 5.2 | `buzzard-families` lines 869–891, §7, p.19 | Global norm character, theta and Hecke scalar. Representative-dependent constants are additional bookkeeping, correctly retained. |
| 5.3 | `buzzard-families` lines 893–909, Proposition 4, §7, p.19; CompactOperators §§1.4, 1.6 | The strict classicality cutoff after replacing source weight by polynomial degree+2. Determinant comparison uses convergent finite minors and does not require theta to be onto. The roadmap does not import a converse assertion about all classical slopes. |

Fetched proposal/PhD landing pages are implementation leads, not evidence of pinned availability or transitive soundness. The actual FLT finiteness file was read.

### Computed adversarial pass

“Pass” records agreement on the stated instance, not a general proof. Negative controls remove a hypothesis. Fields exclude the zero ring and characteristic p; raw ring identities were tested at the zero ring. Number fields exclude inseparable extensions. R02 tests unrestricted coefficient-field size.

The table has 122 rows. S₃ orbits, Mahler differences and determinant values were also script-computed. The exponent grid checked 10,000 general pairs and 30,000 contracting triples (p=2,3,5; 0≤m,n<100), without counterexample.

| ID / statement | Instances tried | Computed values, including wrong model | Result / change |
| --- | --- | --- | --- |
| A01 §0.1 transported Hamilton norm | q=0 and q=1+i over ℚ | Native and transported norms: 0=0 and 2=2; the zero norm map gives 0 at 1+i | Pass; native norm must be consumed |
| A02 §0.1 reduced versus regular determinant | diag(2,3) in M₂(ℚ) | nrd=6, determinant of left multiplication=36=6²; reduced trace=5, regular trace=10 | Pass; detects confusing nrd with regular determinant |
| A03 §0.1 involution and presentation invariance | q=1+i; interchange i,j | q·q̄=2; (1+j)(1−j)=2; reduced traces both 2 | Pass; native equivalence law fixes norm scaling |
| A04 §0.1 definiteness and negative norm | Hamilton q=1+i; scalar i over ℚ(i) | First norm 2>0; scalar i has norm −1 in the latter field | Pass; total reality needed for negative-norm Check |
| A05 §0.1 division and excluded characteristic | Hamilton over ℚ; presentation in characteristic 2 | Over ℚ, q=1+i has norm 2≠0; over 𝔽₂ it is nonzero with norm 0 | Pass; number-field hypothesis excludes this failure |
| A06 §0.1 GL₁(D) and norm-one kernel | R=F[ε]/ε², x=1+εi; split y=diag(1+ε,1) | x⁻¹=1−εi, nrd(x)=1; nrd(y)=1+ε≠1; zero is not a unit | Pass; reduced test points alone miss y's norm |
| A07 §0.1 centre and derived-group convention | split scalar 2I; diag(2,1/2) | Scalar commutes and has norm 4; second matrix has norm 1 and is noncentral | Pass; norm-one is not the centre |
| A08 §0.1 local splitting and integral units | split diag(2,3) at p=5 and p=3 | Determinant 6: a 5-adic unit, not a 3-adic unit; inverse diagonal entries 1/2,1/3 | Pass; integral entries alone do not define integral units |
| A09 §0.2 adelic embedding/injectivity | global scalar 2, then global 1 | Local images are 2 and 1 at every place, unequal; product image of 2·3 is 6=2·3 | Pass; no zero-map substitute |
| A10 §0.2 U₀/U₁ levels | GL₂(𝔽₃), t=1; t=0 | Group order 48, U₀ order 12/index 4, U₁ order 6/index 8; at t=0 both indices 1 | Pass; full unit ideal handled |
| A11 §0.2 last-row convention | mod 3, diag(2,1), diag(1,2) | First belongs to U₁, second does not; requiring a=1 would reject the first | Pass; distinguishes Williams's Ω₁ |
| A12 §0.2 global norm character | rational scalar 2 in definite D | nrd=4, finite norm=1/4, p-component determinant=4; c=1 | Pass; product formula sign fixed |
| A13 §0.2 uniformiser normalization | ηp with π=p, then π=2p for odd p | c=1 then c=2; finite-norm inverse remains p in both | Pass; distinguishes c from the theta–Hecke scalar |
| A14 §0.2 away-prime scalar | ℓ=5≠p, diag(5,1) and 5I at ℓ | c=1/5 and 1/25; theta scalars for r=1 are 5 and 25 | Pass |
| A15 §0.3 finite class set | central division algebra D=F=ℚ; maximal integral units and U=top | Both double-coset sets have cardinality 1 | Pass; openness rather than compactness suffices here |
| A16 §0.3 compact stabiliser modulo centre | Hamilton, units of the Lipschitz order, x=1 | Γ=Q₈ has 8 elements; Z={±1} has 2; quotient has 4 | Pass; tests nonabelian stabiliser |
| A17 §0.3 central infinite units | F=ℚ(√2), central unit ε=1+√2 | Norm ε=−1, every finite valuation 0; powers are infinite, quotient of this central subgroup by itself has size 1 | Pass; Γ finite would be false |
| A18 §0.3 compactness negative control | U=top over ℚ | Γ contains all 2ⁿ, n∈ℤ, hence infinite; defining intersection reduces to conjugate global units | Pass; `stab_top` is a Check/padding |
| A19 §0.3 normality/conjugation | Q₈, Z={±1}, conjugation by i | i(−1)i⁻¹=−1; quotient before/after conjugation has order 4 | Pass; correct quotient direction |
| A20 §0.4 denominator/unit condition | p=3, c=3,d=1; then c=d=1,z=−1 | First denominator 1+3z has residue 1 for all integral z; second has value 0 | Pass; t≥1 and unit d essential |
| A21 §0.4 monoid and substitution | diag(3,1), then its square | Maps z↦3z and z↦9z; determinant 3 then 9, both nonzero | Pass; group invertibility need not mean integral inverse |
| A22 §0.4 coset count | q=3, t=1, α=0,1,2 | Ratio xα·xβ⁻¹ has lower-left entry α−β; exactly three residue classes, versus four good-prime terms and one normalizer term | Pass; excludes arbitrary-level formula |
| A23 §0.5 split imaginary-quadratic stabiliser | F=ℚ(i), unipotents with n=0,1,2 | Matrices have upper-right entries 0,1,2; any scalar relating two has diagonal scalar 1, so all three remain distinct modulo centre | Pass; infinite sequence disproves finite stabiliser quotient |
| A24 §1.1 Jacobs weight dictionary | κJ(u)=u², then u³ | Automorphy factor n=1, then n=u; polynomial degrees 0 and 1 | Pass; detects missing degree-two shift |
| A25 §1.1 product-character encoding | n(x)=x², ν₀(y)=y; (x,y)=(2,3) | χ(2,3)=12; projections χ(2,1)=4, χ(1,3)=3; recombination 4·3=12 | Pass in both directions |
| A26 §1.1 central/determinant action | same pair; scalar 2I and diag(2,1) | Scalar multiplier 2²·2²=16; constant on diag(2,1) multiplies by 2, not 1 | Pass; ν(π)=1 does not trivialize ν₀ |
| A27 §1.1 nonreduced weight | n(1+3z)=1+ε log(1+3z), ε²=0 | Constant coefficient 1, z coefficient 3ε≠0; every map to a field kills that coefficient | Pass; field points cannot prove family equality |
| A28 §1.1 quantitative endpoint | coefficients 3ᵐ over ℚ₃, η=1/3 | At radius 3, weighted coefficient norms are (1/3)ᵐ3ᵐ=1; at radius 1 they tend to 0 | Pass; strict rη<1 needed |
| A29 §1.1 embedding-coordinate norm | Fv=ℚ₃(π), π²=3; basis 1,π | Embedding matrix determinant −2π has norm 3^(−1/2), not 1 | Pass; inverse coordinate matrix need not be isometric |
| A30 §1.2 right action | A=diag(2,1), B=(1,1;0,1), f=z, trivial factor | (f slash A) slash B=2z+2=f slash AB; reverse order gives 2z+1 | Pass; detects opposite-action convention |
| A31 §1.2 generating series | j=1, w=3z | Coefficients of X⁰,X¹,X² are 1,3z,9z² on both sides of (1−Xw)⁻¹ | Pass; a transposed matrix would change columns |
| A32 §1.2 geometric output-row estimate | γ=(3,0;3,1), trivial factor | w=3z−9z²+27z³−…; coefficient norms are 1/3,1/9,1/27=σᵐ, σ=1/3 | Pass; output index governs bound |
| A33 §1.2 boundedness versus compactness | identity substitution, j=1; contraction z↦3z | Identity rows all have norm 1; contracted row m has norm 3^(−m) | Pass; bounded action alone not compact |
| A34 §1.3 polynomial carrier and dimension | degrees (1,2); degree 0 | Tensor polynomial dimension 2·3=6; degree 0 dimension 1, analytic monomials 1,z,z²,… independent | Pass |
| A35 §1.3 polynomial stability | k=2, n=1, N=2z+1,L=z+1 | N·L=2z²+3z+1 has degree 2; formal column j=L² times (N/L) equals same polynomial | Pass; n≤k used |
| A36 §1.3 parallel central exponents | ε=1+√2 and its conjugate; exponents (2,2) versus (2,0) | Parallel value Norm(ε)²=1; nonparallel value ε²≠1 and powers infinite | Pass; finite-image hypothesis has content |
| A37 §1.3 algebraic/normalized determinant | p=3,v=1, γ=diag(3,1), f=z² | Algebraic output 27z²; normalized output 9z²; ratio 3=νalg(3) | Pass; slope shift 1 |
| A38 §1.3 uniformiser change | χ(x)=x, π=3 then π′=6, x=3 | Normalized values 1 then 1/2; products χ(π)·1=3 and χ(π′)·(1/2)=3 | Pass; comparison fixes unit rescaling |
| A39 §1.3 odd scalar invariants | −1 acting on a line by −1 | Over ℚ, a=−a implies a=0; over 𝔽₂ every a is invariant | Pass; characteristic zero matters |
| A40 §1.4 disc refinement | ℚ₃, s=1 then 2 | Three residue discs become nine; each coordinate z=a+3w has derivative factor 1/3 | Pass; refinement is not one fixed disc |
| A41 §2.1 Forms definition | trivial G and coefficient K; coefficient 0 | Forms are K with dimension 1; zero coefficients give dimension 0 | Pass; no nonempty coefficient assumption |
| A42 §2.1 evaluation injectivity | S₃, Γ=⟨(01)⟩, U=⟨(12)⟩, trivial coefficients | Two orbits of sizes 4 and 2; values (2,5) determine all six function values; same tuple reconstructs same function | Pass; both directions exercised |
| A43 §2.1 exact invariant image | same S₃, sign coefficient action of U | Stabiliser sizes 1 and 2; invariant dimensions 1 and 0; tuple (2,0) extends, (2,5) does not in characteristic zero | Pass; full ambient product would be false |
| A44 §2.1 change of representatives/norm | one orbit, level action multiplication by −1 | Coordinate 5 becomes −5; both norms equal | Pass; isometric action gives isometry |
| A45 §2.1 level inclusion and trace | C₂, trivial Γ and coefficients; levels 1⊂C₂ | Inclusion sends a↦(a,a); trace (x,y)↦x+y; trace∘inclusion gives 2a, not a | Pass; finite-index scalar must remain |
| A46 §2.2 classical disc stage | trivial stabiliser action, h classes, degree k=1, p=3,s=1 | One-disc dimension 2h; three-disc locally polynomial dimension 6h | Pass; locally polynomial differs from globally polynomial |
| A47 §2.2 level/radius comparison | p=3,t=1,s=1, common admissible weight | Local index [U₀(3):U₀(9)]=3; three radius-1/3 discs match that factor | Pass; s=0 yields index 1 and identical stages |
| A48 §2.3 averaging projector | C₂ swaps K², char 0 | E=(1/2)(1 1;1 1), E²=E, image diagonal, rank 1 | Pass; nontrivial stabiliser retained |
| A49 §2.3 projection norm | same projector over ℚ₂ | Entry norm and sup-operator norm 2, not ≤1 | Pass; C-loss required in row estimates |
| A50 §2.3 noninvertible group order | same swap over 𝔽₂ | Sum 1+s is nonzero but (1+s)²=0; dividing by 2 unavailable | Pass; averaging hypothesis cannot be omitted |
| A51 §2.3 infinite central stabiliser | ℤ acts trivially on K | Action-image order 1; average E=1; invariants dimension 1 | Pass; image finiteness, not group finiteness, is used |
| A52 §2.4 automorphic/cuspidal distinction | constant function 1, split GL₂ | Constant term along unipotent quotient is its nonzero volume, normalized to 1 | Pass; constant is not cuspidal in split case |
| A53 §2.4 division case | definite D, trivial type, h classes | No proper rational parabolics; trivial-type functions have dimension h, including constant vector (1,…,1) | Pass; no extra cusp condition on this coefficient model |
| A54 §2.4 component restriction/inverse | two components, constant values 2 and 5 | Restrictions are (2,5); reconstructing and restricting again returns (2,5) | Pass; component count uses actual determinant quotient |
| A55 §2.4 type versus dual | one central scalar 2, degree-one type | Central character 2; dual character 1/2 | Pass; replacing W by W∨ changes the character |
| A56 §2.5 right polynomial/dual dictionary | upper unipotent γ=(1,1;0,1), P=X | P slash γ=X+Y; standard γe₁=e₁; inverse polynomial action gives X−Y | Pass; ordinary standard action is wrong model |
| A57 §2.5 scalar-extension domain | E=ℚ(i)⊂ℚ₅ and E⊂ℂ, rank-one E-model | E⊗Eℚ₅=ℚ₅; E⊗Eℂ=ℂ; displayed ℚ₅⊗(ℚ₅,ι)ℂ has no supplied scalar map | R02; use common E-model |
| A58 §2.5 central quotient at real quadratic level | F=ℚ(√2), central powers of 1+√2 | Infinitely many central integral units; n=0 still has parallel exponent 0 and central action 1 | Pass; cannot use discreteness of Fˣ in finite ideles |
| A59 §2.5 definite dimension check | trivial stabiliser action, n=0 or 1 | Coefficient dimensions h or 2h; sum of finite-part multiplicities must equal those values | Pass as dimension normalization, not a computed automorphic spectrum |
| A60 §2.6 symmetric-space quotient | GL₂(ℂ)/ℂˣU(2) | Real dimension 8−(2+4−1)=3; quotient by U(2) alone would have dimension 4 | Pass; split centre required |
| A61 §2.6 K-type | k=0,1 | Dimensions 3 and 5; scalar e^(it) acts by e^((2k+2)it)·e^(−2(k+1)it)=1 | Pass; determinant twist fixes central U(1) |
| A62 §2.6 coefficient central character | Vkk at z=2,k=1 | Vkk multiplier 4; its dual multiplier 1/4 | Pass; R03 must match this value |
| A63 §2.6 Williams comparison | k=1,z=2 | Euclidean interpretation 1/2 versus required 1/4; multiplying by 16^(−1/4) gives 1/4 | R03; explicit twist/direction needed |
| A64 §2.6 component count/source check | F=ℚ(i), Ω₁((3)) as Williams defines it | Residue field 𝔽₉ has 8 units; global units give subgroup size 4; determinant quotient size 2, ordinary class number 1 | Source error; retain README's general determinant quotient |
| A65 §2.6 cohomological degrees | q₀=1,ℓ₀=1; k=0 | Expected multiplicities in degrees 0,1,2,3 are 0,1,1,0; Λ¹𝔭 and Λ²𝔭 each have dimension 3 | Consistent dimension check; primary proof uncertified |
| A66 §2.6 non-neat descent | C₂ acts on a line by −1 in characteristic 0 | Invariants 0; Reynolds (1−1)/2=0; trivial action instead gives 1-dimensional invariants | Pass; finite-quotient descent is not omission of stabilisers |
| A67 §3.1 singleton Hecke composition | S₃, trivial level/coefficient, a=(01), b=(12), f(g)=g(0) | At identity, T_b∘T_a gives 2, T_a∘T_b gives 1 | Pass; opposite Hecke order; R04 needs actual action theorem |
| A68 §3.1 representative independence | C₂, full level, trivial coefficient, constant φ=7 | Representatives 1 and s each give 7 | Pass; independence uses level covariance |
| A69 §3.1 distinct places/central S | scalar multipliers 2 and 3 | Compositions both multiply by 6; with identity multiplier 1 the value remains 6 | Pass; does not replace noncommutative test A67 |
| A70 §3.2 certificate formula | trivial group, singleton cosets, φ=7 | Left side 7, factorization-side sum 7; empty formal sum gives 0 on both sides | Pass; no arbitrary certificate asserted to be Hecke |
| A71 §3.2 nontrivial factor order | right-action endomorphisms A,B from A30 | Applying u then x gives 2z+2, reversed order 2z+1 | Pass; product u·x in certificate formula is ordered |
| A72 §3.2 invariant versus ambient equality | K² with swap stabiliser, B=identity versus swap | Both send (a,a) to (a,a); on (1,0) results (1,0) and (0,1); BE=E in both cases | Pass; ambient matrix equality would be false |
| A73 §3.3 null rows/finite truncation | diag(1,3,9,…) on c₀(ℕ,ℚ₃) | Tail after indices <N has norm 3^(−N)→0 | Pass; actual output-row compactness |
| A74 §3.3 several analytic coordinates | f(z₁,z₂)↦f(3z₁,z₂) | Each z₂ⁿ maps to itself with norm 1; row supremum does not tend to 0 | Pass; partial contraction not compact |
| A75 §3.3 fully contracting product | f↦f(3z₁,3z₂), degree (m,n) | Eigenvalue 3^(m+n); degree 2 has three monomials, each norm 1/9 | Pass; all analytic coordinates contracted |
| A76 §4.1 Fredholm zero eigenvalue | operator diag(0,3); zero module | H=1−3T although dimension 2; zero module H=1 | Pass; zero eigenvalue invisible |
| A77 §4.1 generalized slopes/eigenbasis | Jordan block (3,1;0,3) | H=(1−3T)²; finite-slope space dimension 2, eigenspace dimension 1 | Pass; globally free eigenbasis cannot be inferred |
| A78 §4.1 choice/radius link | finite matrices P=(1,2;3,4), Q=(1,6;1,4) | Both have trace 5, determinant −2 and H=1−5T−2T² | Pass; actual intertwining, not density alone |
| A79 §4.1 ordinary convention | scalar 1/3 over ℚ₃ | Slope −1; slope≤0 space dimension 1, slope=0 space dimension 0 | Pass; norm≤1 needed to identify ordinary with ≤0 |
| A80 §4.1 finite Hecke algebra | one-dimensional slope piece over Noetherian R | End_R(R)=R; its unital R-subalgebra is R, generated by 1 | Pass; dimension-one instance, no eigenbasis inference |
| A81 §4.2 repeated row polygon | h=2, degrees j=0,…,7 | Degrees 0,0,1,1,2,2,3,3; partial sums n=0,…,8: 0,0,0,1,2,4,6,9,12 | Pass; correct indexing including n=0 |
| A82 §4.2 attained coefficient bound | diag(1,1,3,3) over ℚ₃, n=4 | T⁴ coefficient 9 has valuation 2; row lower sum 0+0+1+1=2 | Pass; attainment explicitly computed |
| A83 §4.2 projection norm loss | row product 3^(−2), C=3,n=4 | Correct bound C⁴·3^(−2)=9 versus unadjusted 1/9 | Pass; property (Pr) alone does not give contractivity |
| A84 §4.2 partial sums, not individual slopes | P=(0,1;3,0) over ℚ₃ | Row exponents 0,1; H=1−3T² has slopes 1/2,1/2; second 1/2<1, total 1=0+1 | Pass; termwise bound is false |
| A85 §4.2 dimension cutoff | h_U=2,v_p(π)=1,slope bound h=0 | Partial sum condition permits n≤2; convenient bound gives 2(0+2)=4 | Pass; bound valid but not sharp |
| A86 §4.2 multivariable repetition | d=2,h=1, m=0,1,2 | Multiplicities 1,2,3 equal binomial(m+1,1); d=0 instead finite-dimensional | Pass; do not evaluate d−1 formula at d=0 |
| A87 §4.2 finite classical factor | 2×2 zero/nilpotent versus diag(2,3) | First H=1 of degree 0; second H=1−5T+6T² of degree 2 | Pass; degree need not equal dimension |
| A88 §4.3 completed base change | finite extension L/K of degree 2 with basis 1,α | Every L-valued null sequence splits into two K-valued null sequences; algebraic tensor already surjects | Pass; no blanket nonsurjectivity claim |
| A89 §4.3 infinite extension | independent a_n∈L, scaled so coefficients tend to 0 | A finite tensor sum has coordinates in a finite-dimensional K-span; the constructed sequence has infinite-dimensional coordinate span | Pass; completed comparison adds actual sequences |
| A90 §4.3 nilpotent specialization | R=K[ε]/ε², operator multiplication by ε on R | H=1−εT≠1; every field specialization gives H=1 | Pass; reduced points insufficient |
| A91 §4.3 bounded-family character | p=3,n_w on 1+3ℤ₃, γ=(1,0;9,1), w=0,1 | Factors are 1 and 1+9z; corresponding Jacobs weights 2 and 3 | Pass; finite torsion factor remains explicit |
| A92 §4.3 empty form space/identity base change | zero coefficients; scalar map identity | Module remains 0, Fredholm series remains 1; identity sends coefficient a_n to a_n | Pass |
| A93 §4.4 half-weighted realization | b=e₂, w(2)=1 | Function T·binom(z,2) has values 0,0,T at z=0,1,2; unweighted model gives 0,0,1 | Pass; finite differences recover T and b₂=1 |
| A94 §4.4 gauge versus p-adic norm | U=p/T in H, gauge norm of U=1 | Powers Uʲ all have norm 1, so their terms are not null; norm of Tⁿ is αⁿ→0 | Pass; continuity is not a uniform p-adic Lipschitz assertion |
| A95 §4.4 p=2 torsion group ring | Δ={±1} over integral 2-adic coefficients | Proposed idempotents (1±[−1])/2 require 1/2; actual group-ring rank is 2 without those fractions | Pass; full finite factor retained |
| A96 §4.4 Mahler action at p=2 | γ=diag(2,1), input n=1,2,3 | Output coefficients m=0,…,4: [0,2,0,0,0], [0,1,4,0,0], [0,0,4,8,0] | Pass; column/input and row/output distinguished |
| A97 §4.4 Mahler action at p=3 | γ=diag(3,1), input n=1,2,3 | Output coefficients: [0,3,0,0,0], [0,3,9,0,0], [0,1,18,27,0] | Pass; matches finite-difference divisibility |
| A98 §4.4 bounded-column exponent | (m,n)=(0,0),(1,0),(3,2),(10,1) | E=floor(n/2)+max(m−n,0)−floor(m/2) gives 0,1,1,4; column lower bounds give 0,1,0,4 | Pass; no negative integer exponent hidden by Nat subtraction |
| A99 §4.4 contracting-row exponent | (m,n,p)=(3,2,2),(5,20,3),(10,1,2) | E_c=2,8,5; required ceil(m/2)=2,3,5 | Pass; grid described above; arithmetic Checks are padding in Lean |
| A100 §4.4 excluded p=1 | m=10,n=20,p=1 | E_c=5, required row bound 5 in this example; m=10,n=10 gives E_c=0<5 | Pass for p≥2; negative control excludes p=1 |
| A101 §4.4 repeated class rows | h=2,j=0,…,7 | ceil(floor(j/h)/2)=0,0,1,1,1,1,2,2 | Pass; h=0 handled as zero module/H=1, not division by h |
| A102 §4.4 principal determinant comparison | t=3,P=(1,2;3,4), weights (0,1) | Q=(1,6;1,4); det(P)=−2=det(Q); trace both 5 | Pass; cancellation needs no infinite inverse |
| A103 §4.4 repeated/empty indices and zero ring | e repeats an index; empty e; R zero | Repeated-row determinants 0=0; empty determinants 1=1; in zero ring both values 0 | Pass; finite determinant statement allows these inputs |
| A104 §4.4 Amice comparison depth | p=3,v₃(t)=1/4 | v₃(t)/2=1/8; s=1 threshold 1/6 fails, s=2 threshold 1/18 passes | Pass; no uniform shallow analytic stage |
| A105 §4.4 high-conductor counterexample | p=3,h=m=1, ψ(exp 3)=ζ₃ | Norm t=3^(−1/2); ψ(1+3z)=1 on 3ℤ₃, but value ζ₃≠1 at z=(exp3−1)/3 | Pass; unit-disc analytic extension impossible |
| A106 §4.4 unbounded conductor | m=1,2,3 | Norms t_m are 3^(−1/2),3^(−1/6),3^(−1/18), tending to 1 | Pass; any fixed finite refinement eventually fails |
| A107 §5.1 derivative/kernel | r=2 on 1,z,z³ over ℚ₃ | Derivatives 0,0,6z; kernel degrees≤1; in characteristic 3, D(z³)=0 despite degree 3 | Pass; characteristic zero retained |
| A108 §5.1 disc derivative scale | z=a+3w,r=1 | D_z(w)=1/3 versus D_w(w)=1; norm multiplier 3 | Pass; unscaled derivative would be wrong |
| A109 §5.1 dense range but not onto | y=Σ_{m≥1}3ᵐ z^(3ᵐ−1) | y coefficients have norms 3^(−m)→0; any primitive has coefficient 1 at z^(3ᵐ), which does not tend to 0 | Pass; polynomials still lie in range |
| A110 §5.1 Bol determinant sign | r=1,j=0,N=2z+1,L=3z+1 | Derivative N/L=−1/L²; determinant ad−bc=−1 gives same RHS | Pass; reversed determinant sign fails |
| A111 §5.1 Bol r=0,2 | r=0 arbitrary N,L; r=2,j=0,N=z,L=1 | Both sides Nʲ/L^(j+1) for r=0; for r=2 both equal 2 | Pass; zero-order and factorial conventions |
| A112 §5.1 nonconstant extra factor | r=1,f=1, extra factor 1+3z | Actual derivative 3; expression using only Df gives 0 | Pass; common factor must be constant |
| A113 §5.2 representative constants | c(rep)=2,r=1,φ(rep)=z² | Theta coordinate (1/2)·2z=z; unweighted derivative 2z | Pass; `theta_eval` is the definition, hence padding |
| A114 §5.2 Hecke scalar | r=1,p=3,ℓ=5 | Scalars 3,5,25 for U₃,T₅,S₅; scalar 1 for identity coset | Pass; finite absolute norm inverted |
| A115 §5.2 local polynomial kernel dimension | k=1,h=2,p=3,s=1,trivial action | One-disc kernel dimension 4; three-disc kernel dimension 12 | Pass; nontrivial invariants can reduce these dimensions |
| A116 §5.3 triangular determinant | U=(1,7;0,3), W=first coordinate | H=1−4T+3T²=(1−T)(1−3T); second-coordinate complement is not stable because of entry 7 | Pass; quotient operator, not invariant complement |
| A117 §5.3 rescaled Fredholm identity | U_cl=1, target scalar U′=1, p=3,r=1 | H_V=1−3T=H′(3T); full H=(1−T)(1−3T) | Pass; correct pʳ rather than p^(−r) |
| A118 §5.3 strict slope boundary | A=B=ℚ₃, θ=identity,u=3,u′=1,s=3,f=1 | Intertwining holds; λ=3 has slope 1=r and θf=1≠0 | Pass; equality at boundary cannot be admitted |
| A119 §5.3 below cutoff/generalized case | λ=1,s=3,u′=1; also N=0 | Intertwining forces (1−3)θf=0 and 1−3=−2 invertible, so θf=0; N=0 forces f=0 | Pass; handles boundary exponent N=0 honestly |
| A120 §5.3 normalization shift | degree k=0,r=1; rescale U by 3 | Cutoff 1 becomes 2 in valuations; eigenvalue 1 becomes 3, slope 0 becomes 1 | Pass; no normalization-independent cutoff |
| A121 Lean acceptance stand-in | A=B=0 in last theorem | All operators and θf are 0, conclusion 0=0; no classical subspace appears | R04; correctness of abstract lemma is not headline coverage |
| A122 dependency direction | earlier AAG at 33, QMF at 187 | AAG→QMF and QMF→AAG give a directed length-2 cycle, irrespective of positions | R01; ownership move required |

### Pinned objects and duplication by object

These 17 groups were opened at the manifest pins. Paths are relative to each library root; the last column distinguishes native objects from remaining targets.

| Pinned file and line | Object inspected and consequence |
| --- | --- |
| `Mathlib/Algebra/Quaternion.lean:1008`, `:1016`, `:1018`, `:1082` | `Quaternion.normSq`, its coordinate expression and ordered-ring nonnegativity. It is already the Hamilton norm; nonnegativity is not an order on an arbitrary number field. |
| `TauCeti/Algebra/Quaternion/NormForm.lean:78`, `:84`, `:88` | `QuaternionAlgebra.normForm` is the scalar part of x·star(x), with real body and coordinate formula. No replacement norm is needed. |
| `TauCeti/Algebra/Quaternion/AlgEquiv.lean:77`, `:93`, `:106`, `:114` | `trace_mulLeft`, `reducedTrace_eq_of_algEquiv`, `map_star_of_algEquiv`, `normForm_eq_of_algEquiv`; the equivalence results require regularity of 2. Number fields discharge it. |
| `TauCeti/Algebra/Quaternion/BaseChange.lean:36` | `TauCeti.QuaternionAlgebra.map` is a native coefficient map. The arithmetic adelic/topological comparison still requires its stated construction. |
| `TauCeti/Algebra/Quaternion/Split.lean:121`, `:219` | `oneEquivMatrix` and `aNegAEquivMatrix` give explicit split presentations; they are not a classification of all abstract degree-two central simple algebras. |
| `TauCeti/Algebra/Quaternion/CentralSimple.lean:81`, `:125`, `:159` | Simplicity, centre and central-unit interfaces. The proposed abstract-presentation/naturality adapter differs from these presentation-level results. |
| `Mathlib/GroupTheory/DoubleCoset.lean:79`, `:82` | `DoubleCoset.Quotient` and `rel_iff`; the native quotient itself includes no arithmetic finiteness or compactness hypothesis. |
| `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133` | `IsModuleTopology` pins the scalar-module topology. Its name does not itself assert all separation/local compactness properties of arbitrary modules. The Lean theorem carries the intended instance explicitly. |
| `Mathlib/NumberTheory/HeckeRing/Defs.lean:75`, `:183`, `:188` | `IsHeckeTriple`, `HeckeCosetModule`, `HeckeRing`; finiteness/commensurability data and the Finsupp carrier already exist. The carrier definition is not by itself a proof of multiplication compatibility. |
| `TauCeti/NumberTheory/HeckeRing/Multiplication.lean:95` | `HeckeCosetModule.mul` supplies the general product. This roadmap must consume it and prove the opposite-action adapter. |
| `TauCeti/NumberTheory/HeckeRing/Representation.lean:117`, `:143`, `:160` | `HeckeCoset.heckeSum`, `heckeSum_eq_sum_of_rightCosets`, `heckeSum_comp_of_mem`; actual generic finite sums and covariance, rather than a missing Hecke algebra. |
| `TauCeti/RepresentationTheory/SymmetricPower.lean:47`; `TauCeti/RepresentationTheory/SU2/SymmetricPower.lean:97` | `Representation.symmetricPower` and `TauCeti.SU2.symPower`; right polynomial/dual conventions must be compared with these existing representations. |
| `Mathlib/RingTheory/PowerSeries/Inverse.lean:82`, `:95`, `:100`, `:105` | `invOfUnit`, constant coefficient and inverse identities. `weightColumn` supplies the genuine unit constant d, so it does not use a division-by-zero junk value. |
| `Mathlib/RingTheory/PowerSeries/Restricted.lean:87` | Native restricted-series subring. Formal or restricted series alone do not bundle the arithmetic analytic weight action. |
| `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:66`, `:88` | Normed restricted-series carrier and Gauss-norm comparison; no reason to introduce a second Tate algebra. |
| `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` | `ZeroAtInftyContinuousMap` is a continuous function with convergence to zero along the cocompact filter. On discrete ℕ this is the required null-sequence carrier; it does not include the weighted function-realisation map. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132` | `Matrix.charpoly` is det(TI−M). The finite polynomial exists; a nonarchimedean infinite Fredholm series is a different object. |

Object searches covered norms/involution, central simplicity, coset sums/opposite actions, symmetric powers, Tate series, weighted Mahler modules, Bol and Fredholm series. Native Fredholm-index/alternative files are different objects. No fully qualified declaration collision with another roadmap was found; sibling references to the six named interfaces are consumption. R05 records elementary/duplicate acceptance statements.

### Resolved roadmap contracts and ownership

Main was verified at `3ec8d5f97285d3a04491f8d9662b5dad2bb4f6ff`. Read repository README/CONTRIBUTING, ModularForms, completed RestrictedProducts and supplier sections. Both resolver leads are false alarms: `DefiniteQuaternion.finite_stab` exists here; `LocallySymmetric.AutomorphicForm` is a planned ALS.F.6 carrier, not asserted native Mathlib.

Used `roadmaps grep`/`roadmaps show`, main and pinned reads. Board searches found CM/Heegner and HilbertModularVarietiesAndShimuraCurvesPartII consumers, not another half-weighted annular owner. Available open work, including OverconvergentAutomorphicForms, was searched by object; inaccessible open-PR contents were not checked.

| Resolved supplier | Section/file witness and ownership decision |
| --- | --- |
| RestrictedPowerSeries | Main README §§2.2–2.4 (lines 324,340,364), §7.2 (723): substitution, derivative, identity theorem, entire series. Retain only the arithmetic weight/Bol adapter here. |
| PadicFunctionalAnalysis | Main README §3.2 (562), §4.4 (706), §§5.4–5.6 (942,961,982): Mahler/Amice bases, depth bounds, analytic factors, annular ring and gauge. The half-weighted arithmetic action is new here; generic c₀ and ring construction are not. |
| CompactOperators | Main README §§0.1–0.2 (151,221), §0.4 (277), §§1.2,1.4–1.7 (368,400,418,432,444), §4.1 (786): finite-image approximation, conditional row converse, (Pr), minors, diagonal intertwining, retract, triangular determinant, base change and bounds. These match the actual claims used. |
| NewtonPolygons | Main README §§2.5 (585),3.3 (667),4.2 (731): coefficient bounds, roots and slope factors. No second Newton-polygon theory needed. |
| AdicSpacesPartII | Main README R0.5, `completed-tensor-banach-module`, line 2789: complete Hausdorff Banach modules, topological tensor completion, split exactness and c₀ scalar extension. CompactOperators §1.7 supplies the ring-level comparison used here. |
| QuadraticFormInvariants | Main README Layer 2, line 1097: explicitly consumes native Tau Ceti quaternion norms, split/division and equivalence APIs. The abstract degree-two presentation and arithmetic adapters are distinguishable extensions, not a re-plan of that layer. |
| RepresentationTheory/SemisimpleAlgebras | Main README Layer 4, line 249, and Layers 5–6: central simple algebras, centralizers and splitting. The scope table should name the exact layers rather than just the subroadmap. |
| GlobalNumberFields | Main README Layer 0, line 235; Layers 4–7, starting 412: product formula, adeles/ideles and multiplicative quotients. Its line 208 uses squared complex absolute values, relevant to R03. |
| ModularForms | Main Layer 2(a), the abstract Hecke-ring target, resolved against the native Hecke files above. The arithmetic action, not the convolution ring, is this roadmap's remaining target. |
| ReductiveGroups | Main Layer 6, line 466: reductive centre/derived-group infrastructure. The specific GL₁(D) functor and its arithmetic comparisons remain explicit targets; no nonexistent generic automorphic carrier is inferred. |
| AdelicAlgebraicGroups | Resolved README §§1.1–1.2; §3.4 `class-number-finite` at line 3072; §4.5 class-set/abelianization bijection at 4803, with noncompact simply connected derived factors, satisfied by split GL₂; §5.3 at 5196. Reverse consumption at 294–295 and 4013–4015 is R01. |
| ArithmeticLocallySymmetricSpaces | Resolved README ALS.F.6 (920), F.7 (991), 0.4 (1234),0.6–0.8 (1324,1366,1392),1.1 (1688),1.3 (1825),3.1 (2603),5b.1 (4170),5b.4–5b.5 (4296,4372),5b.8 (4567). Automorphic carriers, inverse/right-translation convention, local systems, finite-level descent, cuspidal cohomology and purity are named there. The Bianchi specialisation is distinct. |
| AutomorphicFormsOnReductiveGroups | Resolved README §2.6 (434), §§7.4–7.6 (1193,1216,1237): complex-place representation input, inverse-action Hecke equivalence, Gross covariance, definite realisation and central character. §§7.4–7.6 themselves consume this roadmap; R01, not a missing-citation allegation. |
| GL2AutomorphicRepresentationsAndTransfer | Resolved README R16.1.6 (537), R16.2.13 (805), R16.4, R17.3.9 (1702 onward): component restriction, archimedean modules, Whittaker exclusion and definite transfer. Reverse consumption in R17.3.9 (1740 onward) contributes to R01. |
| HilbertModularVarietiesAndShimuraCurves | Resolved README R18.3.3 (2674 onward), R18.3.20–R18.3.22, and supplier contract at line 135: central-character specialisation and coefficient-dual/norm-twist transfer conventions. Its consumption of §§0.3,1.3,2.1–2.2,3.1 here is the reverse edge in R01. |
| KleinianGroups | Resolved Layer 0 upper half-space and Layer 3 Bianchi groups (line 315): geometry consumed, not reconstructed here. Infinite arithmetic stabilisers do not contradict finite point stabilisers of their H³ action. |
| LocallyAnalyticDistributions; AlgebraicModularFormsAndSerreWeights | §4.2 in the former is a consumer of completed base change; geometric/characteristic-p theta in the latter is excluded from this roadmap's characteristic-zero derivative. These are boundaries, not new prerequisites. |

Supplier citations were read as contracts; absent `*Needs:*` lines are R09. No relocation or source edit was applied. R01 specifies the required ownership repair.

## Not verifiable

- **Gross, Algebraic modular forms (1999), pp.61–93:** the source service resolved the DOI `10.1007/BF02780173` only as uncertified/paywalled. Its precise primary proof was not read. Loeffler's open Proposition 3.8.1 and the named supplier statements were checked; they do not certify every Gross locator.
- **Harder, Eisenstein cohomology … GL₂ (1987), pp.37–118:** resolved as uncertified/paywalled. The primary proof of the archimedean/cohomological comparison in §2.6 was not checked. It is not re-requested as an unsettled source.
- **Harder, On the cohomology of SL(2,𝒪) (1975), pp.139–150:** the sources service and searches for author/institutional full text located bibliographic references but no legal readable copy. The missing-reference record includes this work and §2.6. Şengün §5 confirms the H¹ statement but is a survey, not the missing primary proof. The review is finished rather than parked for this text.
- **Published Williams numbering/conventions:** arXiv v2 was read at the locators above; agreement with the published 2017 version, any published correction of the component formula, and the intended normalization of the bare absolute-value symbol have not been certified. R03 requires the comparison to specify it.
- **External implementation transitive assumptions:** the pinned FLT finiteness file was read, but its full transitive imports and the PhD project's theorem dependencies were not independently built/audited. The target correctly treats them as external port/comparison sources, not installed proof dependencies.

## Source issues

- **Error** in williams at Definition 1.1 and Theorem 1.3, printed pp.4–5: the source says the level with both diagonal entries congruent to one has an ordinary-class-number component decomposition; it should be indexed by the determinant ray quotient, or use a level with unrestricted determinant; affects a stated result.
- **Error** in jacobs at Definition 1.27 and equation (1.5.13), printed p.19: the source says every locally analytic character gives the indicated Tate-disc action at arbitrary depth; it should require character-dependent analytic admissibility at that depth; affects a stated result.
- **Misprint** in buzzard-eigen at proof of Proposition 11.1, printed p.76: the source says diag(πˢ,1) belongs to GL₂ of the integral local ring; it should belong to GL₂ of the local field when any component of s is positive; affects the proof.

