# GATE-ClassicalAdicEtaleCohomologyPartII~3: reply to the review of head bcae9a6

The review is one comment by CBirkbeck at 2026-10-26T12:36Z. It has one finding, numbered here as four points in the order they appear:
- H01: the supplier must be ported to the roadmap repository and declared as a prerequisite before #1549;
- H02: the generality must be kept, and the two extension contracts carried into the supplier's plan;
- H03: the section references must be rechecked against the port;
- H04: the reviewer could not open the proof of Hansen's Proposition 4.5.

The "Checks that were sound" section raises no defect. The repairs are in commit `24a6127`. Only `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — answered

The finding is correct, and no README edit can repair it. AdicSpacesPartIIPartII is still only job-board package pull request #1098 (open, head `2fad3dd`); the roadmap index of 2026-10-26T12:52Z has no roadmap pull request for it and main `6fd1c2e` has no folder. It is also the only cited supplier in that state: the README cites 18 other roadmaps, and each is either on main or in an open roadmap pull request listed in this pull request's dependency line. The board's merge order already places AdicSpacesPartIIPartII before this roadmap (lines 11 and 300 of the merge-order file). But the pull-request description's "Dependencies" and "Merge order" paragraphs omit it, as the review says, because they list only roadmap pull requests. The README cites the supplier by roadmap name and section, as the house rules require. This pull request cannot merge before a roadmap pull request porting #1098 exists. The dependency declaration is pull-request text, outside this job.

## H02 (CBirkbeck) — applied differently

The generality is unchanged. README Conventions (line 17) and §7.4 (line 1192) still allow every complete nontrivially valued characteristic-zero K and maps that are proper only over an affinoid base. The supplier's Conventions (its README line 25) and §5.3 (line 863) assume nothing narrower.

The two contracts cannot be carried into the supplier's plan as they stand. The supplier's Scope (its README line 21 at `2fad3dd`) excludes "generic flatness or generic smoothness for arbitrary maps" as a separate theory. Its design names BH §§2.2–2.5 among its non-goals. Yet the proof of BH Theorem 2.29 needs all of BH §§2.2–2.5, including Gabber–Ramero's analytic cotangent complex (BH Theorem 2.12, BH line 366).

So README:80, which said "as a section following §4.7" with route "flatness over every weakly Shilov point … (§§4.4–4.7) … the smooth loci of §§2.1–2.2", is replaced by README:82, "in sections following §4.7 that take in BH §§2.2–2.5". README:82 lists the four inputs that are not supplier targets:
1. Shilov-fibre regularity, from the analytic cotangent complex and Quillen's criterion (BH Theorems 2.12, 2.15, 2.18 and 2.25).
2. Generic flatness, from the reduced-fibre theorem and the formal flatness criterion (BH Theorem 2.21 and Propositions 2.23–2.24).
3. The flat-plus-smooth-fibre criterion (BH Lemma 2.26).
4. Zariski openness of the smooth locus of a map.

It also says that §§2.1–2.2 give only the smooth locus of a space. In the same pattern, the finite-branched-covers route at README:80 now names Lütkebohmert's local extension and Kiehl's product neighbourhoods (Han Lemmas 2.12–2.13, Han line 475 and Han line 482). README:78 now cites BH Theorem 2.29 with §§2.2–2.5 in place of four theorem numbers, and fixes the stale "open U in Y" to "open S_f in Y".

## H03 (CBirkbeck) — answered

No port exists, so the references were rechecked against the package at `2fad3dd`. Every cited section exists there, with the content README:72 and README:80–82 attribute to it:
- §0.1 Zariski closed subsets (line 147);
- §0.2 local dimension (line 177);
- §0.3 nowhere-density criteria (line 207);
- §0.4 proper images (line 223);
- §1.1 normalization (line 272);
- §1.4 irreducible components (line 346);
- §1.7 Riemann extension (line 410);
- §2.1 singular locus (line 453);
- §2.2 smooth equals regular over a perfect field (line 480);
- §4.2 Shilov characterizations, which is BH Proposition 2.2 (line 674);
- §4.4 weakly Shilov points and their density (line 721);
- §§4.5–4.6 Abhyankar bound and the transcendence characterization (lines 745 and 760);
- §4.7 avoidance of nowhere dense Zariski closed sets (line 780);
- §5.3 functorial resolution in characteristic zero with nowhere dense nonreduced locus (line 863);
- §5.4 proper surjections from resolutions, including from the resolution of T_red (line 878).

Layer 4 ends at §4.7 and Layer 5 at §5.4, so both destination slots exist.

## H04 (CBirkbeck) — answered

Han Proposition 4.5 (p.21, Han line 871) is in the cached legal copy (the MPG institutional preprint). It reduces the comparison for open immersions and all constructible coefficients to constant constructible coefficients, using finite-pushforward resolutions and Zariski's main theorem. That is the "finite-cover coefficient generators" step of the §7.2 route (README:1162). The neighbouring steps also match:
- Propositions 4.3–4.4 (Han line 817 and Han line 838): composition, the 2-out-of-3 property and Nagata compactification;
- Proposition 4.6 (Han line 908): a Temkin resolution preserving the regular open;
- Proposition 4.7 (Han line 936): Huber's purity on regular open immersions.

The §7.2 coefficients ℤ/n are finite, so they satisfy Theorem 1.8's hypothesis "#Λ finite or residue characteristic invertible" (Han line 198).

## Build and gate

- `lake build TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`: `Build completed successfully (8976 jobs).` The only warning is `Suggested.lean:70:8: declaration uses 'sorry'`, from the headline `monomial_root_duality`. This reproduces the build the review could not run.
- Gate at `24a6127`: `gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 55 roadmaps, 638 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Signatures

`Suggested.lean` was not edited. Its five elaborated types are the ones in the worker's signature file, and no binder is lost. No README statement that the Lean mirrors (§3.7 monomial root duality) changed, so `#check` was not rerun.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| README:82 route, inputs 1–4, against gap:proper-generic-smoothness | K=ℚ_p, f:Spa K⟨T⟩→Spa K⟨S⟩, S=T² | K⟨T⟩ is free on {1,T} over K⟨S⟩, so f is flat everywhere. Over the Gauss point η the fibre is K_η[T]/(T²−S), a separable quadratic field, so it is smooth. Over 0 the fibre is K[T]/(T²), not smooth. The source smooth locus is W=X∖{0}, whose image {0} is Zariski closed, so S_f=Y∖{0}. That set is dense and Zariski open and contains every type-2 (weakly Shilov) point | holds | route restated |
| Input 1 "hence smooth in characteristic zero" | Frobenius S=T^p over 𝔽_p((t)) | The fibre over η is K_η[T]/(T^p−S), a purely inseparable field: regular but not smooth (BH line 462). S_f=∅ | qualifier needed | kept |
| Input 2 needs a reduced target | Y=Spa K[ε]/(ε²), X=Y_red→Y | Y's single point is weakly Shilov. Tor₁^{K[ε]/(ε²)}(K,K)=K≠0, so f is not flat and Fl=∅ | hypothesis needed | stated |
| "§§2.1–2.2 do not supply the fourth input" | S=T² above | Reg(X)=X, since the disc is smooth over K, but the smooth locus of f is X∖{0} | the two loci differ | sentence added |
| Degenerate cases of the contract | X=∅; Y=∅ | The empty map is smooth, so S_f=Y and every input is vacuous; for Y=∅, S_f=∅=Y | holds | none |
| README:80 Han Lemmas 2.12–2.13 | S=pt, r=1: the Kummer cover yⁿ=X₁ on B¹∖{0}; r=2: yⁿ=X₁X₂ on B²∖V(X₁X₂) | r=1: the extension is the y-disc. r=2: the normalization of K⟨X₁,X₂⟩[y]/(yⁿ−X₁X₂) is normal (an A_{n−1} singularity), not smooth, and finite surjective, so it is a cover in Han's sense (Han line 130). At the origin of B² with D=V(X₁X₂), U≅pt×B²; at a point on D₁ only, U≅S×B¹ | holds | sentence added |
| README:78 locator | BH page markers | BH Theorem 2.29 is at BH line 567, between the p.13 marker (line 539) and the p.14 marker (line 584). §2.2 starts at line 353 (p.8) | p.13; §§2.2–2.5 is pp.8–13 | "pp.11–14" → "p.13 … pp.8–13" |
| README:1277 locator | same | Theorem 2.29 is on p.13, not p.14; Theorem 3.10 (line 764) is on p.17 | "pp.14,17–18" was wrong | → "pp.13,17–18" |
| README:1286, 1290 references | the BH and Han page markers | BH §2.2 starts p.8. Han Theorem 2.6 is at line 409 (p.10) and Lemma 2.13 at line 482 (p.12) | ranges match | BH "§§2.3, pp.11–20" → "§§2.2–2.5, pp.8–20"; Han §2 range added |

## Ownership, citations and sources

- **Ownership.** No construction moved into this roadmap, and no notion moved down. Rigid generic flatness and generic smoothness of maps (BH §§2.2–2.5) have no owner anywhere. The search was by object ("generic smoothness/flatness", "weakly Shilov", "analytic cotangent complex", "Gabber–Ramero", "Zariski-constructible"), across main `6fd1c2e`, the 366 open roadmap pull requests and the board packages' READMEs and designs. Hits are scheme-level only (SchemeAndStackFoundations §4.12, DeligneWeightsAndPurity §7.5) or consume the supplier's weakly Shilov points (AdmissiblePairsAndPadicHodgeStructures).
- **Citation leads.** `roadmaps resolve` lists one lead: README:80, "AdicSpacesPartIIPartII Layer 5: no roadmap … on main or in an open pull request". This is the H01 state; the section exists at `2fad3dd`. The worker's earlier name lead `AdicSpace.henselianComparison_bijective_of_spec` (README:134) is the planned signature of ClassicalAdicEtaleCohomology §2.5 target sheaf-comparison-3-2-9 at its open head (its README line 961). A grep of the pinned Mathlib and Tau Ceti finds no such declaration, and the README does not claim one.
- **Sources.** Read for this job: Han lines 130–140, 186–232, 409–520 and 801–945; BH lines 353–600. All cited texts are in the manifest. No new source was needed, and `needs-references.toml` was not written.
- **Untrusted text.** The review, the pull-request description and the supplier README contain no instruction to run commands, reveal credentials or act outside this job.

## For the worker (not README matters)

- Neither AdicSpacesPartIIPartII gap has been announced to the supplier. Board job #279 has 11 comments, the last at 2026-10-25T18:28Z, and none mentions branched covers or generic smoothness; package pull request #1098 is unchanged at `2fad3dd`.
- When gap:proper-generic-smoothness is announced, it must say that it asks the supplier to take in BH §§2.2–2.5, which its Scope line excludes. If the supplier declines, the contract becomes a Layer 7 target of this roadmap ahead of §7.4. No other roadmap owns it, and the supplier's design groups BH §§2.2–2.5 with the Bhatt–Hansen six functors that this roadmap's Layer 7 develops. That move would require the analytic cotangent complex inputs (BH Theorem 2.12) to be supplied as well, so it is a human decision.
- gap:finite-branched-covers is compatible with the supplier's exclusion of embedded rigid resolution: its route uses only a chart-wise analytified scheme principalization (ResolutionOfSingularitiesCharacteristicZero §7.7), not a rigid embedded-resolution theorem.
- The README's layers are numbered 0–5 and 7; there is no Layer 6. The gate accepts this and no roadmap cites this one's sections, so renumbering would be safe, but this round left it unchanged.
