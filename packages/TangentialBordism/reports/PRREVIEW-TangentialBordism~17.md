# Review of TangentialBordism (pull request #942 at be5e94d)

**Verdict:** needs changes

This is a full review of be5e94d. There is one P2 finding and four P3 findings. Of the ten findings of ~16, seven are repaired, one is partly repaired (R02 below) and two are not repaired (R04, R05); see the table at the end of the findings.

## R01 (P2) — η³ = 12ν has two owners: B3.3 here and K3BlochGroups §4.9

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:2231–2240` (8.3, B3.3): "Prove that η³=12ν≠0 in π₃S≅ℤ/24, with StringOrientation S2.3's generator ν … so η³ is the element 12ν of order two."

**Claim.** B3.3 owns this relation as a target with its own route (mod 2 Adams spectral sequence of the sphere in stems ≤ 5). Scope and ownership names no other owner and no consumer of it.

**Witness.** K3BlochGroups at #1430 (d0c9190), `README.md:1345–1352`: "### 4.9 The relation η³=12ν … This section proves that the cube of the stable Hopf class is the element of order two", with API `etaCube_eq_twelveNu`. In the merge order TangentialBordism is line 14 and K3BlochGroups line 137.

**Repair.** This roadmap comes first in the merge order, so keep B3.3 as the owner. Add one sentence to Scope and ownership: "B3.3 owns η ≠ 0 in π₁S and η³ = 12ν ≠ 0 in π₃S ≅ ℤ/24, with η the Lie-framed circle and ν StringOrientation S2.3's generator; later roadmaps, K3BlochGroups §4.9 among them, cite B3.3."

The duplicate proof in K3BlochGroups §4.9 then becomes a citation in that roadmap's own review.

I checked that no earlier owner exists. `roadmaps grep` finds the relation in only three places: here, in K3BlochGroups, and in FourManifolds at #936 (`README.md:2881`), which only cites Kirby–Melvin for it. None of the suppliers states it: not StringOrientation S2.3 at #948 (`:607–664`, the stem and ν only), and not EllipticCohomology E4.S on main (`:913–980`, detections of η, ν, ε, κ, with no cubic relation).

## R02 (P3) — ΩSpin₃ = 0 (8.3) and B3.4's isomorphism below degree 8 (7.2) have no locator

Re-raised: the remaining part of ~16 R05.

**Location.**
- `README.md:2222`: "Prove ΩSpin_3=0 from item4's below8 ABS comparison, π₃ko=0 and B5's geometric PT inverse".
- `README.md:2091–2092`: "Prove that B3.0's D:MSpin→ko is an isomorphism on π_n for n<8 and onto for n=8".

**Claim.** These classical theorems are cited at a source.

**Witness.** 7.2 (`:2089–2148`) cites no source at all. 8.3 cites Freed and Hatcher only for η and η³ (`:2230–2233`). ~16 R05, item 2, asked for a locator for ΩSpin₃ = 0. Thom IV.13 (thom1954 line 2686, p.81) tabulates only the oriented groups.

**Repair.** In 7.2 and in 8.3, cite Anderson–Brown–Peterson, *The structure of the Spin cobordism ring*, at the theorem giving the ko summand of MSpin_(2) and the low Spin coefficient groups, by theorem number and page. It is already in References (`:3065–3067`); extend its "for" clause to B3.3 and B3.4.

Record it as uncertified if it stays behind the paywall: the sources service found no legal open copy, nor of Milnor's *Spin structures on manifolds* (1963).

## R03 (P3) — The scope paragraph's list of what BordismFormalGroups consumes contradicts Downstream consumers

**Location.** `README.md:34–38`: "use BordismFormalGroups F3–F5, which consume B4.2, B4.7 and B4.8 below; … These three items lie downstream of B4.2, B4.7, B4.8 and B5.4, and none of those uses them."

**Witness.**
- `README.md:3031–3032`: "BordismFormalGroups F3–F5, which consume B4.2, B4.7, B4.8, B4.4–B4.6 and B5.4".
- BordismFormalGroups on main also consumes TB's geometric MU comparison (`:188`, which is B5.4c) and TB's MO coefficients (`:205`, `:272`, which are B4.4–B4.6).

**Repair.** At `:35–38`, write "which consume B4.2, B4.4–B4.8 and B5.4 below" and "lie downstream of B4.2, B4.4–B4.8 and B5.4, and none of those uses them".

The corrected sentence is true:
- B4.4 needs B4.2–B4.3 (`:1752`).
- B4.5 needs B4.4, B5.4 and B2.4 (`:1781`).
- B4.6 needs B4.4–B4.5, B5.4 and B1.6 (`:1818`).
- B5.4 needs B5.1–B5.3, B1.6, B2.1–B2.3 and S2.2 (`:1600`).

None of these uses B3.3, B3.4 or B5.5.

## R04 (P3) — AlgebraicTopology 8.13 exists only at #1663, which the description does not name

Not repaired: ~16 R08 (~15 R01).

**Location.**
- `README.md:306`: "Layers2–4,6,8 and 8.13". 8.13 is also cited at `:79`, `:455`, `:479`, `:498`, `:520`, `:563`, `:881` and `:3026–3030`.
- The pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Witness.**
- On main, AlgebraicTopology uses Stage numbering and has 0 hits for "8.13".
- At #1652 (1f5b3f6), Layer 8 runs 8.1–8.12 (`:2605–3397`), with no smoothing or transversality item.
- At #1663 (a67088d), Stage 8 item 13 (`:2585–2640`) owns the three boundaryless-source theorems.
- The two revisions number AlgebraicTopology differently.

**Repair.** Name #1663 beside #1652 in that paragraph. Say which of the two is rebased onto the other, so that one head carries both 6.3 (#1652's Layer numbering) and 8.13. No README change.

## R05 (P3) — DifferentialGeometry 5.5b exists only at #886, which the description does not name

Not repaired: ~16 R09 (~15 R02).

**Location.** `README.md:307`: "5.5b's smooth face structure and face-indexed abstract boundary". 5.5b is also cited at `:401`, `:440`, `:528`, `:563`, `:575`, `:642`, `:687`, `:690`, `:789` and `:881`. The description paragraph is the same one quoted in R04.

**Witness.** DifferentialGeometry on main has 0 hits for "5.5b". At #886 (4d6e96e), `README.md:38` and `:83` define it. `roadmaps overlaps` lists the same lead (`:563`, `:789`).

**Repair.** Name #886 in the revision paragraph of the description. GeometricTopology 1.1, 4.3.1 and 11.3 exist only at #903 (8bd9871, `:570`, `:3538`, `:13218`). The description already links #903 in its Finite Arf paragraph, so #903 needs no change.

## Previous findings (~16)

| ~16 | Status | Evidence at be5e94d |
| --- | --- | --- |
| R01 (P2) ΩSO₃ = 0 statable | Repaired, and extended to ΩSO₁,₂ and ΩO₁,₃ | `Suggested.lean:113` `closedOrientedManifold_isOrientedBoundary (n : ℕ) (hn₁ : 1 ≤ n) (hn₃ : n ≤ 3)`; `:131` `closedManifold_isBoundary`; docstring narrowed (`:29–35`); README 8.4 names both, with Thom IV.12/IV.13 (`:2267–2280`) |
| R02 (P2) loop through S5.3 | Repaired | 6.4 (`:1850–1853`): "nothing here consumes S5.3"; S5.3 is gone from 6.4's *Needs:* (`:1872`) and from Layer 6 Dependencies (`:2011`); it is added to 7.2's *Needs:* (`:2148`) and Layer 7 Dependencies (`:2156`). The item chain B4.x → BFG F2 → F3–F5 → S5.3 → B3.4 is acyclic. At #948 (`:1173–1183`) the equivalence uses only DGFloer Layer 1 items 2 and 4, CharacteristicClasses C2 and Whitehead |
| R03 (P3) pinned tube, exhaustion, collapse | Repaired | From Tau Ceti `:269–298`; B1.6 `:482–492`, `:533–536`; B5.1 `:1261–1265`; B5.2 `:1344–1357`; hypotheses checked at the pin (below) |
| R04 (P3) Thom IV.17 | Repaired | `:2679–2683` cites III.2–III.4 (p.59) and III.9 (pp.62–63) |
| R05 (P3) 8.1/8.3 locators | Partly | 8.1 cites Atiyah Thm 5 (pp.59–60) and Thm 2 (p.48), `:2173–2178`; 8.3 cites Freed (5.57) p.45 and Hatcher p.385, with a route, `:2228–2242`. ΩSpin₃ = 0 is still unlocated: R02 |
| R06 (P3) TopK T5 | Repaired | `:2222–2225`, `:2252`: T7's degree −3 entry; G5.4 identifies ko with G3.8's τ_(≥0)KO (main `:1660`) |
| R07 (P3) I7.5 names | Repaired | `:319`, `:2132–2134` are now prose; `grep` finds 0 hits for either name |
| R08 (P3) #1663 | Not repaired | R04 |
| R09 (P3) #886 | Not repaired | R05 |
| R10 (P3) Adams–Atiyah | Repaired | The References entry is deleted |

## Verified sound

### Gate, dependency check, elaboration, probes

- **Gate**, rerun at be5e94d with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's record adds `build=0`.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10) and StringOrientation (11). The roadmap-level loop TB → StringOrientation → EllipticCohomology/BordismFormalGroups → TB is layered at item level (R03 checks the layering).
- **Folder and outside-folder diff.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `sorry` warnings (`:64`, `:84`, `:113`, `:131`).
- **`#check @` probe.** All four elaborated types equal their README statements:
  - smoothing: any `I`, with `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`; `[CompactSpace P] [BoundarylessManifold J P]`.
  - parallelization: `𝓡∂ 3`, `[T2Space M] [SecondCountableTopology M]`, `IsOrientedAtlas … A`.
  - oriented nullbordism: `1 ≤ n → n ≤ 3`, with W in the same universe as M.
  - unoriented nullbordism: `n = 1 ∨ n = 3`.

  The file has no section `variable`s, so no binder can be lost. `signatures.md` lists a phantom "structure `,`" at line 111. It comes from the docstring phrase "structure, which", not from a declaration.
- **Padding probe.** Each `sorry` was replaced by `first | simp | infer_instance | rfl | trivial | aesop`. All four fail: `aesop` makes no progress on `:76`, and the goals at `:104`, `:125` and `:138` stay unsolved. None restates a definition, mirrors a Check or computes a value.
- **Headlines.** The README's headlines are:
  - relative smoothing (B1.6), parallelization and the zero B3.1 entries, all stated;
  - transversality, the bordism groups and their nonzero and Spin entries, Thom's and Wall's rings, the PT isomorphisms, Steenrod/Adams, ABS/KO kernel, realization and transfer images, and the Cayley plane, all named in the docstring with the missing carrier.

  At the pins:
  - there is no Spin structure on a manifold: `RepresentationTheory/Spin/Structure.lean` is the Clifford structure theorem;
  - there is no map-transversality predicate: only `IsTransverseAlong` for vector fields;
  - Mathlib's `Geometry/Manifold/Bordism.lean:82–85` lists the bordism relation as TODO.
- **Lean form.** There is one module docstring and `namespace TauCetiRoadmap.TangentialBordism`, with Layer 2 and Layer 8 section comments. Every declaration is a `theorem` with a docstring. The file has no `set_option`. All four Tau Ceti imports are used (`boundaryChartedSpace`, `boundaryOrientation`, `IsOrientedAtlas`, `IsOrientationPreservingAt`).

### Seeded sample (15 targets) and the locators changed this round

Ids:
- thom1954, atiyahSpin1971, hatcherAT, freedBordism, hatcherSS: manifest ids;
- `4f8edd74`: Milnor–Stasheff, TeXromancers edition;
- `c70bf1f2`: Miller;
- `06e4566a`: Führing;
- `b27fcec7`: Guillou–Weibel v1;
- `f8087fb9`: Baez v4;
- `aa5a2f05`: Benedetti–Lisca v2.

These were fetched through the sources service into a scratch copy of the manifest; the package manifest is unchanged.

| Target | Locator in README | Text at the locator | Result |
| --- | --- | --- | --- |
| 2.1 (B1.6) | Lee Thms 6.10, 6.26, 6.35, 6.36 | paywalled | Not verifiable; statements checked by computation below |
| 2.3 (B1.5) | Munkres Thm 10.6, p.104 | no legal copy | Not verifiable |
| 2.5 (B1.3) | none (constructions on the roadmap's own witnesses) | — | Checks computed; no external claim |
| 2.6 (B1.4) | Mathlib `exists_embedding_euclidean_of_compact` | `WhitneyEmbedding.lean:132` | Pass |
| 2.7 (B1.7) | MS Problem 16-D, p.203; Gompf–Stipsicz §§3.1, 8.3 | `4f8edd74 line 5357`: hypersurface c = c(K^(n+1))/(1+u), s_n = d(n+2−dⁿ); folio 203 at `line 5365`; G–S paywalled | Pass (G–S not verifiable) |
| 3.3 (B2.3) | Thom IV.8 (negative attribution) | thom1954 line 2462: stable comparison only | Pass |
| 4.2 (B4.2) | G–W Thm 6.2, p.18; Miller Ch.1 Thm 11.2 | `b27fcec7 line 752` (p.18, `line 726`); `c70bf1f2 line 1142` (Milnor's F₂[ξ₁,ξ₂,…]) | Pass |
| 5.1 (B5.1) | Miller Ch.1 §§2–3, pp.3–7; Thom §IV.4 IV.6 p.74; IV.8 p.75 | `c70bf1f2 lines 131, 203, 237`; thom1954 lines 2410 (folio 74 at 2424, §5 at 2436) and 2462 (folio 75 at 2464) | Pass |
| 5.2 (B5.2) | Thom IV.8 p.75; StringOrientation S2.2 | as above; #948 `:551` | Pass |
| 6.2 (B4.5) | Thom IV.10, Cor. IV.11, p.77 | thom1954 lines 2528, 2538; folios 76 (2499) and 77 (2545) | Pass |
| 6.6 (B6.2) | Wall Lemmas 7–13, Thm 1, pp.292–311 | the fetched copy is an image-only scan (no OCR here) | Not verifiable |
| 8.5 (B3.5) | MS §16.3, p.194; Lee 21.10, 21.13 | `4f8edd74 lines 5076–5078`, folio 194 at `line 5087`; Lee paywalled | Pass (Source issues) |
| 9.1 (B3.6) | Baez §§3.4, 4.2 | `f8087fb9 line 1297` (OP² and the exceptional Jordan algebra), `line 1768` (F₄) | Pass |
| 9.2 (B3.7) | none (constructions; S1.5 owns F₄/Spin(9)) | — | Volume check computed below |
| 10.3 (B6.5) | Führing Thms 1.1, 1.3, pp.355–357; §9 | `06e4566a line 18` (Thm 1.1, p.355), `line 66` (Thm 1.3, p.356), `line 72` (Remark 1.4, PU(3)⋊ℤ₂), `line 1415` (§9, SO(3), RP²) | Pass |
| 8.1 (changed) | Atiyah Thm 2 p.48; Thm 5 pp.59–60; Prop 4.1, Thm 3′ p.58 | atiyahSpin1971 lines 75, 419, 432, 462 (folios 58 at `line 415`, 59 at `line 450`, 60 at `line 487`) | Pass |
| 8.3 (changed) | Freed Prop 5.55, (5.57), p.45; Hatcher §4.2 p.385 | freedBordism lines 1805, 1817 (page 45); hatcherAT lines 16749–16752 (folio 385 at `line 16729`) | Pass |
| 8.4 (changed) | Thom after IV.12 p.79; IV.13 p.81; Benedetti–Lisca Thm 1, §2.1 | thom1954 lines 2610, 2619 (𝔑₃ = 0), folio 79 (2624); 2686–2688 (Rokhlin, Ω₃), folio 81 (2695); `aa5a2f05 lines 15, 74–98` | Pass |
| 10.1 (changed) | Thom III.2–III.4 p.59; III.9 pp.62–63 | thom1954 lines 1818–1828 (folio 59 at 1834); 1936–1961 (folios 62, 63) | Pass |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=M with f smooth; P a point; M=P=S¹, f=id, C=∅ | g=∅; g=f with the constant homotopy; f constant, so g=f; g≃id has degree 1, a constant map has degree 0 | Pass |
| same, route | P with corners re-charted; tube theorem `TubularNeighborhood/Existence.lean:53` | every point is interior, so extended charts land in interior(range J), which is open in E'; the theorem needs `[I.Boundaryless] [J.Boundaryless] [T2Space N] [SecondCountableTopology N]` and an open O ⊇ range, which V Euclidean and P re-charted satisfy; on C, g̃ = e∘f, so g = r∘e∘f = f | Pass |
| `orientedThreeManifold_parallelization` | ∅; ℍ³ coordinate frame; first vector negated; RP²×ℝ | empty b; det 1; det −1 is excluded; no oriented atlas, so hA is false | Pass |
| `closedOrientedManifold_isOrientedBoundary` | n=1 S¹ with ±o; n=2 genus-g surface; n=3 S³, T³; M=∅ | D² (outward-first, counterclockwise) and −D² by `boundaryOrientation_neg`; handlebody; D⁴, T²×D²; W=∅ | Pass |
| same, negative controls | n=0 point; n=4 CP² | a compact 1-manifold has signed boundary count 0 ≠ 1, excluded by 1≤n; σ(CP²)=1 ≠ 0, excluded by n≤3 | Pass |
| same, binders | `boundaryChartedSpace` (`Boundary/Charts.lean:195`) needs `IsManifold (𝓡∂ (n+1)) 1 W`; the `∃` over `IsManifold … ∞ ∂W` | obtained from ∞; the latter is a Prop discharged by `isManifold_boundary` (`:321`, k=∞≠0); `IsOrientationPreservingAt` (`Preserving.lean:63`) needs `IsManifold _ 1` on both sides | Pass |
| `closedManifold_isBoundary` | n=1 S¹⊔S¹; n=3 RP³, RP²×S¹; n=2 RP²; n=0 point | D²⊔D²; the 8.5 disk bundle of γ_ℂ^⊗2 over CP¹ (n=2), RP²×D²; χ(RP²)=1 is odd, excluded; boundary count even ≠ 1, excluded | Pass |
| 2.1 Checks | t↦(t,0); \|x\|² on ℝⁿ; [0,∞) with t and t²; C=M; circle with r=z/\|z\| | line null in ℝ²; critical set {0}, every c>0 regular; t is regular for f but critical on the stratum {0}; f returned; constant map gives degree 0 | Pass |
| 2.3 Checks | ℝ/ℤ; S³/S¹; mapping tori of S¹; rank-1 and rank-0 discs over a point | S¹; CP¹ with fibre S¹; T², and the Klein bottle with w₁≠0; [−1,1] with 2 boundary points, a point with S⁻¹=∅ | Pass |
| 2.5 Checks | ([0,1],{0,1}); X=A; A=∅ | ∂ = [1]−[0] = (−1,1) ≠ 0 in ℤ²; group 0; absolute group | Pass |
| 2.6 Checks | point; two points; ∅ | ℝ⁰ holds one point; two points need ambient dimension ≥ 1; the empty code | Pass |
| 2.7 quartic | c(K3) = (1+h)⁴(1+4h)⁻¹ | 1+0h+6h²; ⟨h²⟩=4; c₂=24; p₁=c₁²−2c₂=−12h², so −48; σ=−16; Â=2; MS s₂=4(4−16)=−48=c₁²−2c₂ | Pass |
| 2.7 E(1) | F=3H−ΣEᵢ | F²=9−9=0; F·H=3≡H²=1 and F·Eᵢ=1≡Eᵢ²=−1 mod 2, so F is characteristic; χ=3+9=12; σ=1−9=−8; the complement keeps χ (12−0+0) and σ (Novikov) | Pass |
| 3.3 Checks | interval over its endpoints; infinite discrete X | (−1,1), with sum 0; direct sum, not product | Pass |
| 4.2/4.4 | G–W 6.5(3) at ℓ=p, n=2a; degrees | Q_a=βP^a (`b27fcec7 line 744`), so d_r(y^(p−1)⊗z)=−βP^k z; r=2k(p−1)+1; target degree 2kp+2; d₂ sends (1,2) to (3,3), stem 1→0 | Pass |
| 5.1/5.2 | positive point, k=1; reversed frame; four labelled points over {a,b} | degree 1; degree −1; Th=S¹∨S¹, word aba⁻¹b⁻¹ ≠ 1 in F₂ vs 1 for a+,a−,b+,b−; abelianized counts (0,0) | Pass |
| 6.2 Checks | RP²; S² | w=(1+a)³ gives w₁²=w₂=a², i.e. (1,1); (0,0) | Pass |
| 6.3 Checks | H_R(2,4); H_R(1,2); RP², RP¹ | binom(6,2)=15≡1; s₂=3·1−binom(3,1)=0 mod 2 vs binom=1; 3≡1, 2≡0; m=2^r, n=2^(r+1)s gives m+n−1=2^r(2s+1)−1=d | Pass |
| 6.4 new Check | C at p=3 | k=1 excluded (3=3¹), k=2 gives t⁸, k=3 gives t¹², k=4 excluded (9=3²); H₄(MSO;F₃) has dimension 1 = ξ₁ of degree 2(3−1)=4 | Pass |
| 6.6 Checks | ∂₂σ₄; δ(Y₆Y₅); Dold dimension; ρ on a point | σ₂, then ∂₂σ₂=1; Y₅²; 2^r−1+2^(r+1)s=2k−1 (P(1,2) has dimension 5); 1−ρ=2 | Pass |
| 7.2 new Check | π₁ at 2 | π₁MSpin=ℤ/2 vs π₁MSO=0; H̃*(BC₂;F_p)=0 for odd p | Pass |
| 8.1 (Atiyah Thm 5, n=2) | e_i dual to Y_i | φ(s+e_i)−φ(s)=Spin(Y_i); Lie torus q(a)=q(b)=1, q(a+b)=1+1+1=1, Arf=q(a)q(b)=1 | Pass |
| 8.3 η³ route | Ext stems ≤5; d_r(h₁); orders | h₀ⁱ; h₁; h₁²; h₂, h₀h₂, h₀²h₂=h₁³; 0; 0. d_r(h₁)=h₀^(1+r) would truncate the tower; 12ν has order 24/gcd(12,24)=2; 4ν has order 6; 12 mod 8 = 4 | Pass (R01) |
| 8.4 Checks | RP⁴ vs RP²×RP²; CP² | (w₄,w₂²)=(1,0) vs (1,1); σ=1, SW vector (1,1) | Pass |
| 8.5 fibre sign | q=1+j(x+iy)=1+xj−yk | q i q⁻¹ ≈ i−2xk−2yj; in basis (j,k), (0,−2),(−2,0) has det −4 < 0, so degree −1; dimensions 2n and 4n−1 | Pass |
| 9.1 | v=(1,x,y); (1,0); split null a | A₀₁/A₁₁=x̄/N(x)=x⁻¹, A₂₁/A₁₁=yx⁻¹; entries ½ and P²=P; tr(A∘A)=1+2t²N(a) | Pass |
| 9.2 Clifford | (t,a); (1,0), (0,1) | square (t²+N(a))·id; (x,−y) and swap, which anticommute | Pass |
| 9.2 volume (pinned CD rule `(a,b)(c,d)=(ac−d̄b, da+bc̄)`, `CayleyDickson/Basic.lean:202`) | C₀⋯C₈(1,0) | (0,j)(0,k)=(−i,0); (0,i)(−i,0)=(0,−1); (0,1)(0,−1)=(1,0); k·1=k; jk=i; i·i=−1, giving (−1,0); with −C₈, (1,0) | Pass |
| 10.1 | L⁷×L⁷ at 3 | (u₁v₂u₂²−v₁u₂³)(u₁³v₂−v₁u₂³) = −v₁v₂u₁³u₂³, coefficient −1≡2 mod 3 (Thom line 1961) | Pass |
| 10.3 | conjugation on CP²; P(1,2); Ad on su₃ | degree (−1)²=+1; w₂w₃=1 (Thom line 2630); kernel = scalars, and conjugation acts by −1 on the Cartan, with −1 ∉ W(A₂) | Pass |
| Scope layering (R03) | B4.4–B4.6, B5.4 *Needs:* | `:1752`, `:1781`, `:1818`, `:1600`: none uses B3.3, B3.4 or B5.5 | Pass after R03 |

### Library declarations opened at the pins

- **Mathlib:**
  - `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean:132`)
  - `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`)
  - `ContinuousMap.HomotopicRel` (`Topology/Homotopy/Basic.lean:629`)
  - `ModelWithCorners.boundary` (`Geometry/Manifold/IsManifold/InteriorBoundary.lean:112`)
  - `SingularManifold` (`Geometry/Manifold/Bordism.lean:111`, TODO `:82–85`)
- **Tau Ceti, `Geometry/Manifold/`:**
  - `TauCeti.boundaryChartedSpace` (`Boundary/Charts.lean:195`, needs C¹)
  - `TauCeti.isManifold_boundary` (`:321`)
  - `TauCeti.boundaryOrientation` (`Boundary/InducedOrientation.lean:108`) and `_spec` (`:145`)
  - `IsOrientationPreservingAt` (`Orientation/Preserving.lean:63`)
  - `TauCeti.SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`) and `.NormalSpace` (`SmoothEmbedding/NormalSpace/Basic.lean:59`)
  - `exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`, binders `:38–45`)
  - `exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`, sigma-compact, any model with corners)
  - `IsFramedTube` (`PontryaginThom/Basic.lean:72`)
  - `pontryaginThomCollapseMap` (`:136`), `pontryaginThomSphereMap` (`:217`), `_homotopic` (`:149`), `_comp_prodUnitsHomeomorph_homotopic` (`:196`)
  - `exists_isFramedTube` (`PontryaginThom/Existence.lean:68`, trivialization with base set univ)
- **Tau Ceti, other:** `TauCeti.CayleyDickson` multiplication and star (`Algebra/CayleyDickson/Basic.lean:202`, `:220`); `DivisionOctonionReal` (`Quaternion.lean:312`).

### Cross-roadmap citations resolved

- **On main (54fc140):**
  - BordismFormalGroups `:30`, `:172–205`, `:272`, `:2759`.
  - EllipticCohomology E4.S (`:913–980`) and E5 (`:1527–1560`).
  - GeneralizedCohomology G5.4 (`:1559–1660`, ko = τ_(≥0)KO at `:1660`).
  - GeometricTopology on main, whose Layer numbering differs from #903's.
- **At open heads:**
  - StringOrientation #948 (07f0981): S1.3, S1.5, S2.1 (`:526`), S2.2 (`:551`, *Needs:* without BFG), S2.3 (`:607–664`), S5.3 (`:1158–1202`).
  - IndexTheory #1077 (6a51fc7): I2.5 (`:618`), I5.4 (`:1154`), I7.2 (`:1338`), I7.5 (`:1480`, σ=−16α and Rokhlin at `:1496–1497`).
  - AlgebraicTopology #1652 (1f5b3f6): 6.3 (`:1979`), with ∂[D¹]=[+1]−[−1] and comparison units σₙ (`:2260–2295`), and Layer 8.
  - AlgebraicTopology #1663 (a67088d): 8.13 (`:2585`).
  - DifferentialGeometry #886: 5.5b.
  - GeometricTopology #903 (8bd9871): 1.1 (`:570`), tube isotopy uniqueness (`:849`), 4.3.1 (`:3538`), 11.3 (`:13218`).
- **Consumers.** HomotopySpheres #1287 and FourManifolds #936 consume TB B1, B1.6, B3.2 and B5.2, and own none of TB's objects. FourManifolds `:2881` cites Kirby–Melvin for η³.
- **Duplicate names.** `roadmaps grep --lean-only` finds the four Lean names only here.
- **Declared gap.** No plan.json is readable, so `gap:finite-quadratic-arf` is a citation of GeometricTopology 4.3.1 at #903 (unchanged since ~16, which matched every listed item).
- **Overlaps.** No other open pull request changes this roadmap, and none drops an id it cites.

## Not verifiable

- **Munkres**, *Elementary Differential Topology*, Thm 10.6, p.104 (2.3): no legal open copy.
- **Lee**, *Introduction to Smooth Manifolds*, Thms 6.10, 6.26, 6.35, 6.36, 21.10, 21.13 (2.1, 8.5): Springer, paywalled.
- **Gompf–Stipsicz** §§3.1, 8.3 (2.7): AMS, paywalled.
- **Wall 1960**, Lemmas 7–13 and Thm 1 (6.6): the author-page copy is an image-only scan, and OCR is unavailable on this worker.
- **Milnor 1960**, §4 Thms 4–5 (6.4): JSTOR only (as in ~16).
- **Anderson–Brown–Peterson 1967** and **Milnor 1963** (R02): the sources service found no legal open copy, so the theorem number in R02 is for the author to supply.
- **Ownership against GeneralizedCohomology #1187 and HomotopySpheres #284**: these are listed as close in vocabulary, but the brief gives no checkout, so they were not checked. GeneralizedCohomology was checked on main.

## Source issues

- **Misprint** in Milnor–Stasheff (TeXromancers edition) at §16.3, p.194: the source says P^(2n+1)(ℂ) is the total space of a circle bundle over quaternionic projective space; it should be a 2-sphere (ℂP¹) bundle, bounding the associated 3-disk bundle; affects nothing (8.5 already uses the S² fibre).
