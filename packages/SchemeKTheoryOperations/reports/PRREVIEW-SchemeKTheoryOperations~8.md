# Review of SchemeKTheoryOperations (pull request #1229 at 46fa384)

**Verdict:** needs changes

🤖 Independent AI incremental review of the 95 lines changed since 07d5e4d (the new §7.3a and the lines that cite it). Five findings, three of them blocking. The gate passes.

## R01 (P2) — The divisor axiom is stated for schemes and used on simplicial schemes

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:2984 and :2990: "Let `Y→X` be a smooth morphism in 𝒱 and `ι:D→Y` an effective Cartier divisor smooth over X"; "For every simplicial scheme `X_•` … satisfying the Whitney sum formula".

**Claim.** T1 derives Whitney on every simplicial scheme from an axiom quantified over schemes. T2's stability (`E_{N+1}|=E_N⊕O`) and T6's tensor polynomial on `B_•GL_r×B_•GL_s` both need the simplicial Whitney formula.

**Witness.** For `0→L′→E→L″→0` on `X_•`, `(ξ−c₁L″)∪(ξ−c₁L′)=0` is the axiom for `P(L″)_•⊂P(E)_•`. Levelwise vanishing does not give it: `H²(B_•(ℤ/2),ℤ)=ℤ/2`, every level has `H²=0`.

**Repair.** State the axiom on simplicial schemes: "Let `Y_•→X_•` be a smooth morphism of simplicial schemes with terms in 𝒱 and `ι:D_•→Y_•` a levelwise effective Cartier divisor, smooth over `X_•`. If `a∈H^k(Y_•,Γ(i))` has `ι*a=0`, then `a∪c₁(O(D_•))=0`." In :2986 require the Gysin map and the projection formula as a commutative diagram in the derived category (Weibel, Definition V.11.14 (v), PDF pp. 468–469), so that they pass to simplicial schemes, and verify the K-cohomology instance of :3040 in that form. With the simplicial axiom, the witness step is the axiom applied to `P(L″)_•⊂P(E)_•`.

## R02 (P2) — The K-cohomology instance lives on a category that is not a 𝒱

**Location.** README.md:2979 and :3040: "Fix an essentially small full subcategory 𝒱 of schemes containing every scheme smooth of finite type over one of its members"; "On smooth quasi-projective varieties over a field, K-cohomology … is a theory".

**Claim.** Smooth quasi-projective varieties over a field are not closed under "smooth of finite type over a member", so :3040 is not an instance of the definition. The same holds for the domain of Schneider §4 and of the Deligne classes named at :3178.

**Witness.** Hironaka's smooth proper non-projective threefold is smooth of finite type over `Spec ℂ`, a member, and is not quasi-projective.

**Repair.** In :2979 write "containing every open subscheme of a member and every scheme smooth and quasi-projective over a member, for instance the smooth quasi-projective schemes, the smooth schemes of finite type, or the schemes of finite type, over a fixed Noetherian base". T1–T3 use only opens, `GL_N^k×X`, projective bundles and flag bundles, all of this kind. In :3040 write "schemes" for "varieties". Tested: Hironaka's threefold is no longer required, and a scheme smooth quasi-projective over a smooth quasi-projective k-scheme is one.

## R03 (P3) — The rank component of the λ-ring target is ℤ

**Location.** README.md:2990: "`[E]↦(rank E,c_t(E))` is a homomorphism of augmented λ-rings from K₀ of vector bundles on `X_•` to `ℤ×(1+∏_{i≥1}H^{2i}(X_•,Γ(i))tⁱ)`".

**Claim.** The rank of a vector bundle is a locally constant function, as README.md:29 fixes ("locally constant integers, including disconnected schemes"); T1 also defines `c_i` only for constant rank r, which does not generate K₀ on a disconnected base.

**Witness.** `X=Spec k⊔Spec k`, E of rank 1 on one point and 2 on the other: `rank E=(1,2)∈H⁰(X,ℤ)=ℤ²`, not in ℤ. Schneider, §4, p.20 has `H⁰(Y_•,ℤ)`.

**Repair.** Write `H⁰(X_•,ℤ)×(1+∏_{i≥1}H^{2i}(X_•,Γ(i))tⁱ)`, and in T1 "every vector bundle E, of locally constant rank r, … `c_i(E)=0` where `i>r`". On the witness, `(1,2)∈H⁰(X,ℤ)` and `c₂(E)` is supported on the second point.

## R04 (P2) — §7.3a and four open roadmaps each construct the same classes

**Location.** README.md:3178: "The higher Chern classes of KTheoryFiniteLocalFields … MotivicEtaleKTheory … PadicHodgeRegulators … and AnabelianGeometryAndNonabelianChabauty … are the instances of §7.3a for their theories."

**Claim.** At their open heads these roadmaps build the universal classes and the maps on K-groups themselves and do not cite §7.3a; `## Scope and ownership` here does not say that this roadmap owns the construction. The object has five owners.

**Witness.** #1281 KTheoryFiniteLocalFields/README.md:317–321 builds universal étale classes and `earlyChern` by Moore–Hurewicz and slant product (:387 "independent"); #1498 PadicHodgeRegulators/README.md:930; #1021 AnabelianGeometryAndNonabelianChabauty/README.md:8438; #1470 MotivicEtaleKTheory/README.md:246.

**Repair.** This roadmap is first in the merge order (line 37; the others 90, 138, 177, 329), so §7.3a is the owner. Add to `## Scope and ownership`: "§7.3a owns the Chern classes out of higher K-theory, with supports and finite coefficients, for every theory satisfying its two axioms. A roadmap that defines a cohomology theory owns the theory and the proof of the two axioms, and obtains its classes from §7.3a: KTheoryFiniteLocalFields §§1.8 and 6.10, MotivicEtaleKTheory §2.0b and its Deligne classes, PadicHodgeRegulators §4.1 and AnabelianGeometryAndNonabelianChabauty §7.0." The four pull requests then cite §7.3a in place of their own constructions.

## R05 (P3) — The description does not mention §7.3a

**Location.** Pull request description, summary block: "The top layers build λ- and Adams operations with weight decompositions, compared with cycles through Adams Riemann–Roch, excess intersection and a rational isomorphism between supported Chow groups and graded supported K₀".

**Claim.** The head adds a section that constructs Chern classes on higher K-groups for a general cohomology theory and names four roadmaps as its instances; neither the summary nor the prose says so.

**Witness.** README.md:2975 `### 7.3a Chern classes with values in a cohomology theory` (76 lines, T1–T8) and README.md:3178; the description has no occurrence of "Chern".

**Repair.** Add to the summary and to the prose: "§7.3a constructs Chern classes `c_{i,j}:K_j(X)→H^{2i−j}(X,Γ(i))`, with supports, finite coefficients, the product formula and compatibility with Adams operations, for every cohomology theory satisfying a projective bundle and a divisor axiom; the étale, motivic, Deligne and syntomic classes of KTheoryFiniteLocalFields, MotivicEtaleKTheory, PadicHodgeRegulators and AnabelianGeometryAndNonabelianChabauty are its instances."

## Previous findings

- none: the previous report (r7, of 07d5e4d) was an acceptance with no finding.

## Verified sound

Index order in the table is the README's: (weight i, K-degree j).

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Projective bundle axiom, :2983, and negative weights, :2979 | `P¹_X`, `Γ(i)=μ_m^{⊗i}`, k=2, i=0 | `a=0`: `H²(X,Γ(0))`; `a=1`: `H⁰(X,Γ(−1))·ξ`. Weight −1 occurs | Correct |
| Degrees of `c₁`, :2979 | Line bundle; unit | `H¹(X,O^×)=H²(X,O^×[−1])→H²(X,Γ(1))`; `H⁰(X,O^×)=H¹(X,O^×[−1])→H¹(X,Γ(1))` | Correct |
| Defining relation of T1, :2990 | r=1; `E=L₁⊕L₂`, quotient convention | r=1: `P(L)=X`, `O(1)=L`, `ξ−c₁(L)=0`. r=2: `ξ²−(a+b)ξ+ab=(ξ−a)(ξ−b)` | Correct; same signs as Weibel V.11.11 proof |
| Whitney on simplicial schemes, T1 | `P(L″)_•⊂P(E)_•`; `B_•(ℤ/2)` | Needs the axiom simplicially; `H²(B_•(ℤ/2),ℤ)=ℤ/2`, levels 0 | R01 |
| Admissible 𝒱, :2979 against :3040 | Smooth quasi-projective ℂ-varieties; Hironaka threefold | Threefold smooth of finite type over a member, not quasi-projective | R02 |
| λ-ring target of T1 | `Spec k⊔Spec k`, ranks (1,2) | `rank E=(1,2)∈ℤ²`, target has ℤ | R03 |
| T2 terms in 𝒱 | `B_•GL_{N,X}`, `P(E_N)` | `GL_N^k×X`, `P(E)` smooth and quasi-projective over X: in 𝒱 under either closure clause | Correct |
| T3 target degree, :3001 | j=0, 1, 2i | `H^{−j}` of Dold–Kan of `τ^{≤2i}Γ(i)[2i]` is `H^{2i−j}(X,τ^{≤2i}Γ(i))` for `j≥0`; j=2i gives H⁰ | Correct |
| T3 additivity only for `j≥1`; Check 4, :3049 | `P²_X`, `2[O(1)]` | `c_t=(1+ξ)²`, `c₂=ξ²≠0` iff `1≠0` in `H⁰(X,Γ(0))`; `c₂(O(1))=0` | Correct |
| T4 degree-two correction, :3011 | `β∈K₂(ℝ;ℤ/2)=ℤ/4`, m=2, i=2 | `c(2β)=2c(β)+1·c({−1,−1})=[ℍ]≠0`; additive value `2c(β)=0` | Correct (WeibelChern 2.4, 2.6.2) |
| T4 Bockstein range `j≥3`, :3012 | j=2, 3 | Target `K_{j−1}(X;ℤ/q)` carries classes only for `j−1≥2`; j=2 excluded | Correct |
| T4 triangle direction, :3012 | `0→ℤ/q→ℤ/qr→ℤ/r→0` tensored with `Γ_{qr}` | `Γ_{qr}⊗ᴸℤ/q=Γ_q` first, `Γ_r` third; matches the K-theory sequence `K(;ℤ/q)→K(;ℤ/qr)→K(;ℤ/r)` | Correct |
| T5 `c_{1,1}=c₁∘det`; Check 1 | Étale `μ_m`, unit u | Kummer class of `det`, Weibel V.11.10; `c_{i,1}([u])=0` for `i≥2` since `c_i(id₁)=0` | Correct |
| T6 coefficient; Checks 2, 3 | i=2 (1,1); i=3 on `{a,b}·[c]`; i=1 | `−1!/(0!0!)=−1`; `(2,1)`: `−2!/(1!0!)·(−c₁a∪c₁b)∪c₁c=+2`; i=1: empty sum, 0 | Correct; general `(−1)^{n−1}(n−1)!` |
| T6 even modulus, :3026 | m=2, `{−1,β}`, i=3 over ℝ | Formula gives `−2·c_{2,·}(−1)∪c_{1,·}(β)=0`; true value `{−1,−1,−1}≠0` (WeibelChern 3.3, 3.4) | Correct: correction term stated for m=2, weight ≥3 |
| T8 `ψ^k`, :3034 | `L₁+L₂`, roots a, b | `c₁(ψ^k)=k(a+b)`, `c₂(ψ^k)=k²ab` | Correct for j=0; `j≥1` is Schneider p.25 |
| T8 character, :3034 | Weights `i₁+i₂=i` | `(−1)^{i−1}/(i−1)!·(−(i−1)!)/((i₁−1)!(i₂−1)!)=(−1)^{i₁−1}(−1)^{i₂−1}/((i₁−1)!(i₂−1)!)` | Multiplicative; correct |
| Boundary factor, :3038 | i=1, 2 | `(1−i)`: 0 at i=1, −1 at i=2; degrees `2(i−1)−(j−1)=2i−j−1` | Correct (WeibelChern 4.2, exception q=2, n=3, `c₃₃`) |
| Index translation, :31 and :3235–3237 | Schneider p.16; Soulé II.2.3; WeibelChern (2.1) | Schneider: `K_i→H^{2j−i}`, weight second; Soulé, Weibel: `c_{i,k}`, `k=2i−n` | Correct |
| Ownership of the classes, :3178 | Four open heads | Each builds universal classes itself; none cites §7.3a | R04 |

Statements the diff does not change stand as in the previous review, of `07d5e4d`. `Suggested.lean` is unchanged, so its three signatures, the headline list and the padding probe stand; its docstring already names "Chern classes and characters" as not statable.

- Source locators: all 31 bracketed locators of §7.3a opened and found at the stated pages: Schneider 9 (pp.14–29), Weibel V.11 11 (PDF pp.459–469), WeibelChern 3, Soulé.1979 3, HuberWildeshaus 3 (Theorem B.3.7, p.116 = PDF p.90), Jannsen.1988 2. The page offsets and the notes on index order in the seven new reference entries agree with the texts.
- Seeded sample: of the fifteen sampled sections only §7.3a contains a changed passage; it is the table above. The README flags no locator as unverified.
- Library declarations at the pin (Mathlib 1b1ccf4): `AlgebraicGeometry.Scheme.zariskiTopology` (AlgebraicGeometry/Sites/BigZariski.lean:51), `CategoryTheory.Sheaf.H` (CategoryTheory/Sites/SheafCohomology/Basic.lean:57), `DerivedCategory` (Algebra/Homology/DerivedCategory/Basic.lean:87), `CategoryTheory.Abelian.DoldKan.equivalence` (AlgebraicTopology/DoldKan/Equivalence.lean:167), `groupCohomology` (RepresentationTheory/Homological/GroupCohomology/Basic.lean:183), `Matrix.GeneralLinearGroup` (LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43).
- Cross-roadmap citations resolved: StableHomotopyKTheory §§3.12, 3.25, 7.1–7.4 (open head; headings present), EnhancedDerivedSheaves §§0.1–0.4 (main; K-flat replacements on an essentially small ringed site at §0.2), AlgebraicModuliForArithmeticGeometry §1.3 (open head; `flagBundle`). Internal: §§3.6, 4.1–4.3, 4.6, 5.5, 6.1, 6.2.2, 6.4, 6.6–6.9, 7.2, 7.3 exist and state what is cited (directed-union identification, `ℤ×ℤ∞BGL`, `K_m^Y(X)≅H_Y^{−m}(X,ℤ×BGL⁺)`, classifying cocycle, coefficient Moore comparison).
- Gate, rerun at this head: `gate SchemeKTheoryOperations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate.md also has build=0. Dependency check: `depcheck: 223 roadmaps, 1977 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. `lake env lean` on Suggested.lean: only `declaration uses sorry` at 57:8. No file outside the folder changed.
- §7.3a adds no supplier roadmap: its four external suppliers were already suppliers and are earlier in the merge order or on main. The overlaps tool lists no dropped id and no other pull request changing this roadmap.
- Overlap check: read GeneralAlgebraicKTheory, KTheoryLowDegrees, KTheoryFiniteLocalFields, MotivicEtaleKTheory, SchemeKTheoryOperationsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations, BordismFormalGroups; shared object: Chern classes out of higher K-theory, built here and in KTheoryFiniteLocalFields and MotivicEtaleKTheory (also PadicHodgeRegulators, AnabelianGeometryAndNonabelianChabauty); owner SchemeKTheoryOperations §7.3a, first in the merge order (R04). SchemeAndStackFoundations §5.7 keeps the geometric Chern classes on K₀, cited by §7.2.
- Source independence: changed passages only; 16 passages compared with 6 sources, none shared; largest share of the new locators Weibel, 11 of 31; no layer added, removed or reordered, so the contents were not compared again. T1–T8 are ordered by their *Needs:* lines (T2 needs T1, T3 needs T2, T4 needs T3, T6 needs T1–T4), not by Schneider §4, which places the maps on K-groups before the classes of bundles.

## Not verifiable

- Gillet.1980 and Gillet.1981 are cited as whole works without locators (:2977) and were not opened; no statement rests on them alone.
- Kal80 locators are untouched by this diff and stand as verified in r6.
- Lean coverage of §7.3a is README-only: K-groups of schemes are absent at the pins.

## Source issues

- **Gap** in Schneider at §4, Proposition on p.21: the source says the Chern classes give a λ-homomorphism on simplicial schemes, citing Grothendieck, with the weak Gysin property (IV) of p.20 assumed for schemes only; it should be property (IV) for simplicial schemes, or Gysin maps and projection formula in the derived category; affects the proof.

## For the human reviewers

- Licence: the Schneider text (README.md:3235) is a chapter of an Academic Press 1988 volume, read from a seminar page on math.stanford.edu that is not the author's; the README calls it an "institutional seminar copy".
- Licence: packages/SchemeKTheoryOperations/sources.toml records only Kal80; the seven works §7.3a adds (Gillet.1980, Gillet.1981, Schneider, Soulé.1979, WeibelChern, HuberWildeshaus, Jannsen.1988) have no manifest entry. This review edits no manifest.
- Scope of the change: §7.3a moves the ownership of higher Chern classes into this roadmap; the open pull requests #1281, #1470, #1498 and #1021 still construct their own at their heads (R04) and need the matching revision.
