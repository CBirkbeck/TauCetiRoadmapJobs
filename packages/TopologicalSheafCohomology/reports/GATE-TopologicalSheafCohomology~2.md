# GATE-TopologicalSheafCohomology~2: answers to human review (head 5305dcd → ac45da40)

## H01 (rwst) — applied
TS1.2 imported finite-cover cofinality from ImplicitAtlases §0.7, which states it only for locally compact Hausdorff spaces (ImplicitAtlases README line 173), while TS1.2 is stated for arbitrary compact X and its own Sierpiński Check lies outside that hypothesis. §1.2 now proves it: a u-small open cover of a `CompactSpace` (no separation axiom) has a finite subcover whose enumeration is a finite indexed cover refining it; the Sierpiński Check now also records that the one-set cover is a finite cover refining every cover, and the ℚ Check remains the non-compact negative control.

## H02 (rwst) — applied
"Vanishing on the empty space is the statement of ImplicitAtlases §0.7" → §1.2 proves it for every presheaf: the empty family covers ∅, refines every cover of ∅ and has the zero complex, so the colimit is zero in every degree. New Check: on X=∅ with P(∅)=ℤ the one-set cover {∅} has H⁰=ℤ, the empty family gives 0; a cover system without the empty family would return ℤ.

## H03 (rwst) — applied
The roadmap no longer consumes ImplicitAtlases: the "From TauCetiRoadmap.ImplicitAtlases" supplier block is deleted and ImplicitAtlases is removed from the *Needs:* lines of §1.2 and §1.4, from How to read the build and from Layer 1 Dependencies. Its suppliers are now Mathlib, Tau Ceti and SchemeAndStackFoundations (on main) only. The sentence in the pull-request description about no open pull request having to merge first is description text outside this folder; with this change it is true again.

## H04 (rwst) — answered
There is no cycle between targets (ImplicitAtlases §0.7 needs only its §0.6 and Mathlib, README line 206; it consumes CharacteristicClasses C1.2b only in §5.5, README line 75). There was a cycle between roadmaps: CharacteristicClasses (on main, README line 449) consumes TS1.1–TS1.2, ImplicitAtlases consumes CharacteristicClasses C1.2b, and TopologicalSheafCohomology consumed ImplicitAtlases §§0.6–0.7. The repair of H03/H05 removes the last edge, so supply runs TopologicalSheafCohomology → CharacteristicClasses → ImplicitAtlases.

## H05 (rwst) — applied
The recommended direction is adopted. §1.4 now constructs the first spectral sequence itself from the filtration of each total complex by internal degree (E₁ = fixed-cover Čech cohomology of the terms, then E₁^(p,q)=Čech^q(X;F^p) after the colimit), proves strong convergence of both sequences with the same bound (internal degree in b,…,m), and drops the identification with the compact-cover hypercohomology of ImplicitAtlases §0.7 (Pardon A.4.10/A.4.11 locators removed). Scope line 10 now says this roadmap owns open-cover Čech cohomology on arbitrary spaces including those two facts and both spectral sequences; Downstream consumers now names ImplicitAtlases §0.7 as a consumer of TS1.2 and §1.4 through its §0.6. The matching change in ImplicitAtlases (consume TS1.2 instead of defining its own open-cover colimit) belongs to that roadmap.

## H06 (rwst) — answered
Correct: the pull-request title and first paragraph describe the scope that now belongs to ImplicitAtlases §§0.5–0.11. The title and description are outside this folder; a description built from the README Summary (line 3) is the fix, e.g. title "Add topological sheaf cohomology roadmap".

## H07 (rwst) — answered
Correct: `Suggested.lean` declares three items (`moduleCohomologyForgetComparison`, `fiberStalkMap`, `properFiniteFiberStalk`), two with `sorry`; the "19 named declarations … with no admissions" sentence of the description is stale and is to be removed with H06.

## H08 (rwst) — answered
Correct: CharacteristicClasses is on main (its README line 449 cites TS1.1–TS1.2), so the description should not list it as pending.

## H09 (rwst) — answered
Agreed: §1.3 states sheafification invariance only for P(∅)=0, and the two-point Check (Čech¹=ℤ against Čech¹(P^#)=0) remains; §1.4 uses that the cohomology presheaves have zero empty value. No change.

## H10 (rwst) — answered
Agreed: the old cone-sign and CW-representative targets are not in this roadmap; the cone sign of closed-subset duality is ImplicitAtlases §0.10's. The double-complex sign convention that remains here is pinned by the unit-square Check of §1.4 (paths contribute −1 and +1). No change.

## H11 (rwst) — answered
Agreed: `properFiniteFiberStalk` carries `[T2Space X]`, `IsProperMap f` and finite fibers and nothing on Y; the empty fiber gives V = Y∖f(X) and F(∅)=0, and the line-with-two-origins Check (stalk ℤ, product ℤ², diagonal map) is the negative control for dropping Hausdorffness of X. No change.

## H12 (rwst) — answered
Agreed: the ℚ Check of §1.2 separates point-neighbourhood cofinality from finite-cover cofinality; it now sits next to the compactness-only proof of the latter (H01). No change.

## H13 (rwst) — answered
The local build passes at ac45da40 (output below). §0.2, the Stacks page numbers and the second spectral sequence beyond the cited passages were not altered here; the first sequence's convergence bound was recomputed on the existing Checks (see the table).

## Build

`lake build TauCetiRoadmap.TopologicalSheafCohomology.Suggested`: `Build completed successfully (8976 jobs).` with the two expected `declaration uses 'sorry'` warnings (lines 32 and 63). `Suggested.lean` is unchanged; its three elaborated signatures were compared with the README statements (binders of the Conventions for the comparison; `T2Space X`, properness and finite fibers for the stalk theorem), and none lost a binder.

## Gate

`gate TopologicalSheafCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 207 roadmaps, 1460 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.

## Ownership

This roadmap is the owner of open-cover Čech cohomology on arbitrary spaces because CharacteristicClasses on main consumes it on paracompact Hausdorff spaces that need not be locally compact, a generality ImplicitAtlases (locally compact Hausdorff only) does not cover; keeping ImplicitAtlases as supplier made a roadmap-level cycle (H04). Checked against ImplicitAtlases at its head 3b7572e0. No new cross-roadmap citation was added; SchemeAndStackFoundations §2.5 is unchanged.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| Finite covers cofinal on compact X | Sierpiński {0,1}; X=∅; ℚ | Sierpiński: every cover contains X, {X} finite refines all; ∅: n=0 family refines all; ℚ: cover (n,n+2)∩ℚ has no finite refinement | holds on compact (incl. non-T2), fails off compact as stated; Sierpiński and ℚ Checks |
| Every degree vanishes on ∅, every presheaf | P(∅)=ℤ | cover {∅}: H⁰=ℤ; empty family: 0 in all degrees; colimit 0 | holds; added as Check (negative control: system without empty family gives ℤ) |
| First spectral sequence E₁^(p,q)=Čech^q(X;F^p) | point, F=ℤ --2→ ℤ in degrees 0,1 | E₁^(0,0)=E₁^(1,0)=ℤ, d₁=2, E₂=ℤ/2 at (1,0), total degree 1 | matches H⁰=0, H¹=ℤ/2 of the existing Check |
| Convergence bound m−b+1 for both sequences | b=−1, m=1; m=−2 | internal degree −1,0,1 with Čech degree 2,1,0: 3 terms; m<b: empty | matches existing Check |
| Internal-degree filtration is a subcomplex filtration | D=δ+(−1)^p d | δ keeps internal degree, d raises it by 1 | holds |
