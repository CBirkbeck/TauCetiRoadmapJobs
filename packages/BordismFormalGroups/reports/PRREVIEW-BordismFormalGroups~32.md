# Review of BordismFormalGroups (pull request #1807 at ac36c47)

**Verdict:** accepted

This is an incremental re-review of 17 changed lines since 3e107fa. Every change in the folder is in `TauCetiRoadmap/BordismFormalGroups/README.md` and comes from one commit (bdcbdaa9). `Suggested.lean` is byte-identical to 3e107fa. Both findings of the previous report are repaired exactly as requested. The changed passages introduce no new defect, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: lines 45–47 now read "StringOrientation consumes F3–F5 and owns the Hovey specialization to MString and its geometric Cayley-plane kernel. EllipticCohomology owns elliptic realization…"; line 427 reads "TangentialBordism consumes these operations, algebras and towers."; and line 1014 ends "…James–Hopf maps of item 3." `grep -c HomotopySpheres` gives 0, and the gate gives `dropped=0`.
- R02 — repaired: lines 330–332 read "for TopologicalKTheory's Bott class u=β=[O(−1)]−1 of its Conventions (O(−1) the tautological line on CP¹=S²)", and lines 31–33 add the owners sentence. `grep -cw TopK` gives 0.

## Verified sound

**Scope of the increment.**
- `git diff --stat 3e107fa..HEAD -- TauCetiRoadmap/BordismFormalGroups` gives 1 file, 9 insertions and 8 deletions.
- Outside the folder, this increment touches only CharacteristicClasses and PadicFunctionalAnalysis. Both are folders this brief names as the pull request's own.
- Over the whole pull request, `git diff --name-only origin/main...HEAD` lists 22 files. Filtering out the fourteen declared folders leaves nothing (grep exit 1).
- Main has not touched this folder since the merge base eaf17b1.
- The pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, toolchain v4.36.0-rc2) are unchanged against origin/main.

**Gate**, re-run at ac36c47 with `--base origin/main`:

```
gate BordismFormalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL
```

The only non-zero rule is `outside-folder=20`. All 20 files lie in the thirteen other folders this brief declares as the pull request's own, and the worker's gate allows them: its `gate.md` records `outside-folder=0 build=0 OK`. That line is not a finding. `dropped`, which failed at 3e107fa, is now 0.

**Dependency check** (`--movable`, content main):

```
depcheck: 230 roadmaps, 2328 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The new edge to TopologicalKTheory points to a roadmap on main. TopologicalKTheory names this roadmap nowhere, on main or at this head (`grep -c BordismFormalGroups` gives 0 both times). It already sits upstream through GeneralizedCohomology, whose README line 38 consumes TopologicalKTheory T1 and T5–T7. The new edge therefore closes no cycle.

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` exits 0 in 5 s. Its only warning is `56:8 declaration uses 'sorry'`.

The elaborated type in `signatures.md` is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`. It matches README lines 270–275, and every binder belongs to the declaration itself. The entries `,` and `and` in `signatures.md` are parse artefacts of the module docstring. The file declares one theorem.

The padding probe of the previous report carries forward because the file is unchanged: `simp`, `rfl` and `infer_instance` each fail. I re-opened the pinned declarations at Tau Ceti 2fd255d9:
- `TauCeti.FormalGroupIso`: `RingTheory/FormalGroup/Hom.lean` line 351.
- `FormalGroup.height`: `Height/Basic.lean` line 200, valued in `ℕ∞`.
- `TauCeti.FormalGroupIso.height_eq`: `Height/Basic.lean` line 346.
- `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`: `Logarithm/InfiniteHeight.lean` line 278.

`IsSepClosed` and `IsAlgClosed` occur nowhere in the pinned `RingTheory/FormalGroup` tree, so no single library lemma closes the theorem.

**Headline theorems.** These are unchanged. Lazard's height classification is stated. The module docstring names each headline that cannot be stated at the pins, with what it lacks: Lubin–Tate, Quillen and Thom, Conner–Floyd, Landweber, the nilpotence and periodicity theorems, smashing and fracture, Tate vanishing, and torus Euler cancellation.

**Cross-roadmap citations resolved (5).**
1. TopologicalKTheory `## Conventions` at this head, line 223. Lines 232–239 identify S² with CP¹ by `[z:1] ↔ z`, take L with transition `z ↦ z`, so that `s₀=z·s∞` and L is the tautological O(−1), and set `β=[L]−1`. On main the same text is at lines 141–157.
2. TopologicalKTheory T4 item 8, line 1117, which sets u=β with `K*(pt)=Z[u,u^−1]`. Because u is invertible there, the u⁻¹ in F2 makes sense.
3. CharacteristicClasses C3, which this increment rewrote. The heading "C3. Projective splitting and integral/mod2 classes" is at line 1212 at this head (line 1000 on main), and line 1355 states `H*(BO(n);F2)=F2[w₁,…,w_n]`. This matches README lines 36–37 and 489.
4. GeneralizedCohomology §G2.11 at this head, line 669 ("Enriched, quasicategorical and monoidal foundations"). Main has none, but it is this pull request's own move.
5. `roadmaps resolve` on the README finds nothing unresolved.

**Overlap leads (`overlaps.md`).**
- #1808: on the local `prreview/1808` ref (d487de89), this folder last changed at 54a7a0cd, which is an ancestor of ac36c47. `git merge-tree` of the two heads conflicts only in AlgebraicCurves, CharacteristicClasses, ClassifyingSpaces and RigidAnalyticGeometry, not in this folder.
- #1854 carries the older text of this folder: `roadmaps show --pr 1854` still has HomotopySpheres at its lines 41, 298 and 884 and "TopK's" at its line 202. `overlaps.md` lists its conflicts with this pull request as `AlgebraicCurves/Suggested.lean` and `CharacteristicClasses/README.md` only.
- The description states that no open pull request must merge before this one.
- No id this README cites is dropped by an open pull request, and the change drops no id. Only consumer clauses were deleted. F4's Toda brackets and F6.2's James construction keep their headings and their ownership sentence (lines 40–41).

**Ownership and duplication.** The change adds no object; it only rewords two citations and deletes three consumer clauses. `roadmaps grep --fixed nonempty_formalGroupIso_iff_height_eq` finds the name only in this pull request: README line 275 and `Suggested.lean` line 56.

**Seeded sample.** The closing sentence of "Steenrod algebras and mod-p Adams towers" (lines 346–427) changed, so I re-read that target's locators at the text. Each one supports the statement as written:
- Ravenel (ravenel-green):
  - Definition 2.2.1, line 3107.
  - Theorem 2.1.1, line 2627, under the standing hypothesis of line 2619 (X connective, H_*(X) of finite type). Part (ii) gives π_*(X)⊗ℤ_p for X of finite type, matching the README's finite-generation clause.
  - Theorem 2.2.3, line 3146, with d_r of bidegree (r, r−1).
  - Theorem 2.3.3, line 3398, the pairing.
  - Theorem 3.1.1, line 3673.
  - Lemma 3.1.4(ii), line 3745, whose image is P_* at odd p and the squares at p=2.
  - Corollaries A1.1.18 (line 18098) and A1.3.13 (line 18732).
- Hatcher (hatcher-at): Theorems 4L.12 (line 21777), 4L.13 (line 21864) and 4L.16 (line 22197), and the unnumbered theorem on printed page 500 (lines 21564–21567), on admissible monomials of excess below n.
- Miller (miller-cobordism): Theorem 11.2, line 1142, printed page 35.
- Guillou–Weibel (guillou-weibel): Definition 6.1 (line 748), Theorem 6.2 (line 752), Proposition 6.4 (line 767) and Theorem 6.5 (line 784).

No other sampled target lies in a changed passage. "Lazard ring, cocycle lemma and Hopf algebroid", "Invariant differential, logarithm and exponential", "Exponent two", "Height and Lazard's classification", "Unoriented coefficients" and "The smoothing-and-triangulation comparison" are untouched, and their verification in the previous reports stands. The README flags no locator as unverified.

**Adversarial table.** The rows marked "carried" cite the previous report (r27); the other rows are computed for this increment.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Owners sentence, lines 31–33 (new): TopologicalKTheory fixes β=[O(−1)]−1 on CP¹=S² | TopologicalKTheory Conventions at this head and on main; wrong model β′=[O(1)]−1 | Supplier: L has transition z↦z and s₀=z·s∞, so L=O(−1) and β=[L]−1, the same as the sentence. Using `K(S²)=Z[β]/(β²)` (supplier line 1110), [O(1)]=(1+β)⁻¹=1−β, so β′=−β ≠ β | true; the citation resolves | none |
| F2 K-theory law, lines 329–333 (reworded) | a=[L⁻¹], b=[M⁻¹] with ux=a−1 and uy=b−1; restriction of x_K(O(1)) to CP¹; inverse series; grading; wrong model β′ | x_K(L⊗M)=u⁻¹(ab−1)=u⁻¹((a−1)+(b−1)+(a−1)(b−1))=x+y+uxy, which is F_K. Restriction: u⁻¹([O(−1)]−1)=u⁻¹β=1, which is "+1". F(x,−x/(1+ux))=(x+ux²−x−ux²)/(1+ux)=0. a₁₁=u has homological degree 2(1+1−1)=2=|u|. Under β′ the restriction is −1, which the "+1" excludes. u is invertible in the supplier's `Z[u,u^−1]` | true | none |
| Steenrod/Adams target, lines 346–427 (closing clause changed; sampled) | degree-one class a of RP^∞; Milnor generator degrees at p=2 and p=3; d₂ bidegree; Moore spectrum M(ℤ/2^∞) | Sq¹a=a² (top square, i=\|a\|) and Sq²a=0 (i>\|a\|). At p=2, \|ξ₂\|=2²−1=3 and \|Q₁\|=2²−1=3. At p=3, \|ξ₁\|=2(3−1)=4, \|τ₀\|=1, \|τ₁\|=5 and \|Q₁\|=2·3−1=5. d₂:(1,2)↦(3,3), t−s from 1 to 0. For M(ℤ/2^∞): lim(ℤ/2^∞)/2^k=0, while derived π₁=T₂(ℤ/2^∞)=ℤ₂ and π₀(X)⊗ℤ₂=ℤ/2^∞. H_*(M;𝔽₂) is 0 in degree 0 and ℤ/2 in degree 1, so it has finite type and is a valid instance | all Checks true; the finite-generation hypothesis is needed and present | none |
| James construction, lines 1002–1019 (consumer clause deleted) | Y=S²; Y=S⁰; wrong model J₂/J₁=S²×S² | J₁=S²; J₂/J₁=S²∧S²=S⁴; H₂(J₂S²)=ℤ·b, while S²×S² gives rank 2 in degree 2; J(S⁰)=ℕ is discrete, while π₀ΩS¹=ℤ | true | none |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 270–275), carried | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p; F=G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p | heights ⊤ and 1 with no iso, so both sides are false; F=G gives the identity, so both are true; the twist has height 1 but no iso over 𝔽_p, so `IsSepClosed` is needed, and it is present | true | none |
| Lemma A2.2.7 general form; universal strict coordinate; obstruction in degree p^k (README 80–87, 139–146, 288–299), carried | f=X^p and X^(p²) over 𝔽_p; height 2 over 𝔽₂ with f=X+X²; control 𝔾ₐ vs 𝔾ₘ over 𝔽₂ | h=1 and h=2 with g=id; ord 4>2 on both sides, degree-2 part 2XY=0; control: coefficient 1, with 1·C₂=XY≠0 | true | none |
| Height, exponent-two, Lazard grading, `lazardGcd`, invariant differential, log/exp, Frobenius-twist and n-series Checks (README 64–79, 122–132, 150–245, 251–269), carried | r14 instances | r14 values | all true | none |
| Toda brackets, Kudo–Borel, Milnor, MU/MO Hurewicz, π₀MO, Serre–Cartan basis, K(n)-local Tate, smooth implies PL, carried | r9 instances | r9 values | all correct | none |

**Remark on untouched text** (not a finding). The README keeps the layout it has on main: the title has no "Roadmap:" prefix, the opening section is "Carriers, conventions and owners", and there are no per-layer `### Examples` and `### Dependencies` headings. This is the existing roadmap's shape, and previous reviews passed it.

**Policy.** The scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`. The changed lines contain no process words.

## Not verifiable

- Bousfield (1979) Theorem 6.6, Thom (1954) Chapitre IV, Quillen (1971), Devinatz–Hopkins–Smith (1988), James (1955), Toda (1962), Johnson–Wilson (1975), Würgler (1976), Greenlees–Sadofsky and Symonds. These are recorded as uncertified, or have no open copy in the cache; they are cited by locator and untouched in this increment.
- Whether TangentialBordism and StringOrientation, at their open heads, consume F2 and F3–F5 as the consumer sentences say. That is for their own reviews; the sentences make no supplier claim of this roadmap.

## Source issues

- none
